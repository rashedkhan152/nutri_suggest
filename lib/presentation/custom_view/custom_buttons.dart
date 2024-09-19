import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.padding,
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.deepPurple,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(20),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
