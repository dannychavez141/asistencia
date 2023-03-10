import 'dart:io';
import 'package:app/asistencias.dart';
import 'package:app/modelos/Manio.dart';
import 'package:app/pdf/pdfMatricula.dart';
import 'package:app/pdf/pdfNotas.dart';
import 'package:app/qr.dart';
import 'package:flutter/material.dart';
import 'package:app/clases/Calumnos.dart';
import 'package:app/modelos/Malumno.dart';
import 'package:app/clases/vistas.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'modelos/Musuario.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
Calumnos metodos = Calumnos();
late Future<List<Malumno>> lAlumnos;
late Future<List<Manio>> lAnios;
String? idAnio = "";

class matriculas extends StatefulWidget {
  final Musuario usuario;

  const matriculas({super.key, required this.usuario});

  @override
  State<matriculas> createState() => _matriculaState();
}

class _matriculaState extends State<matriculas> {
  @override
  void initState() {
    lAnios = metodos.getAnios();
    lAlumnos = metodos.getMatriculados(widget.usuario.dni, idAnio!);
    WidgetsFlutterBinding.ensureInitialized();
    if (kIsWeb) {
    } else {
      if (Platform.isAndroid) {
        WebView.platform = SurfaceAndroidWebView();
      } else if (Platform.isIOS) {
        // iOS-specific code
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Vistas componentes = Vistas("MATRICULAS", context, widget.usuario);

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
            "MATRICULAS REGISTRADAS",
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
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Column(
                    children: [
                      Center(
                        child: Text("Selecciona el Año Escolar:"),
                      ),
                      listaAnios(context)
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: btnBuscar())
            ]),
        Center(
            child: Container(
          margin: const EdgeInsets.all(10),
          child: const Text("Lista de Alumnos:"),
        )),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: listaDatos(context)),
      ],
    );
  }

  Widget spAnios(List<Manio> anios) {
    String selectedFc = anios.first.id;
    if(idAnio==""){idAnio = selectedFc;
    lAlumnos = metodos.getMatriculados(widget.usuario.dni, idAnio!);
    }
   //
    return DropdownButtonFormField(
      hint: Text('Seleccionar'),
      value: selectedFc,
      onChanged: (String? newValue) {
        setState(() {
          selectedFc = newValue!;
          idAnio = selectedFc;
          lAlumnos = metodos.getMatriculados(widget.usuario.dni, idAnio!);
          print(idAnio);
        });
      },
      items: anios
          .map((item) => DropdownMenuItem<String>(
              onTap: () {
                setState(() {
                  //CREA UNA VARIABLE DE CLASE DEL ID
                  //idAnio = item.id;
                });
              },
              child: Text(item.descr,
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
              value: item.id))
          .toList(),
    );
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
              onPressed: () {
                setState(() {
                  print(idAnio);
                  //  lAlumnos =metodos.getMatriculados(widget.usuario.dni, idAnio);
                });
              },
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

  Widget listaAnios(context) {
    return FutureBuilder(
        future: lAnios,
        builder: (context, snapshop) {
          if (snapshop.hasData) {
            // print(snapshop.data);
            List<Manio>? datos = snapshop.data;

            return spAnios(datos!);
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
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          // print("por que me tocas papi"+ele.dni);
                          detallerAlu(ele);
                        });
                      },
                      child: Image.network(img)),
                  Container(margin: EdgeInsets.all(3), child: btnQr(ele)),
                ],
              )),
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
                    child: Text(ele.fnac),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(3),
                  )
                ],
              )),
          Container(
              margin: const EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width * 0.20,
              child: Column(children: [
                Container(margin: EdgeInsets.all(2), child: btnDatos(ele)),
                Container(margin: EdgeInsets.all(2), child: btnNotas(ele)),
                Container(margin: EdgeInsets.all(2), child: btnAsistencia(ele))
              ])),
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
                padding: const EdgeInsets.all(10.0),
                textStyle: const TextStyle(fontSize: 30),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => pdfMatri(cod: ele.id)));
                //pdfAlumnos(ele);
              },
              child: const Text("Boleta de Matricula",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
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

  Widget btnNotas(Malumno ele) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF61B95B),
                    Color(0xFF19D228),
                    Color(0xFFC1BF3A),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(10.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => pdfNotas(cod: ele.id)));
              },
              child: const Text("Boleta de Notas",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget btnAsistencia(Malumno ele) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFFB95BB7),
                    Color(0xFFA419D2),
                    Color(0xFFD5BDEF),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(1.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => asistencias(matricula: ele)));
              },
              child: const Text("Asistencias",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget btnQr(Malumno ele) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFFB95BB7),
                    Color(0xFFA419D2),
                    Color(0xFFD5BDEF),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(1.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => qr(alu: ele)));
              },
              child: const Text("Ver QR",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
