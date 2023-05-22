import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String img;
  final String title;
  final String descripcion;

  final TextStyle? titleStyle;
  final TextStyle? descripocionStyle;

  const ServiceCard({
    super.key,
    required this.img,
    required this.descripcion,
    required this.title,
    this.titleStyle,
    this.descripocionStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.only(left: 40),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(children: [
            Image.asset(img),
            const SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: titleStyle,
            ),
          ]),
          const SizedBox(
            height: 10,
          ),
          Text(
            descripcion,
            style: descripocionStyle,
          ),
        ],
      ),
    );
  }
}
