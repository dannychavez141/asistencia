import 'package:app/clases/sesion.dart';
import 'package:app/modelos/Musuario.dart';
import 'package:flutter/material.dart';
import 'package:app/principal.dart';
import 'clases/Calumnos.dart';
import 'clases/notif.dart';

late Musuario usuario;
Calumnos metodos = Calumnos();
sesion ses = sesion();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initNoti();
  usuario = await ses.verificarInicio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    hilo();
    print(usuario);
    return MaterialApp(
      title: ' App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: usuario.id == "null"  ? MyHomePage(title: 'Premium App 2.0'):principal(usuario: usuario),
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
  final cUsu = TextEditingController();
  final cPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //appBar: AppBar(
       // title: Text(widget.title),
     // ),
      body:
          cuerpo(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget cuerpo() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/img.png"),
              fit: BoxFit.cover)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            appName(),
            titulo(),
            txtUsuario(),
            txtPass(),
            btnIngresar()
          ],
        ),
      ),
    );
  }

  Widget titulo() {
    return Text(
      "Inicio de Sesion",
      style: TextStyle(
          color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),
    );
  }

  Widget appName() {
    return Text(
      "Premium App 2.0",
      style: TextStyle(
          color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),
    );
  }

  Widget txtUsuario() {
    String txtusu="";
    if(usuario.dni!= "null"){
      txtusu=usuario.dni;
    }
    cUsu.text=txtusu;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Usuario",
            fillColor: Colors.white,
            filled: true,
          ),
          controller: cUsu,
        ));
  }

  Widget txtPass() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Contraseña",
              fillColor: Colors.white,
              filled: true,
            ),
            controller: cPass));
  }

  Widget btnIngresar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                validar();
              },
              child: Text("Ingresar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  void validar() async {
    String usu = cUsu.text;
    String pass = cPass.text;
    if (usu.length < 1 || pass.length < 1) {
      alerta("Error de Inicio de Identidicación", "Campos Vacios",
          "Los campos de Usuario o Contraseña se encuentran  vacios");
    } else {
      List<Musuario> usuarios = await metodos.getUsuario(usu, pass);
      int canti = usuarios.length;
      if (canti > 0) {
        usuario = usuarios[0];
        ses.guardarSesion(usuario);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => principal(usuario: usuario,)));
      } else {
        alerta("Error de Inicio de Identidicación", "Credenciales Erroneas",
            "No se pudo identificar al usuario");
      }
    }
  }

  void alerta(String titulo, String head, String body) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(
                    child: Text(head,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))),
                Text(body),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cerrar',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
