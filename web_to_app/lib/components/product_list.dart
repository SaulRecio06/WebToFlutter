import 'package:flutter/material.dart';
import 'package:web_to_app/entities/product.dart';
import 'package:web_to_app/utils/fetch_productos.dart';

class ProducList extends StatefulWidget {
  final int idTienda;
  const ProducList({
    super.key,
    required this.idTienda,
  });

  @override
  State<ProducList> createState() => _ProducListState();
}

class _ProducListState extends State<ProducList> {
  List<Producto> productos = [];
  @override
  void initState() {
    super.initState();
    fetchProductos();
  }

  fetchProductos() async {
    var fetchedProductos = await fetchProducts(widget.idTienda);
    setState(() {
      productos = fetchedProductos;
    });
  }

  fetchData() {}
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
