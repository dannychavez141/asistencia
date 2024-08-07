import 'package:app/clases/sesion.dart';
import 'package:app/modelos/Musuario.dart';
import 'package:flutter/material.dart';
import 'package:app/principal.dart';
import 'clases/cDocente.dart';

late Musuario usuario;
cDocente metodos = cDocente();
sesion ses = sesion();
var media;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await initNoti();
  usuario = await ses.verificarInicio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   // hilo();
    //print(usuario);
    return MaterialApp(
      title: ' App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: usuario.id == "null"  ? MyHomePage(title: 'Asistencia Unu 2.0'):principal(usuario: usuario),
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
  String cTipo = "DOCENTE";

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
     media = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/fondounu.png"),
              fit: BoxFit.cover)),
      child: Center(
        child: Container(
            margin: EdgeInsets.only(top: 20),

            width: 600,
            height: 500,
            alignment: Alignment.center,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            appName(),
            titulo(),
            txtUsuario(),
            txtPass(),
            spTipo(),
            btnIngresar()
          ],
        )),
      ),
    );
  }

  Widget titulo() {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
           "Inicio de Sesion",
          style: TextStyle(
            fontSize: 38,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = Colors.blue[700]!,
          ),
        ),
        // Solid text as fill.
        Text(
          "Inicio de Sesion",
          style: TextStyle(
            fontSize: 38,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget appName() {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          'Asistencia Unu 2.0',
          style: TextStyle(
            fontSize: 38,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = Colors.blue[700]!,
          ),
        ),
        // Solid text as fill.
        Text(
          'Asistencia Unu 2.0',
          style: TextStyle(
            fontSize: 38,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget txtUsuario() {
    String txtusu="";
    if(usuario.dniUsu!= "null"){
      txtusu=usuario.dniUsu;
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
  Widget spTipo() {
    List<String>   tipos = ['DOCENTE', 'ADMINISTRADOR'];


    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child:DropdownButtonFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
        ),
      hint: Text('Seleccionar'),
      value: tipos[0],
      onChanged: (String? newValue) {
        setState(() {
          this.cTipo = newValue!;
        });
      },
      items: tipos
          .map((item) => DropdownMenuItem<String>(
          onTap: () {
            setState(() {
              //CREA UNA VARIABLE DE CLASE DEL ID
              //idAnio = item.id;
            });
          },
          child: Text(item,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
          value: item))
          .toList(),
    ));
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
    String tipo = cTipo;
    if (usu.length < 1 || pass.length < 1) {
      alerta("Error de Inicio de Identidicación", "Campos Vacios",
          "Los campos de Usuario o Contraseña se encuentran  vacios");
    } else {
      List<Musuario> usuarios = await metodos.getUsuario(usu, pass,tipo);
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
