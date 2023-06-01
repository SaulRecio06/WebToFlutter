import 'package:http/http.dart' as http;
import 'dart:convert';

fetchDatos(int id) async {
  final body = jsonEncode({
    'idTienda': id,
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
    // print(jsonData); // Imprime la respuesta del servidor\

    return jsonData["data"];
    // print(jsonData["data"][0]["orden"]);
  } else {
    print('Error en la solicitud: ${response.statusCode}');
  }
}
