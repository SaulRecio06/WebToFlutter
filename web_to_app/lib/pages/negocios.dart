import 'package:flutter/material.dart';
import '../main.dart';
import '../utils/classProducto.dart';

var arrayTiendaProductos;
var _response;
bool _isLoading = true;

class BusinessPage extends StatefulWidget {
  const BusinessPage({Key? key, required value}) : super(key: key);

  @override
  State<BusinessPage> createState() => _BusinessPage();
}

class _BusinessPage extends State<BusinessPage> {
  @override
  void initState() {
    super.initState();
    getPrueba();
  }

  Future<void> getPrueba() async {
    _response = await fetchDatos(value);

    setState(() {
      _isLoading = false;
    });
    for (var element in _response) {
      print(element["orden"]);
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: const Drawer(
            elevation: 16.0,
            child: DrawerHeader(
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 24,
                  ),
                  Text(
                    "¿Tienes un negocio? Vende co...",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            )),
        appBar: AppBar(
            toolbarHeight: 100,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: DefaultTextStyle.merge(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/img/logo-aqui-pido.png",
                    height: 100,
                  ),
                  const Column(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.black,
                      ),
                      Text("Favoritos")
                    ],
                  ),
                  const Text("|",
                      style: TextStyle(
                        fontSize: 36,
                      )),
                  const Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: Colors.black,
                          ),
                          Text("0")
                        ],
                      ),
                      Text("Mi pedido")
                    ],
                  ),
                  IconButton(
                      onPressed: () =>
                          _scaffoldKey.currentState!.openEndDrawer(),
                      icon: const Icon(
                        Icons.menu,
                        size: 24,
                        color: Colors.black,
                      ))
                  // const Icon(
                  //   Icons.menu,
                  //   color: Colors.black,
                  // )
                ],
              ),
              style: const TextStyle(color: Colors.black),
            )),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            width: width,
            height: height,
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _response.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = _response[index];
                      if (item is List<dynamic>) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text([item].toString()),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: item.length,
                              itemBuilder: (context, subIndex) {
                                return ListTile(
                                  title: Text(item[subIndex]),
                                );
                              },
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            Text(
                              item["descripcion"].toString(),
                              style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemCount: item["productos"].length,
                                itemBuilder: (context, subIndex2) {
                                  return Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors
                                                .white, // Color de fondo del container
                                            borderRadius: BorderRadius.circular(
                                                10), // Borde redondeado con radio de 10
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(
                                                    0.5), // Color de sombra
                                                spreadRadius:
                                                    2, // Radio de expansión de la sombra
                                                blurRadius:
                                                    5, // Radio de desenfoque de la sombra
                                                offset: const Offset(0,
                                                    3), // Desplazamiento de la sombra (eje X, eje Y)
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 150,
                                                    width: 150,
                                                    child: Image.network(
                                                        // ignore: prefer_interpolation_to_compose_strings
                                                        "https://aquipide.com/api/img/" +
                                                            item["productos"]
                                                                    [subIndex2]
                                                                ["imagen"]),
                                                  ),
                                                  RichText(
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      text: item["productos"]
                                                          [subIndex2]["nombre"],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: TextSpan(
                                                        text:
                                                            "${item["productos"][subIndex2]["tamanos"][0]["precio"]}.00",
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  RichText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: TextSpan(
                                                        text: item["productos"]
                                                                [subIndex2]
                                                            ["descripcion"],
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.grey),
                                                      )),
                                                  ElevatedButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                          "SELECCIONAR"))
                                                ]),
                                          )));
                                })
                            // Text(item["productos"].toString())
                            // ListView.builder(
                            //   scrollDirection: Axis.vertical,
                            //   shrinkWrap: true,
                            //   itemCount: item["productos"].length,
                            //   itemBuilder: (context, int index) {
                            //     const Text("");
                            //   },
                            // )
                          ],
                        );
                      }
                    }),
          )
        ])));
  }
}
