import 'package:flutter/material.dart';

class ExtrasPage extends StatefulWidget {
  final Object datos;
  const ExtrasPage({
    Key? key,
    required this.datos,
  }) : super(key: key);

  @override
  State<ExtrasPage> createState() => _ExtrasPage();
}

class _ExtrasPage extends State<ExtrasPage> {
  int itemCount = 0;
  int _count = 1;
  int _extra = 0;
  int _value = 0;
  int precioTotal = 0;

  void incrementCount() {
    setState(() {
      _count++;
    });
  }

  void decrementCount() {
    if (_count == 1) {
      return;
    }
    setState(() {
      _count--;
    });
  }

  void incrementExtra() {
    setState(() {
      _extra++;
    });
  }

  void decrementExtra() {
    if (_extra < 0) {
      return;
    }
    setState(() {
      _extra--;
    });
  }

  @override
  void initState() {
    super.initState();

    // Establecer el valor predeterminado
  }

  @override
  Widget build(BuildContext context) {
    final prueba = Map<String, dynamic>.from(widget.datos as Map);
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      color: const Color.fromARGB(255, 222, 218, 188),
      child: SizedBox(
        // child: Column(
        //   children: [
        //     ListView.builder(
        //         itemCount: prueba["tamanos"].length,
        //         shrinkWrap: true,
        //         itemBuilder: (BuildContext context, int index) {
        //           return Container(
        //               width: 150,
        //               margin: const EdgeInsets.all(8),
        //               child: Column(
        //                 children: [
        //                   Text("${prueba["tamanos"][index]["nombre"]}"),
        //                 ],
        //               ));
        //         }),
        //   ],
        // ),
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
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: prueba["tamanos"].length,
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile(
                    title: Text("${prueba["tamanos"][index]["nombre"]}"),
                    value: index,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                        if (_value == index) {
                          precioTotal + prueba["tamanos"][index]["precio"];
                          print("${prueba["tamanos"][index]["precio"]}");
                        }
                      });
                    }

                    // Row(
                    //   children: [
                    //     Radio(
                    //       value: prueba["tamanos"][index]["precio"],
                    //       groupValue: _value,
                    //       onChanged: (value) {
                    //         setState(() {
                    //           _value = value!;
                    //           print(_value);
                    //         });
                    //       },
                    //     ),
                    //     RichText(
                    //         textAlign: TextAlign.left,
                    //         text: TextSpan(
                    //             style: const TextStyle(
                    //                 color: Colors.black,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 16),
                    //             text: "${prueba["tamanos"][index]["nombre"]}"))
                    //   ],
                    // ),

                    );
              },
            )),
            SizedBox(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: prueba["extras"].length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    text:
                                        "${prueba["extras"][index]["nombre"]}\n+ MX${prueba["extras"][index]["precio"]}")),
                          ),

                          IconButton(
                            onPressed: () => setState(() => itemCount--),
                            icon: const Icon(Icons.indeterminate_check_box,
                                color: Colors.grey),
                          ),
                          Text(
                            itemCount.toString(),
                            style: const TextStyle(color: Colors.grey),
                          ),

                          IconButton(
                            onPressed: decrementExtra,
                            icon: const Icon(Icons.add_box, color: Colors.grey),
                          )
                          // itemCount != 0
                          //     ? IconButton(
                          //         icon:
                          //             const Icon(Icons.remove),
                          //         onPressed: () => setState(
                          //             () => itemCount--),
                          //       )
                          //     : Container(),
                          // Text(itemCount.toString()),
                          // IconButton(
                          //     icon: const Icon(Icons.add),
                          //     onPressed: () =>
                          //         setState(() => itemCount++))
                        ],
                      ),
                    ]);
              },
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Agrega alguna nota (sin salsa, sin cebolla, etc)',
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
                        icon: const Icon(Icons.favorite, color: Colors.grey),
                        onPressed: () {},
                      ),
                      const Text("Cantidad",
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                      FloatingActionButton(
                        onPressed: decrementCount,
                        heroTag: "btndecrement",
                        child: const Icon(Icons.remove),
                      ),
                      Text("${_count}"),
                      FloatingActionButton(
                        onPressed: incrementCount,
                        heroTag: "btnincrement",
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.add_circle),
                          Text("Agregar"),
                          Text("${precioTotal}")
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
