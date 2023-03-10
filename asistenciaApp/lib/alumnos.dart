import 'dart:io';
import 'package:app/clases/sesion.dart';
import 'package:flutter/material.dart';
import 'package:app/clases/Calumnos.dart';
import 'package:app/modelos/Malumno.dart';
import 'package:app/clases/vistas.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'modelos/Musuario.dart';

class alumnos extends StatefulWidget {
  final Musuario usuario;

  const alumnos({super.key, required this.usuario});

  @override
  State<alumnos> createState() => _alumnosState();
}

class _alumnosState extends State<alumnos> {
  late Future<List<Malumno>> lAlumnos;
  Calumnos metodos = new Calumnos();
  sesion ses = sesion();

  @override
  void initState() {

    if (kIsWeb) {
    } else {
      if (Platform.isAndroid) {
        WebView.platform = SurfaceAndroidWebView();
      } else if (Platform.isIOS) {
        // iOS-specific code
      }
    }
    super.initState();
    lAlumnos = metodos.getAlumnos(widget.usuario.dni);
  }

  @override
  Widget build(BuildContext context) {
    Vistas componentes = new Vistas("Alumnos", context, widget.usuario);
    return Scaffold(
        drawer: componentes.menu(),
        appBar: AppBar(title: Text(componentes.titulopage)),
        body: Center(
          child: Column(
            children: <Widget>[pantalla(context)],
          ),
        ));
  }

  Widget pantalla(context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(6),
          child: const Text(
            "ALUMNOS REGISTRADOS",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: txtBusq()),
              Container(
                  margin: const EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: btnBuscar())
            ]),
        Center(
            child: Container(
          margin: const EdgeInsets.all(10),
          child: const Text("Lista de Alumnos:"),
        )),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.69,
            child: listaDatos(context)),
      ],
    );
  }

  Widget txtBusq() {
    return //Container(
        // padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        // child: const
        const TextField(
            decoration: InputDecoration(
                hintText: "Buscar Alumno",
                fillColor: Colors.black12,
                filled: true));
  }

  Widget btnBuscar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
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
              onPressed: () {},
              child: const Text("Buscar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget listaDatos(context) {
    return FutureBuilder(
        future: lAlumnos,
        builder: (context, snapshop) {
          if (snapshop.hasData) {
            // print(snapshop.data);
            // List<Calumno>? datos= snapshop.data;
            return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: elementos(snapshop.data),
            );
          } else if (snapshop.hasError) {
            print(snapshop.error);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  List<Widget> elementos(List<Malumno>? data) {
    List<Widget> element = [];
    int i = 0;
    for (var ele in data!) {
      i++;
      String img = "";
      if (ele.ext != "0") {
        img = metodos.conexion.url + "/img/alumnos/" + ele.dni + "." + ele.ext;
      } else {
        img = metodos.conexion.url + "/img/noimage.png";
      }
      // print(i.toString() + ele.toString());
      element.add(Card(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              margin: const EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width * 0.20,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // print("por que me tocas papi"+ele.dni);
                      detallerAlu(ele);
                    });
                  },
                  child: Image.network(img))),
          Container(
              margin: const EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width * 0.50,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(ele.dni),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(ele.nomb),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(ele.sex),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text("Fecha de Nacimiento:" + ele.fnac),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(3),
                  )
                ],
              )),
          Container(
              margin: const EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width * 0.20,
              child: Column(children: [btnDatos(ele)])),
        ],
      )));
    }
    return element;
  }

  Widget btnDatos(Malumno ele) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF142A67),
                    Color(0xFF4719D2),
                    Color(0xFF2E4F56),
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
                // Navigator.push(
                //      context, MaterialPageRoute(builder: (context) => pdfAlu()));
                pdfAlumnos(ele);
              },
              child: const Text("Ver Detalles",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  void detallerAlu(Malumno ele) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (buildcontext) {
          String img;
          if (ele.ext != "0") {
            img = metodos.conexion.url +
                "/img/alumnos/" +
                ele.dni +
                "." +
                ele.ext;
          } else {
            img = metodos.conexion.url + "/img/noimage.png";
          }
          return AlertDialog(
            insetPadding: EdgeInsets.all(0),
            title: Text(ele.dni + "-" + ele.nomb),
            content: Image.network(img),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  "CERRAR",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void pdfAlumnos(Malumno ele) {
    String yourURL =
        metodos.conexion.url + "appmovil/pdfalumno.php?cod=" + ele.dni;
    yourURL = "https://docs.google.com/gview?embedded=true&url=" + yourURL;
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            content: Container(
                width: MediaQuery.of(context).size.width,
                child: Stack(children: <Widget>[
                  WebView(
                    initialUrl: yourURL,
                    javascriptMode: JavascriptMode.unrestricted,
                  )
                ])),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  "CERRAR",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
