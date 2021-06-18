import 'package:flutter/material.dart';
import 'package:medicine_app/ui/views/screens/chat.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, ChatScreen.route),
        child: const Text('Чат'),
      ),
    );
  }
}
