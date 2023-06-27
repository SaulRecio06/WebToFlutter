import 'package:flutter/material.dart';
import 'package:web_to_app/pages/cart.dart';
import 'package:web_to_app/pages/extras.dart';
import '../main.dart';
import '../utils/classProducto.dart';

var arrayTiendaProductos;
var _response;
bool _isLoading = true;
double width = 0;
double height = 0;

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
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
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
                    style: TextStyle(fontSize: 16),
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
                    height: 80,
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
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              icon: const Icon(Icons.shopping_bag,
                                  color: Colors.black),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const CartPage()));
                              }),
                          const Text("0")
                        ],
                      ),
                      const Text("Mi pedido")
                    ],
                  ),
                  IconButton(
                      onPressed: () =>
                          _scaffoldKey.currentState!.openEndDrawer(),
                      icon: const Icon(
                        Icons.menu,
                        size: 24,
                        color: Colors.black,
                      )),
                ],
              ),
              style: const TextStyle(color: Colors.black),
            )),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          SizedBox(
            width: width,
            height: height - 100,
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
                                                      onPressed: () {
                                                        // print(item["productos"]
                                                        //         [subIndex2]
                                                        //     .runtimeType);
                                                        // openExtras(
                                                        //     item["productos"]
                                                        //         [subIndex2]);
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        ExtrasPage(
                                                                          datos:
                                                                              item["productos"][subIndex2],
                                                                        )));
                                                      },
                                                      child: const Center(
                                                          child: Text(
                                                              "SELECCIONAR"))),
                                                ]),
                                          )));
                                })
                          ],
                        );
                      }
                    }),
          )
        ])));
  }

  openExtras(var datos) {
    int itemCount = 0;
    int _count = 0;

    void incrementCount() {
      setState(() {
        _count++;
      });
    }

    void decrementCount() {
      if (_count < 1) {
        return;
      }
      setState(() {
        _count--;
      });
    }

    showDialog(
        context: context,
        builder: (
          context,
        ) =>
            Scaffold(
                body: SingleChildScrollView(
              child: Container(
                color: const Color.fromARGB(255, 222, 218, 188),
                child: Column(
                  children: [
                    RichText(
                      text: const TextSpan(
                          text: "Elige tu presentacion preferida",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                        child: _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: datos["tamanos"].length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(children: [
                                    RichText(
                                        textAlign: TextAlign.left,
                                        text: TextSpan(
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                            text:
                                                "${datos["tamanos"][index]["nombre"]}"))
                                  ]);
                                },
                              )),
                    SizedBox(
                        child: _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: datos["extras"].length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                color: Colors.grey,
                                              ))),
                                              child: RichText(
                                                  text: TextSpan(
                                                      style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                      text:
                                                          "${datos["extras"][index]["nombre"]}\n+ MX${datos["extras"][index]["precio"]}")),
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  setState(() => _count--),
                                              icon: const Icon(
                                                  Icons.indeterminate_check_box,
                                                  color: Colors.grey),
                                            ),
                                            Text(
                                              _count.toString(),
                                              style: const TextStyle(
                                                  color: Colors.grey),
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  setState(() => _count++),
                                              icon: const Icon(Icons.add_box,
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ]);
                                },
                              )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText:
                              'Agrega alguna nota (sin salsa, sin cebolla, etc)',
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton.icon(
                                label: const Text(
                                  'Fav',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                icon: const Icon(Icons.favorite,
                                    color: Colors.grey),
                                onPressed: () {},
                              ),
                              FloatingActionButton(
                                onPressed: () => setState(() => itemCount++),
                                child: const Icon(Icons.add),
                              ),
                              Text("${itemCount}"),
                              FloatingActionButton(
                                onPressed: () => setState(() => itemCount--),
                                child: const Icon(Icons.remove),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.orange)),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.add_circle),
                                  Text("Agregar"),
                                  Text("MX\$100.00")
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
//   void incrementCount() {
//     setState(() {
//       _count++;
//     });
//   }

//   void decrementCount() {
//     if (_count < 1) {
//       return;
//     }
//     setState(() {
//       _count--;
//     });
//   }

//   int itemCount = 0;
//   int _count = 0;
//   Future openDialog(var datos) => showDialog(
//         context: context,
//         builder: (
//           context,
//         ) =>
//             StatefulBuilder(
//           builder: (context, setState) => AlertDialog(
//             backgroundColor: const Color.fromARGB(255, 222, 218, 188),
//             content: SizedBox(
//               width: width,
//               height: height,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     RichText(
//                       text: const TextSpan(
//                           text: "Elige tu presentacion preferida",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20)),
//                       textAlign: TextAlign.left,
//                     ),
//                     SizedBox(
//                         child: _isLoading
//                             ? const Center(child: CircularProgressIndicator())
//                             : ListView.builder(
//                                 shrinkWrap: true,
//                                 itemCount: datos["tamanos"].length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return Column(children: [
//                                     RichText(
//                                         textAlign: TextAlign.left,
//                                         text: TextSpan(
//                                             style: const TextStyle(
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 20),
//                                             text:
//                                                 "${datos["tamanos"][index]["nombre"]}"))
//                                   ]);
//                                 },
//                               )),
//                     SizedBox(
//                         width: width,
//                         height: 385,
//                         child: _isLoading
//                             ? const Center(child: CircularProgressIndicator())
//                             : ListView.builder(
//                                 shrinkWrap: true,
//                                 itemCount: datos["extras"].length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceEvenly,
//                                           children: [
//                                             Container(
//                                               decoration: const BoxDecoration(
//                                                   border: Border(
//                                                       bottom: BorderSide(
//                                                 color: Colors.grey,
//                                               ))),
//                                               child: RichText(
//                                                   text: TextSpan(
//                                                       style: const TextStyle(
//                                                           color: Colors.grey,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           fontSize: 18),
//                                                       text:
//                                                           "${datos["extras"][index]["nombre"]}\n+ MX${datos["extras"][index]["precio"]}")),
//                                             ),
//                                             IconButton(
//                                               onPressed: () =>
//                                                   setState(() => _count--),
//                                               icon: const Icon(
//                                                   Icons.indeterminate_check_box,
//                                                   color: Colors.grey),
//                                             ),
//                                             Text(
//                                               itemCount.toString(),
//                                               style: const TextStyle(
//                                                   color: Colors.grey),
//                                             ),
//                                             IconButton(
//                                               onPressed: () =>
//                                                   setState(() => _count++),
//                                               icon: const Icon(Icons.add_box,
//                                                   color: Colors.grey),
//                                             )
//                                           ],
//                                         ),
//                                       ]);
//                                 },
//                               )),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 8, vertical: 16),
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                           border: UnderlineInputBorder(),
//                           labelText:
//                               'Agrega alguna nota (sin salsa, sin cebolla, etc)',
//                         ),
//                       ),
//                     ),
//                     Container(
//                       color: Colors.white,
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               TextButton.icon(
//                                 label: const Text(
//                                   'Fav',
//                                   style: TextStyle(color: Colors.grey),
//                                 ),
//                                 icon: const Icon(Icons.favorite,
//                                     color: Colors.grey),
//                                 onPressed: () {},
//                               ),
//                               FloatingActionButton(
//                                 onPressed: incrementCount,
//                                 child: const Icon(Icons.add),
//                               ),
//                               Text("${_count}"),
//                               FloatingActionButton(
//                                 onPressed: decrementCount,
//                                 child: const Icon(Icons.remove),
//                               ),
//                             ],
//                           ),
//                           ElevatedButton(
//                               style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.all(Colors.orange)),
//                               onPressed: () {},
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Icon(Icons.add_circle),
//                                   Text("Agregar"),
//                                   Text("MX\$100.00")
//                                 ],
//                               )),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
// }