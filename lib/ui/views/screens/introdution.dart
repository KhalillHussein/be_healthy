import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:medicine_app/ui/views/screens/index.dart';

class IntrodutionScreen extends StatefulWidget {
  static const route = '/';

  @override
  _IntrodutionScreenState createState() => _IntrodutionScreenState();
}

class _IntrodutionScreenState extends State<IntrodutionScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushNamed(LoginScreen.route);
  }

  Widget _buildImage(
    String assetName,
  ) {
    return Image.asset('assets/$assetName');
  }

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      contentMargin: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: Color(0xFF0B225A),
        letterSpacing: 0.15,
      ),
      bodyTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: Color(0xFF5C698B),
            letterSpacing: 0.5,
          ),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.only(bottom: 8),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Привет!",
          body:
              "Это приложение поможет тебе следить за своим здоровьем, а так же проконсультироваться о его состоянии с врачем",
          image: _buildImage('first.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Как пользоваться?",
          body:
              "Для использования полного функционала приложения необходимо войти, но поконсультироваться с дежурным врачем можно и без входа",
          image: _buildImage('second.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      // showSkipButton: true,
      showDoneButton: false,
      showNextButton: false,
      skipFlex: 0,
      nextFlex: 0,
      globalFooter: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: MaterialButton(
          elevation: 2,
          disabledColor: Theme.of(context).brightness == Brightness.light
              ? Colors.black12
              : Colors.white12,
          textColor: Colors.white,
          color: Theme.of(context).accentColor,
          shape: const StadiumBorder(),
          onPressed: () {
            print(introKey.currentState?.controller.page);
            introKey.currentState?.controller.page != 1
                ? introKey.currentState?.controller.nextPage(
                    duration: Duration(milliseconds: 250), curve: Curves.easeIn)
                : _onIntroEnd(context);
          },
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
          child: Text(
            'Продолжить',
            style: TextStyle(
              letterSpacing: 0.75,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      //rtl: true, // Display as right-to-left
      // skip: const Text('Skip'),
      // done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      // controlsMargin: const EdgeInsets.all(4),
      // controlsPadding: const EdgeInsets.all(1.0),
      dotsDecorator: DotsDecorator(
        spacing: EdgeInsets.all(3),
        size: Size(10.0, 10.0),
        color: Color(0xFFEFEEF2),
        activeColor: Theme.of(context).accentColor,
        // activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
