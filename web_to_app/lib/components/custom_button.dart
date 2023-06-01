import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Icon iconData;
  final String buttonTitle;
  final VoidCallback onPressed;
  final double? ancho;
  final Color? backGroundColor;
  const CustomButton({
    super.key,
    this.backGroundColor,
    this.ancho,
    required this.iconData,
    required this.buttonTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ancho ?? 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor ?? const Color(0xFF444444),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconData,
            Text(buttonTitle),
          ],
        ),
      ),
    );
  }
}
