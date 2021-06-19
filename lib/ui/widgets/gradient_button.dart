import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.label,
    this.padding,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final EdgeInsets? padding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF7D98FB),
                Color(0xFFB5C4FD),
              ],
              stops: [0.1, 1],
            ),
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 85, vertical: 12),
        child: Text(
          label,
          style: TextStyle(
            letterSpacing: 0.75,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
