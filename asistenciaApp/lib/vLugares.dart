import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:app/clases/cHorario.dart';
import 'package:app/clases/cLugar.dart';
import 'package:app/clases/sesion.dart';
import 'package:app/mdLugar.dart';
import 'package:app/modelos/mHorario.dart';
import 'package:app/modelos/mLugar.dart';
import 'package:app/rDocente.dart';
import 'package:app/rLugar.dart';
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
  late Future<List<mLugar>> datos;
  cLugar metodos = new cLugar();
  sesion ses = sesion();

  @override
  void initState() {
    super.initState();
    datos = metodos.getLugares("");
  }

  @override
  Widget build(BuildContext context) {
    Vistas componentes = new Vistas("LUGARES", context, widget.usuario);
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
                    builder: (context) => rLugar(usuario: widget.usuario)));
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
            "LUGARES REGISTRADOS",
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
          child: const Text("Lista de Lugares:"),
        )),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text("Nombre")),
              Container(
                  margin: const EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Text("Direccion/Telefono")),
              Container(
                  margin: const EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text("Acciones"))
            ]),
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
              hintText: "Buscar Lugares",
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
                    datos = metodos.getLugares(cBusq.text);
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
        future: datos,
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

  List<Widget> elementos(List<mLugar>? data) {
    List<Widget> element = [];
    int i = 0;
    for (var ele in data!) {
      i++;

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
                      detaller(ele);
                    });
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(ele.descrLug),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(3),
                      )
                    ],
                  )
                  //Image.memory(img)
                  )),
          Container(
              margin: const EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width * 0.40,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(ele.dirLug),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(ele.telfLug),
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
                Container(margin: EdgeInsets.all(2), child: btnModificar(ele))
              ]))
        ],
      )));
    }
    return element;
  }

  Widget btnModificar(mLugar ele) {
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
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            mdLugar(usuario: widget.usuario, mod: ele)));
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

  void detaller(mLugar ele) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(0),
            title: Text(ele.descrLug,textAlign: TextAlign.center),
            content: Container( height: 300,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Direccion:\n" + ele.dirLug,textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Teleforno:\n" + ele.telfLug,textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Altitud:\n" + ele.altLug,textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Latitud:\n" + ele.latLug,textAlign: TextAlign.center),
                )
              ]),
            ),
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
