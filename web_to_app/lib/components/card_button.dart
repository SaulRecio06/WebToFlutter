import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final VoidCallback onTap;
  final String cardTitle;
  final String cardImage;
  final double? ancho;
  final double? alto;
  final ButtonStyle? buttonStyle;
  const CardButton({
    super.key,
    this.buttonStyle,
    this.alto,
    this.ancho,
    required this.cardImage,
    required this.cardTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          width: ancho ?? 350,
          height: alto ?? 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(cardImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cardTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
