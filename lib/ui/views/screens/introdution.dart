import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:medicine_app/ui/views/screens/index.dart';
import 'package:medicine_app/ui/widgets/gradient_button.dart';

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

  Widget _buildImage(String assetName) {
    return Image.asset('assets/$assetName');
  }

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      imageFlex: 4,
      bodyFlex: 3,
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
      imagePadding: EdgeInsets.only(bottom: 14),
      // descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      // titlePadding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 16.0),
      pageColor: Colors.white,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Привет!",
          body: "Это приложение поможет тебе следить за своим здоровьем",
          image: _buildImage('first.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Как пользоваться?",
          body:
              "Отслеживайте состояние своего здоровья, консультируйтесь со специалистом",
          image: _buildImage('second.png'),
          decoration: pageDecoration,
        ),
      ],
      // onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      // showSkipButton: true,
      showDoneButton: false,
      showNextButton: false,
      skipFlex: 0,
      nextFlex: 0,
      globalFooter: Padding(
        padding: const EdgeInsets.only(bottom: 80.0, left: 80, right: 80),
        child: CustomGradientButton(
          label: 'Продолжить',
          onPressed: () {
            introKey.currentState?.controller.page != 1
                ? introKey.currentState?.controller.nextPage(
                    duration: Duration(milliseconds: 250), curve: Curves.easeIn)
                : _onIntroEnd(context);
          },
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
