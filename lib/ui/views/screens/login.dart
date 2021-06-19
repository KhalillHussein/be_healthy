import 'package:flutter/material.dart';
import 'package:medicine_app/ui/widgets/gradient_button.dart';

import 'index.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(flex: 3),
            Text(
              'Вход',
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Color(0xFF0B225A),
                  ),
            ),
            const SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  hintStyle:
                      TextStyle(color: Color(0xFF5C698B), letterSpacing: 0.15),
                  hintText: "Логин",
                  fillColor: Color(0xFFF4F5FC)),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  hintStyle:
                      TextStyle(color: Color(0xFF5C698B), letterSpacing: 0.15),
                  hintText: "Пароль",
                  fillColor: Color(0xFFF4F5FC)),
            ),
            const SizedBox(height: 20),
            GradientButton(
              label: 'Войти',
              onPressed: () {},
              padding: EdgeInsets.symmetric(horizontal: 143, vertical: 12),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () =>
                  Navigator.pushReplacementNamed(context, StartScreen.route),
              child: Text(
                'Продолжить без входа',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: Color(0xFF5C698B),
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            Spacer(
              flex: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Впервые здесь?',
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
                  onTap: () {},
                  child: Text(
                    'Регистрация',
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
            Spacer(),
          ],
        ),
      ),
    );
  }
}
