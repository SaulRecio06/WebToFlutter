import 'package:web_to_app/entities/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Producto>> fetchProducts(int idTienda) async {
  final body = jsonEncode({
    'idTienda': idTienda,
  });

  final headers = {
    'Content-Type': 'application/json',
  };

  final response = await http.post(
      Uri.parse('https://www.aquipide.com/api/?u=getCategoriasProductosTienda'),
      headers: headers,
      body: body);

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final List<Producto> productos = [];
    for (var productoJson in jsonData['data'][0]['productos']) {
      final List<dynamic> tamanoData = productoJson['tamanos'];

      final List<Tamanio> tamanos = [];
      for (var tamanoData in tamanoData) {
        final tamano = Tamanio(
            idTamano: tamanoData['idTamano'],
            idTienda: tamanoData['idTienda'],
            idProducto: tamanoData['idProducto'],
            nombre: tamanoData['nombre'],
            precio: tamanoData['precioprecio']);

        tamanos.add(tamano);
      }
      final List<dynamic> extrasJson = productoJson['extras'];
      final List<Extra> extras = [];
      for (var extraData in extrasJson) {
        final List<dynamic> extraPrecioJson = extraData['precios'];
        final List<ExtraPrecio> extraPrecios = [];
        for (var extraPreciosData in extraPrecioJson) {
          final extraPrecio = ExtraPrecio(
              idTamano: extraPreciosData['idTamano'],
              nombre: extraPreciosData['nombre'],
              precio: extraPreciosData['precio']);
          extraPrecios.add(extraPrecio);
        }

        final extra = Extra(
          idExtra: extraData['idExtra'],
          idTamano: extraData['idTamano'],
          precio: extraData['precio'],
          nombre: extraData['nombre'],
          sugerido: extraData['sugerido'],
          precios: extraPrecios,
        );

        extras.add(extra);
      }

      final producto = Producto(
        idTienda: productoJson['idTienda'],
        idCategoria: productoJson['idCategoria'],
        idProducto: productoJson['idProducto'],
        nombre: productoJson['nombre'],
        descripcion: productoJson['descripcion'],
        estatus: productoJson['estatus'],
        visible: productoJson['visible'],
        imagen: productoJson['imagen'],
        precioPromocion: productoJson['precioPromocion'],
        vigenciaPromocion: productoJson['vigenciaPromocion'],
        numeroExtrasIngredientes: productoJson['numeroExtrasIngredientes'],
        visitas: productoJson['visitas'],
        pedidos: productoJson['pedidos'],
        createdBy: productoJson['createdBy'],
        createdAt: productoJson['createdAt'],
        modifiedBy: productoJson['modifiedBy'],
        modifiedAt: productoJson['modifiedAt'],
        descCategoria: productoJson['descCategoria'],
        imagenCategoria: productoJson['imagenCategoria'],
        whatis: productoJson['whatis'],
        tamanos: tamanos,
        extras: extras,
      );

      productos.add(producto);
    }

    return productos;
  } else {
    throw Exception('Error al cargar las tiendas');
  }
}
