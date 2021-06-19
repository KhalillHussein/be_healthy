import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:dash_chat/dash_chat.dart';

class ChatScreen extends StatefulWidget {
  static const route = '/chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  final ChatUser user = ChatUser(
    name: "Гость",
    uid: "123456789",
    avatar: "https://smcell.org/wp-content/uploads/2019/06/user-avatar-1.png",
  );

  final ChatUser otherUser = ChatUser(
    name: "Специалист",
    uid: "25649654",
    avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
  );

  List<ChatMessage> messages = <ChatMessage>[];
  var m = <ChatMessage>[];

  var i = 0;

  @override
  void initState() {
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

  void onSend(ChatMessage message) {
    print(message.toJson());
    FirebaseFirestore.instance
        .collection('users')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(message.toJson());
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
          'Онлайн-консультация',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Color(0xFF0B225A),
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .orderBy("createdAt")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
              );
            } else {
              List<DocumentSnapshot> items = snapshot.data!.docs;
              var messages =
                  items.map((i) => ChatMessage.fromJson(i.data()!)).toList();
              return DashChat(
                key: _chatViewKey,
                inverted: false,
                onSend: onSend,
                sendOnEnter: true,
                textInputAction: TextInputAction.send,
                user: user,
                messageDecorationBuilder: (message, isUser) => BoxDecoration(
                  color: isUser! ? Color(0xFFD9DCF2) : Color(0xFF7D98FB),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft:
                        !isUser ? Radius.circular(0) : Radius.circular(20.0),
                    bottomRight:
                        isUser ? Radius.circular(0) : Radius.circular(20.0),
                  ),
                ),
                inputDecoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    hintStyle: TextStyle(
                        color: Color(0xFF5C698B), letterSpacing: 0.15),
                    hintText: "Введите сообщение",
                    fillColor: Color(0xFFF4F5FC)),
                dateFormat: DateFormat.yMMMMEEEEd('Ru'),
                timeFormat: DateFormat('HH:mm'),
                messages: messages,
                showUserAvatar: true,
                showAvatarForEveryMessage: false,
                scrollToBottom: false,
                onPressAvatar: (ChatUser user) {
                  print("OnPressAvatar: ${user.name}");
                },
                onLongPressAvatar: (ChatUser user) {
                  print("OnLongPressAvatar: ${user.name}");
                },
                inputMaxLines: 5,
                messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
                alwaysShowSend: true,
                inputTextStyle: TextStyle(fontSize: 16.0),
                inputContainerStyle: BoxDecoration(
                  border: Border.all(width: 0.0),
                  color: Colors.white,
                ),
                onQuickReply: (Reply reply) {
                  setState(() {
                    messages.add(ChatMessage(
                        text: reply.value,
                        createdAt: DateTime.now(),
                        user: user));

                    messages = [...messages];
                  });

                  Timer(Duration(milliseconds: 300), () {
                    _chatViewKey.currentState!.scrollController
                      ..animateTo(
                        _chatViewKey.currentState!.scrollController.position
                            .maxScrollExtent,
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
                trailing: <Widget>[
                  IconButton(
                    icon: Icon(Icons.photo),
                    onPressed: () async {
                      final picker = ImagePicker();
                      PickedFile? result = await picker.getImage(
                        source: ImageSource.gallery,
                        imageQuality: 80,
                        maxHeight: 400,
                        maxWidth: 400,
                      );

                      if (result != null) {
                        final Reference storageRef =
                            FirebaseStorage.instance.ref().child("chat_images");

                        final taskSnapshot = await storageRef.putFile(
                          File(result.path),
                          SettableMetadata(
                            contentType: 'image/jpg',
                          ),
                        );

                        String url = await taskSnapshot.ref.getDownloadURL();
                        ChatMessage message =
                            ChatMessage(text: "", user: user, image: url);
                        FirebaseFirestore.instance
                            .collection('users')
                            .add(message.toJson());
                      }
                    },
                  )
                ],
              );
            }
          }),
    );
  }
}
