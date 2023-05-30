import 'package:flutter/material.dart';

class BusinessPage extends StatefulWidget {
  final String value;

  BusinessPage({Key? key, required this.value}) : super(key: key);

  @override
  State<BusinessPage> createState() => _BusinessPage();
}

class _BusinessPage extends State<BusinessPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
            child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: const <Widget>[
            DrawerHeader(
                child: Row(children: [
              Icon(
                Icons.info,
                size: 14,
              ),
              Text(
                "¿Tienes un negocio? Vende con nosotros",
              )
            ]))
          ],
        )),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Image(
                    image: AssetImage(
                      "assets/img/logo-aqui-pido.png",
                    ),
                    height: 100),
                const Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.black,
                    ),
                    Text(
                      "Favoritos",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                const Text(
                  "|",
                  style: TextStyle(fontSize: 24),
                ),
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
                    Text(
                      "Mi Pedido",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
                )
              ],
            ),
            Column(
              children: [Text(widget.value)],
            )
          ],
        )

        // Center(
        //   child: Text(widget.value),
        // ),
        );
  }
}
