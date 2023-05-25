import 'package:flutter/material.dart';
import 'package:web_to_app/utils/fetch_productos.dart';

import '../entities/product.dart';

class ProductCard extends StatelessWidget {
  final Producto producto;
  const ProductCard({
    super.key,
    required this.producto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(producto.imagen),
          Text(producto.nombre),
          Text(producto.tamanos[0].precio),
          Text(producto.descripcion),
        ],
      ),
    );
  }
}
