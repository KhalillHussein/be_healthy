import 'package:flutter/material.dart';
import 'package:medicine_app/ui/views/screens/index.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Вы не авторизованы.',
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: Color(0xFF0B225A),
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    letterSpacing: 0.5,
                  ),
            ),
            const SizedBox(
              width: 3,
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.pushReplacementNamed(context, LoginScreen.route),
              child: Text(
                'Авторизация',
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      letterSpacing: 0.5,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
