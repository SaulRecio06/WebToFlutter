import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_to_app/entities/tiendas.dart';

Future<List<Tienda>> fetchTiendas() async {
  final response = await http
      .get(Uri.parse('https://www.aquipide.com/api/?u=getTiendasConsumidor'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);

    if (jsonData['estatus'] == 200) {
      final List<dynamic> tiendasData = jsonData['data'];
      List<Tienda> tiendas = [];

      for (var tiendaData in tiendasData) {
        final List<dynamic> etiquetasData = tiendaData['etiquetas'];
        List<Etiqueta> etiquetas = [];

        for (var etiquetaData in etiquetasData) {
          final etiqueta = Etiqueta(
            idEtiqueta: etiquetaData['idEtiqueta'],
            nombreEtiqueta: etiquetaData['nombreEtiqueta'],
          );
          etiquetas.add(etiqueta);
        }

        final tienda = Tienda(
          idTienda: tiendaData['idTienda'],
          logoTienda: tiendaData['logoTienda'],
          nombreComercial: tiendaData['nombreComercial'],
          telefono: tiendaData['telefono'],
          giroComercialDesc: tiendaData['giroComercialDesc'],
          giroComercial: tiendaData['girocomercial'],
          urlPerzonalizada: tiendaData['urlPersonalizada'],
          etiquetas: etiquetas,
        );

        tiendas.add(tienda);
      }
      return tiendas;
    } else {
      throw Exception('Error en la operación: ${jsonData['mensaje']}');
    }
  } else {
    throw Exception('Error al cargar las tiendas');
  }
}
