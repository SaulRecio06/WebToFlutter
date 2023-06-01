import 'package:flutter/material.dart';
import 'package:web_to_app/utils/fetch_tipo_tiendas.dart';

import '../entities/tiendas.dart';
import '../main.dart';

class Autocompletetienda extends StatefulWidget {
  const Autocompletetienda({super.key});

  @override
  State<Autocompletetienda> createState() => _AutocompletetiendaState();
}

class _AutocompletetiendaState extends State<Autocompletetienda> {
  List<Tienda> tiendas = [];
  @override
  void initState() {
    super.initState();
    cargarTiendas();
  }

  Future<void> cargarTiendas() async {
    try {
      List<Tienda> tiendasCargadas = await fetchTiendas();
      setState(() {
        tiendas = tiendasCargadas;
      });
    } catch (e) {
      print('Error al cargar las tiendas:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Tienda>(
      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return [];
        }
        return tiendas.where((element) {
          return element.nombreComercial
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        }).toList();
      },
      onSelected: (Tienda selectedTienda) {
        value = selectedTienda.idTienda;
      },
      displayStringForOption: (Tienda option) {
        return option.nombreComercial;
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.red,
            border: OutlineInputBorder(),
            hintText:
                'Busca restaurantes(pizza, hamburgesa, sushi, italiano, etc)',
            hintStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          style: const TextStyle(color: Colors.white),
        );
      },
    );
  }
}
