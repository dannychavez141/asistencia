import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:app/clases/cHorario.dart';
import 'package:app/clases/sesion.dart';
import 'package:app/modelos/mHorario.dart';
import 'package:app/rDocente.dart';
import 'package:flutter/material.dart';
import 'package:app/clases/cDocente.dart';
import 'package:app/modelos/mDocente.dart';
import 'package:app/clases/vistas.dart';
import 'package:flutter/services.dart';
import 'dart:io' show File, Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'modDocente.dart';
import 'modelos/Musuario.dart';
import 'package:image_picker/image_picker.dart';

class vLugares extends StatefulWidget {
  final Musuario usuario;

  const vLugares({super.key, required this.usuario});

  @override
  State<vLugares> createState() => _vLugaresState();
}

class _vLugaresState extends State<vLugares> {
  TextEditingController cBusq = TextEditingController();
  TextEditingController txtDni = TextEditingController();
  TextEditingController txtNomb = TextEditingController();
  TextEditingController txtApepa = TextEditingController();
  TextEditingController txtApema = TextEditingController();
  late Future<List<mDocente>> ldocentes;
  late Future<List<mHorario>> horario;
  cDocente metodos = new cDocente();
  cHorario cHora = new cHorario();
  sesion ses = sesion();
  late XFile fDocente;
  ImagePicker picker = ImagePicker();
  late Uint8List imgDoc;
  bool elegido = false;

  @override
  void initState() {
    cBusq = TextEditingController();
    super.initState();
    ldocentes = metodos.getDocentes("");
  }

  @override
  Widget build(BuildContext context) {
    Vistas componentes = new Vistas("DOCENTES", context, widget.usuario);
    return Scaffold(
        drawer: componentes.menu(widget.usuario.tipoUsu),
        appBar: AppBar(title: Text(componentes.titulopage)),
        body: Center(
            child: Container(
          child: Column(
            children: <Widget>[pantalla(context)],
          ),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => rdocente(usuario: widget.usuario)));
          }),
          tooltip: 'Registro de Docentes',
          child: const Icon(Icons.add),
        ));
  }

  Widget pantalla(context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(6),
          child: const Text(
            "DOCENTES REGISTRADOS",
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
          child: const Text("Lista de Docentes:"),
        )),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.66,
            child: listaDatos(context)),
      ],
    );
  }

  Widget txtBusq() {
    return Container(
        child: TextField(
            //obscureText: true,
            decoration: InputDecoration(
              hintText: "Buscar Docente",
              //filled: true,
            ),
            controller: cBusq));
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
              onPressed: () => setState(() {
                    ldocentes = metodos.getDocentes(cBusq.text);
                  }),
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
        future: ldocentes,
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

  List<Widget> elementos(List<mDocente>? data) {
    List<Widget> element = [];
    int i = 0;
    for (var ele in data!) {
      i++;

      Uint8List img;
      img = Base64Decoder().convert(ele.foto);

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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(ele.dniDoc),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(3),
                      )
                    ],
                  )
                  //Image.memory(img)
                ) ),
          Container(
              margin: const EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width * 0.40,
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(ele.nomDoc),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(ele.apepaDoc+" "+ele.apemaDoc),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(3),
                  )
                ],
              )),
          Container(
              margin: const EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width * 0.30,
              child: Column(children: [
                Container(margin: EdgeInsets.all(2), child: btnDatos(ele)),
                Container(margin: EdgeInsets.all(2), child: btnHorarios(ele))
              ]))
        ],
      )));
    }
    return element;
  }

  Widget btnDatos(mDocente ele) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(200, 173, 0, 1.0),
                    Color.fromRGBO(200, 173, 0, 1.0),
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
                saltoMod(ele);
              },
              child: const Text("Modificar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget btnHorarios(mDocente ele) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(76, 0, 240, 1.0),
                    Color.fromRGBO(76, 0, 240, 1.0),
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
                horarioDoc(ele);
              },
              child: const Text("Ver Horario",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget btnCerrarDet() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(76, 0, 240, 1.0),
                    Color.fromRGBO(76, 0, 240, 1.0),
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
              },
              child: const Text("Ver Horario",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  void detallerAlu(mDocente ele) {
    showDialog(
        context: context,
        builder: (buildcontext) {

          Uint8List img;
          img = Base64Decoder().convert(ele.foto);
          return AlertDialog(
            insetPadding: EdgeInsets.all(0),
            title: Text(ele.dniDoc + "-" + ele.nomDoc),
            content: Container(),
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

  void saltoMod(mDocente doc) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                modDocente(usuario: widget.usuario, mdoc: doc)));
  }

  void horarioDoc(mDocente ele) {
    showDialog(
        context: context,
        builder: (buildcontext) {

          return AlertDialog(
            insetPadding: EdgeInsets.all(0),
            title: Column(children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.all(4),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(ele.dniDoc + "-" + ele.nomDoc,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14))),
                    Container(
                        margin: const EdgeInsets.all(2),
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Container())
                  ]),
              Text("HORARIO DEL DOCENTE",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
            ]),
            content: horas(ele),
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

  Widget horas(mDocente doc) {
    Future<List<mHorario>> horario = cHora.getHorario(doc.idDoc);

    return FutureBuilder<List<mHorario>>(
      future: horario, // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<List<mHorario>> snapshot) {
        Widget children;
        if (snapshot.hasData) {
          List<mHorario>? datos = snapshot.data;
          int? cantidad = datos?.length;
          if (cantidad! > 0) {
            children = Container(
                width: double.minPositive,
                height: 300,
                // height: MediaQuery.of(context).size.height * 0.40,
                // constraints: BoxConstraints(minWidth: 230.0, minHeight: 25.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: datos?.length,
                    itemBuilder: (context, pos) {
                      return elementoHorario(datos![pos]);
                    }));
          } else {
            children = Container(
                width: double.minPositive,
                height: 300,
                // height: MediaQuery.of(context).size.height * 0.40,
                // constraints: BoxConstraints(minWidth: 230.0, minHeight: 25.0),
                child: Text("El Docente no tiene Horarios Registrados"));
          }
        } else {
          children = SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(),
          );
        }
        return children;
      },
    );
  }

  Widget elementoHorario(mHorario horario) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(0),
        elevation: 1,
        child: Container(
          margin: const EdgeInsets.all(4),
          width: MediaQuery.of(context).size.width * 0.60,
          child: Column(
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                title: Text(horario.dia.descrDia),
                subtitle:
                    Text("De " + horario.hEntrada + " a " + horario.hSalida),
                leading: Icon(Icons.timelapse),
              )
            ],
          ),
        ));
  }
}
