// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AQUI PIDE',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'AQUI PIDE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
          Container(
            width: width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/bg/mobilbg2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  const Text("\"AQUÍ PIDE\"",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                      "Servicios de comida a domicilio & ordena y recoja",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                      width: 350,
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 20.0),
                          filled: true,
                          fillColor: const Color(0xFFF44336),
                          hintText:
                              "Busca restaurantes (pizza, hamburguesa, sushi, italiano, etc)...",
                          hintStyle: const TextStyle(color: Colors.white),
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.white),
                          prefixIconColor: Colors.white,
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF44336)),
                    child: const Text(
                      "Ir al menú",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 350,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: ExpansionTile(
                          backgroundColor: Colors.white,
                          collapsedBackgroundColor: Colors.white,
                          title: const Text("Nuestros tipos de tiendas"),
                          children: <Widget>[
                            const Padding(padding: EdgeInsets.all(5)),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(5),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          backgroundColor: Colors.grey),
                                      child: Row(
                                        children: const [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/img/bg/mobilbg.jpg"),
                                          ),
                                          Text(" Restaurante")
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(5),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          backgroundColor: Colors.grey),
                                      child: Row(
                                        children: const [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/img/bg/mobilbg.jpg"),
                                          ),
                                          Text(" Limpieza")
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(5),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          backgroundColor: Colors.grey),
                                      child: Row(
                                        children: const [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/img/bg/mobilbg.jpg"),
                                          ),
                                          Text(" Bebidas")
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 150),
          Container(
            height: height,
            width: width,
            decoration:
                const BoxDecoration(color: Color.fromRGBO(37, 150, 190, 255)),
            child: Column(
              children: [
                Container(
                  height: height,
                  width: width - 50,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255)),
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 150,
                      ),
                      Text("El Proceso de nuestro servicio"),
                      Text("¿Comó Funciona?")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ])));
  }
}
