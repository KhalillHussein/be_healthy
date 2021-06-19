import 'dart:async';
import 'dart:io';
import 'dart:convert';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:dash_chat/dash_chat.dart';
import 'package:http/http.dart' as http;

class SymptomChatScreen extends StatefulWidget {
  static const route = '/symptom_chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<SymptomChatScreen> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  final ChatUser user = ChatUser(
    name: "Гость",
    uid: "123456789",
    avatar:
        "https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg",
  );

  ChatUser otherUser = ChatUser(
    name: "Бот",
    uid: "25649654",
    avatar:
        "https://image.freepik.com/free-vector/medical-robot-android_111928-2.jpg",
  );

  List<ChatMessage> messages = <ChatMessage>[];
  var m = <ChatMessage>[];

  var i = 0;

  @override
  void initState() {
    messages.add(
      ChatMessage(
        text: 'Здравствуйте! Введите жалобу',
        user: ChatUser(
          name: "Бот",
          uid: "25649654",
          avatar:
              "https://image.freepik.com/free-vector/medical-robot-android_111928-2.jpg",
        ),
      ),
    );
    super.initState();
  }

  void systemMessage() {
    Timer(Duration(milliseconds: 300), () {
      if (i < 6) {
        setState(() {
          messages = [...messages, m[i]];
        });
        i++;
      }
      Timer(Duration(milliseconds: 300), () {
        _chatViewKey.currentState!.scrollController
          ..animateTo(
            _chatViewKey
                .currentState!.scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
      });
    });
  }

  void onSend(ChatMessage message) async {
    setState(() {
      messages.add(message);
    });

    Map res = {};
    List<Widget> buttons = [];
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://lod.medlinx.online/terminology/api/v1/fhir/ValueSet/\$expand?url=http://terminology.medlinx.online/ValueSet/helzy-search-vs&displayLanguage=ru&offset=0&count=10&filter=${message.text}'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());

      res = jsonDecode(await response.stream.bytesToString());
      for (Map button in res['expansion']['contains']) {
        /*       buttons.add(
          FloatingActionButton.extended(
            onPressed: () => {},
            label: Text(
              button['display'],
            ),
          ),
        ); */
        setState(() {
          messages.add(
            ChatMessage(buttons: [
              Container(
                margin: EdgeInsets.all(12),
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.white,
                  onPressed: () => {
                    onSend(
                      ChatMessage(text: button['display'], user: user),
                    )
                  },
                  icon: Icon(Icons.check_rounded),
                  label: Text('Выбрать'),
                ),
              ),
            ], text: button['display'], user: otherUser),
          );
        });
      }

/*       setState(() {
        messages.add(
          ChatMessage(
              buttons: buttons,
              text: res['expansion']['contains'].toString(),
              user: otherUser),
        );
      }); */
    } else {
      print(response.reasonPhrase);
    }

    print(message.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 0.0,
        leading: IconButton(
          icon: Image.asset('assets/Back.png'),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Симптом-чекер бот',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Color(0xFF0B225A),
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
        ),
      ),
      body: DashChat(
        inputToolbarPadding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
        sendButtonBuilder: (Function onSend) => SizedBox(),
        key: _chatViewKey,
        inverted: false,
        onSend: onSend,
        sendOnEnter: true,
        textInputAction: TextInputAction.send,
        user: user,
        scrollController:
            ScrollController(initialScrollOffset: 100, keepScrollOffset: true),
        messageDecorationBuilder: (message, isUser) => BoxDecoration(
          color: isUser! ? Color(0xFF565C8B) : Color(0xFF7D98FB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: !isUser ? Radius.circular(20) : Radius.circular(20.0),
            bottomRight: isUser ? Radius.circular(20) : Radius.circular(20.0),
          ),
        ),
        inputDecoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            hintStyle: TextStyle(
                color: Color(0xFF5C698B),
                letterSpacing: 0.15,
                fontSize: 15,
                fontWeight: FontWeight.w400),
            hintText: "Введите сообщение",
            fillColor: Color(0xFFF4F5FC)),
        dateFormat: DateFormat.MMMMd('Ru'),
        timeFormat: DateFormat('HH:mm'),
        dateBuilder: (date) => Text(
          date,
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Color(0xFF5C698B),
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
        ),
        messageButtonsBuilder: (cm) => [
          SingleChildScrollView(
            child: Wrap(children: cm.buttons ?? []),
          )
        ],
        messages: messages,
        showUserAvatar: true,
        showAvatarForEveryMessage: false,
        scrollToBottom: false,
        inputMaxLines: 5,
        messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
        alwaysShowSend: true,
        inputTextStyle: TextStyle(fontSize: 16.0),
        inputContainerStyle: BoxDecoration(
          color: Colors.transparent,
        ),
        onQuickReply: (Reply reply) {
          setState(() {
            messages.add(ChatMessage(
                text: reply.value, createdAt: DateTime.now(), user: user));

            messages = [...messages];
          });

          Timer(Duration(milliseconds: 300), () {
            _chatViewKey.currentState!.scrollController
              ..animateTo(
                _chatViewKey
                    .currentState!.scrollController.position.maxScrollExtent,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 300),
              );

            if (i == 0) {
              systemMessage();
              Timer(Duration(milliseconds: 600), () {
                systemMessage();
              });
            } else {
              systemMessage();
            }
          });
        },
        onLoadEarlier: () {
          print("laoding...");
        },
        shouldShowLoadEarlier: false,
        showTraillingBeforeSend: true,
        leading: [
          IconButton(
            icon: Icon(
              Icons.photo,
              color: Color(0xFF5C698B),
            ),
            onPressed: () async {
              final picker = ImagePicker();
              PickedFile? result = await picker.getImage(
                source: ImageSource.gallery,
                imageQuality: 80,
                maxHeight: 400,
                maxWidth: 400,
              );
            },
          )
        ],
      ),
    );
  }
}
