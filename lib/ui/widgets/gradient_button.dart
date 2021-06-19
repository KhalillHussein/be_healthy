import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GradientButton(
      elevation: 0,
      increaseHeightBy: 7,
      shapeRadius: BorderRadius.all(Radius.circular(12.0)),
      increaseWidthBy: double.infinity,
      shadowColor: Colors.transparent,
      child: Text(label),
      callback: onPressed,
      gradient: LinearGradient(
        colors: <Color>[
          Color(0xFF7D98FB),
          Color(0xFFB5C4FD),
        ],
        stops: [0.1, 1],
      ),
    );
  }
}
