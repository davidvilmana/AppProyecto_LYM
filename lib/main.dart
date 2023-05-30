import 'package:flutter/material.dart';
import 'package:lym_proyect/UI/pages/market.dart';
import 'package:lym_proyect/UI/pages/productos/zapatilla_nike.dart';
import 'package:lym_proyect/UI/pages/registro_clientes.dart';
import 'package:lym_proyect/UI/base_datos/lista_clientes.dart';
import 'package:lym_proyect/UI/pages/login_page.dart';

import 'UI/pages/olvido_contrasena_page.dart';
import 'UI/pages/terminos_condiciones_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //widgets tema de aplicacion y opciones de navegacion
      debugShowCheckedModeBanner: false, //quitar etiqueta de debug
      title: 'flutter demo',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: '/login_page', // ruta inicial
      routes: {
        '/login_page': (context) => const Iniciar(),
        '/olvido_contrasena_page': (context) => const OlvidoContrasenaPage(),
        '/registrate_page': (context) => const AgregarCliente(),
        '/listado_clientes': (context) => const VerClientes(),
        '/market_page': (context) => const MarketPage(),
        '/terminos_condiciones_page': (context) =>
            const TerminosYcondicionesPage(),
        '/producto_zapatillas_nike1': (context) => const ZapatillaNike1(),
      }, //nombres de rutas navegables
    );
  }
}
