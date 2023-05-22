import 'package:flutter/material.dart';

class TipoTiendaChip extends StatelessWidget {
  final String imageUrl;
  final String label;
  final VoidCallback onPressed;

  TipoTiendaChip({
    super.key,
    required this.imageUrl,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.grey,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(width: 10),
          Text(label),
        ],
      ),
    );
  }
}
