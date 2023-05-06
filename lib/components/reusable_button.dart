import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final Color color;
  final Color textColor;
  const ReusableButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 60,
      padding: const EdgeInsets.all(20),
      textColor: textColor,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
