import 'package:flutter/material.dart';
import 'package:lym_proyect/UI/base_datos/db_lym.dart';
import 'package:lym_proyect/UI/base_datos/registro_clientes.dart';

class Iniciar extends StatefulWidget {
  static String id = 'iniciar_page';

  const Iniciar({super.key});

  @override
  State<Iniciar> createState() => _IniciarState();
}

class _IniciarState extends State<Iniciar> {
  final _formKeyLogin = GlobalKey<FormState>();
  final TextEditingController eMailController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'assets/imagenes/logo_LyM.png',
                height: 200,
              ),
            ),
            Form(
              key: _formKeyLogin,
              child: Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(40)),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 5.0,
                      ),
                      //
                      //  CORREO ELECTRONICO
                      //
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: eMailController,
                                keyboardType: TextInputType.emailAddress,
                                autofocus: false,
                                enableInteractiveSelection: false,
                                obscureText: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "El correo electronico es obligatorio";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    icon: const Icon(
                                      Icons.email,
                                      color: Colors.black,
                                    ),
                                    hintText: 'ejemplo@correo.com',
                                    labelText: 'CORREO ELECTRONICO',
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.red)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.red))),
                                onChanged: (value) {},
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 15.0,
                      ),
                      //
                      //  CONTRASEÑA
                      //
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          controller: contrasenaController,
                          obscureText: true,
                          enableInteractiveSelection: false,
                          autofocus: false,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Tu contraseña es obligatoria";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              hintText: 'Colocar contraseña',
                              labelText: 'CONTRASEÑA',
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.red))),
                          onChanged: (value) {},
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: olvidoContrasena(),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //
                          //  BOTON INGRESAR
                          //
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green.shade900,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: const BorderSide(
                                          color: Colors.white))),
                              onPressed: () {
                                login();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15.0),
                                child: const Text(
                                  'INGRESAR',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          //
                          //  BOTON INGRESAR
                          //
                          bottonRegistrate(),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      //
                      //  BOTON CONTINUAR COMO INVITADO
                      //
                      invitado(),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Image.asset(
                        "assets/imagenes/shop.gif",
                        height: 200,
                        width: 200,
                      ),
                      Center(
                          child: Align(
                        alignment: Alignment.center,
                        child: terminosYcondiciones(),
                      )),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  colocarUsuario() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              enableInteractiveSelection: false,
              obscureText: false,
              decoration: InputDecoration(
                  icon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  hintText: 'ejemplo@correo.com',
                  labelText: 'CORREO ELECTRONICO',
                  labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red))),
              onChanged: (value) {},
            ),
          ],
        ));
  }

  colocarContrasena() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        enableInteractiveSelection: false,
        autofocus: false,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            icon: const Icon(
              Icons.lock,
              color: Colors.black,
            ),
            hintText: 'Colocar contraseña',
            labelText: 'CONTRASEÑA',
            labelStyle: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red))),
        onChanged: (value) {},
      ),
    );
  }

  void login() async {
    final eMail = eMailController.text;
    final contrasena = contrasenaController.text;
    final isValid = await DB.validateUser(eMail, contrasena);

    if (_formKeyLogin.currentState!.validate()) {
      if (isValid) {
        Navigator.pushNamed(
          context,
          '/market_page',
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'Bienvenido',
            style: TextStyle(
              color: Colors.green,
              fontSize: 50,
            ),
            textAlign: TextAlign.center,
          )),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'CORREO O CONTRASEÑA EQUIVOCADA',
            style: TextStyle(
              color: Colors.red,
              fontSize: 50,
            ),
            textAlign: TextAlign.center,
          )),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          'POR FAVOR REGISTRATE',
          style: TextStyle(
            color: Colors.red,
            fontSize: 50,
          ),
          textAlign: TextAlign.center,
        )),
      );
    }
  }
}

olvidoContrasena() {
  return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return GestureDetector(
          child: Text(
            'Olvidastes tu contraseña?',
            style: TextStyle(
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/olvido_contrasena_page',
                arguments: Cliente(
                    nombre: "",
                    apellidos: "",
                    contrasena: "",
                    comfirmarContrasena: "",
                    dni: "",
                    eMail: ""));
          },
        );
      });
}

bottonRegistrate() {
  return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: Colors.white))),
            onPressed: () {
              Navigator.pushNamed(context, '/registrate_page',
                  arguments: Cliente(
                      id: 0,
                      nombre: "",
                      apellidos: "",
                      contrasena: "",
                      comfirmarContrasena: "",
                      dni: "",
                      eMail: ""));
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
                child: const Text(
                  'REGISTRATE',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )));
      });
}

invitado() {
  return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: Colors.red))),
            onPressed: () {
              Navigator.pushNamed(context, "/market_page");
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
              child: const Text(
                'CONTINUAR COMO INVITADO',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ));
      });
}

terminosYcondiciones() {
  return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return GestureDetector(
          child: Text(
            'Terminos y condiciones',
            style: TextStyle(
                color: Colors.red.shade900,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/terminos_condiciones_page');
          },
        );
      });
}
