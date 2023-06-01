import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_to_app/components/autocomplete_tienda.dart';
import 'package:web_to_app/components/card_button.dart';
import 'package:web_to_app/components/product_list.dart';
import 'package:web_to_app/components/service_card.dart';
import 'package:web_to_app/pages/negocios.dart';

import 'components/custom_button.dart';
import 'components/tipo_tienda_chip.dart';

var value;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                    const SizedBox(width: 350, child: Autocompletetienda()),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BusinessPage(
                                  value: value,
                                )));
                      },
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
                                      TipoTiendaChip(
                                        imageUrl:
                                            "https://aquipide.com/api/img/giroRestaurante.jpg",
                                        label: "Restaurante",
                                        onPressed: () {},
                                      ),
                                      TipoTiendaChip(
                                        imageUrl:
                                            "https://aquipide.com/api/img/giroLimpieza.png",
                                        label: "Limpieza",
                                        onPressed: () {},
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
                                      TipoTiendaChip(
                                        imageUrl:
                                            "https://aquipide.com/api/img/giroBebidas.png",
                                        label: "Bebidas",
                                        onPressed: () {},
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
                    width: width - 30,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255)),
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Text(
                          "El proceso de nuestro servicio",
                          style: TextStyle(
                              color: Color(0xFF444444),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "Como funciona?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: 55,
                        ),
                        ServiceCard(
                          img: "assets/css/ahaar/images/icon/color-icon/1.png",
                          title: "Elige tu tienda",
                          titleStyle: TextStyle(
                            color: Color(0xFF444444),
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                          descripcion: "Busca & elige tu preferida",
                          descripocionStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        ServiceCard(
                          img: "assets/css/ahaar/images/icon/color-icon/2.png",
                          title: "Crea tu pedido",
                          titleStyle: TextStyle(
                            color: Color(0xFF444444),
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                          descripcion: "Elige lo que desees & crea tu pedido",
                          descripocionStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        ServiceCard(
                          img: "assets/css/ahaar/images/icon/color-icon/3.png",
                          title: "Solicita tu pedido",
                          titleStyle: TextStyle(
                            color: Color(0xFF444444),
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                          descripcion:
                              "Solicita tu orden a tu tienda preferida facilmente via Whatsapp",
                          descripocionStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "¿Tienes un negocio? Vende con nosotros",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Text(
                  "Tipos de tiendas",
                  style: TextStyle(
                    color: Color(0xFF444444),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CardButton(
                  cardTitle: "Restaurante",
                  ancho: 350,
                  alto: 250,
                  cardImage: "https://aquipide.com/api/img/giroRestaurante.jpg",
                  onTap: () {},
                ),
                CardButton(
                  cardTitle: "Limpieza",
                  ancho: 350,
                  alto: 250,
                  cardImage: "https://aquipide.com/api/img/giroLimpieza.png",
                  onTap: () {},
                ),
                CardButton(
                  cardTitle: "Limpieza",
                  ancho: 350,
                  alto: 350,
                  cardImage: "https://aquipide.com/api/img/giroBebidas.png",
                  onTap: () {},
                ),
              ],
            ),
            Container(
              height: height,
              width: width,
              decoration: const BoxDecoration(color: Color(0xFFf9a603)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "¿Por qué tener su tienda en Aquí Pide?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.emoji_emotions,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Creemos que sus clientes tienen que \namar buscar y pedir por su tienda.",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.timer,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Creemos que tiene que tener su tienda\n de forma sencilla de la noche \na la mañana.",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Creemos que no tiene que pagar altas\n comisiones de entre el 20% y 30% para\n vender por una app.",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  CustomButton(
                    onPressed: () {},
                    buttonTitle: "Ver Precios",
                    backGroundColor: const Color(0xFF444444),
                    iconData: const Icon(Icons.remove_red_eye),
                  ),
                  CustomButton(
                    onPressed: () {},
                    buttonTitle: "Registrate Gratis",
                    backGroundColor: const Color(0xFF444444),
                    iconData: const Icon(Icons.app_registration),
                  ),
                  CustomButton(
                    onPressed: () {},
                    buttonTitle: "Ver como funciona",
                    backGroundColor: const Color(0xFF444444),
                    iconData: const Icon(Icons.remove_red_eye),
                  ),
                  CustomButton(
                    onPressed: () {},
                    buttonTitle: "Ver tienda DEMO",
                    backGroundColor: const Color(0xFF444444),
                    iconData: const Icon(Icons.star_border),
                  ),
                  CustomButton(
                    onPressed: () {},
                    buttonTitle: "Saber Mas",
                    backGroundColor: const Color(0xFF444444),
                    // ignore: deprecated_member_use
                    iconData: const Icon(FontAwesomeIcons.exclamationCircle),
                  ),
                  CustomButton(
                    onPressed: () {},
                    buttonTitle: "Contactanos",
                    backGroundColor: const Color(0xFF444444),
                    iconData: const Icon(FontAwesomeIcons.whatsapp),
                  ),
                ],
              ),
            ),
            Container(
              height: height,
              width: width,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Aqui Pide",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Horario de Atencion: Lunes a Viernes de \n 9:00-15:00",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Todos los derechos reservados 2021\n Version 1.1.6.1",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '66 81 58 45 47',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          // ignore: deprecated_member_use
                          FontAwesomeIcons.facebookSquare,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'AquiPide',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          // ignore: deprecated_member_use
                          FontAwesomeIcons.facebookSquare,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'AquiPide',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          // ignore: deprecated_member_use
                          FontAwesomeIcons.instagram,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '@AquiPide',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          // ignore: deprecated_member_use
                          Icons.email,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'afiliados@aquipide.com',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Aviso De Privacidad",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Terminos y Condiciones",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            const ProducList(idTienda: 36)
          ],
        ),
      ),
    );
  }
}
