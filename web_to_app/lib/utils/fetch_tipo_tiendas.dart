import 'package:http/http.dart' as http;

FetchTipoTiendas(Uri url) async {
  final response = await http.get(url);

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print('Error:${response.statusCode}');
  }

  return response;
}
