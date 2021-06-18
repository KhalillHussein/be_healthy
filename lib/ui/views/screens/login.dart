import 'package:flutter/material.dart';

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
            Text(
              'Вход',
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.black,
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
            MaterialButton(
              elevation: 2,
              disabledColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.black12
                  : Colors.white12,
              textColor: Colors.white,
              color: Theme.of(context).accentColor,
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: const StadiumBorder(),
              onPressed: () {},
              child: Text(
                'Войти',
                style: TextStyle(
                  letterSpacing: 0.75,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Продолжить без входа',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: Color(0xFF5C698B),
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
