import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicine_app/ui/widgets/gradient_button.dart';

import 'index.dart';

class RegisterScreen extends StatefulWidget {
  static const route = '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  Map<String, String> _formData = {
    'username': '',
    'phone': '',
    'password': '',
  };

  Future<void> _trySubmit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      UserCredential userCredential;
      try {
        setState(() {
          _isLoading = true;
        });
        userCredential = await _auth.signInWithEmailAndPassword(
            email: _formData['login']!, password: _formData['password']!);
        print(userCredential.user);
      } on FirebaseAuthException catch (err) {
        setState(() {
          _isLoading = false;
        });
      } catch (err) {
        print(err);
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  final _RuNumberTextInputFormatter _phoneNumberFormatter =
      _RuNumberTextInputFormatter();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshot) {
        if (userSnapshot.hasData) {
          return StartScreen();
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Text(
                      'Регистрация',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Color(0xFF0B225A),
                            letterSpacing: 0.25,
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      key: ValueKey('username'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 3) {
                          return 'Введите корректные даннык';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _formData['username'] = value!;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          hintStyle: TextStyle(
                              color: Color(0xFF5C698B), letterSpacing: 0.15),
                          hintText: "ФИО",
                          fillColor: Color(0xFFF4F5FC)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      key: ValueKey('phone'),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        alignLabelWithHint: false,
                        hasFloatingPlaceholder: false,
                        fillColor: Color(0xFFF4F5FC),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintStyle: TextStyle(
                            color: Color(0xFF5C698B), letterSpacing: 0.15),
                        labelText: 'Номер телефона',
                        prefixText: '+7 ',
                      ),
                      keyboardType: TextInputType.phone,
                      onSaved: (value) {
                        _formData['phone'] = value!;
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                        _phoneNumberFormatter,
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      key: ValueKey('password'),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'Пароль должен состоять не менее чем из 6 символов';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _formData['password'] = value!;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          hintStyle: TextStyle(
                              color: Color(0xFF5C698B), letterSpacing: 0.15),
                          hintText: "Пароль",
                          fillColor: Color(0xFFF4F5FC)),
                    ),
                    const SizedBox(height: 20),
                    GradientButton(
                      label: 'Зарегистрироваться',
                      onPressed: _trySubmit,
                      padding:
                          EdgeInsets.symmetric(horizontal: 90, vertical: 12),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, StartScreen.route),
                      child: Text(
                        'Продолжить без регистрации',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: Color(0xFF5C698B),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Уже зарегистрированы?',
                          style:
                              Theme.of(context).textTheme.subtitle2?.copyWith(
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
                          onTap: () => Navigator.pushReplacementNamed(
                              context, LoginScreen.route),
                          child: Text(
                            'Вход',
                            style:
                                Theme.of(context).textTheme.subtitle2?.copyWith(
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Format incoming numeric text to fit the format of (###) ###-##-##
class _RuNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newTextLength = newValue.text.length;
    final newText = StringBuffer();
    var selectionIndex = newValue.selection.end;
    var usedSubstringIndex = 0;
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write('${newValue.text.substring(0, usedSubstringIndex = 3)}) ');
      if (newValue.selection.end >= 3) selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write('${newValue.text.substring(3, usedSubstringIndex = 6)}-');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newTextLength >= 9) {
      newText.write('${newValue.text.substring(6, usedSubstringIndex = 8)}-');
      if (newValue.selection.end >= 8) selectionIndex++;
    }
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
