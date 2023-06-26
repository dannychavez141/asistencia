import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:app/clases/cLugar.dart';
import 'package:app/clases/sesion.dart';
import 'package:app/modelos/mLugar.dart';
import 'package:app/vDocentes.dart';
import 'package:app/vLugares.dart';
import 'package:flutter/material.dart';
import 'package:app/clases/cDocente.dart';
import 'package:app/modelos/mDocente.dart';
import 'package:app/clases/vistas.dart';
import 'package:flutter/services.dart';
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'modelos/Musuario.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class rLugar extends StatefulWidget {
  final Musuario usuario;

  const rLugar({super.key, required this.usuario});

  @override
  State<rLugar> createState() => _rLugarState();
}

class _rLugarState extends State<rLugar> {
  TextEditingController txtdescrLug = TextEditingController();
  TextEditingController txtdirLug = TextEditingController();
  TextEditingController txttelfLug = TextEditingController();
  TextEditingController txtlatLug = TextEditingController();
  TextEditingController txtaltLug = TextEditingController();
  late Future<List<mDocente>> ldocentes;
  cLugar metodos = new cLugar();
  sesion ses = sesion();

  late Vistas componentes;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    componentes = new Vistas("LUGARES", context, widget.usuario);
    return Scaffold(
        drawer: componentes.menu(widget.usuario.tipoUsu),
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
            "REGISTRANDO LUGARES",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(width: 350, child: registro()),
      ],
    );
  }

  Widget registro() {
    return Column(children: [
      Container(
        child: Column(
          children: [
            Text("Descripción del Lugar:", textAlign: TextAlign.right),
            TextFormField(
              decoration:
                  InputDecoration(hintText: "Escribe Descripción del Lugar"),
              controller: txtdescrLug,
              keyboardType: TextInputType.text,
              maxLength: 100,
              validator: (value) {
                if (value != "") {
                  return 'Escribe Descripción del Lugar';
                }
                return null;
              },
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.singleLineFormatter
              ],
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(0),
        child: Column(
          children: [
            Text("Direccion del Lugar:", textAlign: TextAlign.right),
            TextFormField(
                decoration:
                    InputDecoration(hintText: "Escribe Direccion del Lugar"),
                controller: txtdirLug,
                keyboardType: TextInputType.text,
                maxLength: 100,
                validator: (value) {
                  if (value != "") {
                    return 'Escribe Direccion del Lugar';
                  }
                  return null;
                },
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter
                ])
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(0),
        child: Column(
          children: [
            Text("Telefono del Lugar:", textAlign: TextAlign.right),
            TextFormField(
                decoration:
                    InputDecoration(hintText: "Escribe Telefono del Lugar"),
                controller: txttelfLug,
                keyboardType: TextInputType.number,
                maxLength: 12,
                validator: (value) {
                  if (value != "") {
                    return 'Escribe Telefono del Lugar';
                  }
                  return null;
                },
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter
                ])
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(0),
        child: Column(
          children: [
            Text("Altitud del Lugar:", textAlign: TextAlign.right),
            TextFormField(
                decoration:
                    InputDecoration(hintText: "Escribe Altitud del Lugar"),
                controller: txtaltLug,
                keyboardType: TextInputType.number,
                maxLength: 40,
                validator: (value) {
                  if (value != "") {
                    return 'Escribe Altitud del Lugar';
                  }
                  return null;
                },
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter
                ])
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(0),
        child: Column(
          children: [
            Text("Latitud del Lugar:", textAlign: TextAlign.right),
            TextFormField(
                decoration:
                    InputDecoration(hintText: "Escribe Latitud del Lugar"),
                controller: txtlatLug,
                keyboardType: TextInputType.number,
                maxLength: 40,
                validator: (value) {
                  if (value != "") {
                    return 'Escribe Latitud del Lugar';
                  }
                  return null;
                },
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter
                ])
          ],
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        this
            .componentes
            .btn(100, 50, 200, "GUARDAR", pAccion: () => confirmar()),
        this.componentes.btn(200, 0, 0, "CANCELAR", pAccion: () => cerrar())
      ])
    ]);
  }

  salvarDatos(mLugar mod) async {
    String resp = await metodos.rLugar(mod);
    final respjson = jsonDecode(resp);
    //  print(resp);
    var fondo;
    if (respjson['est'] == 'success') {
      fondo = Colors.blue;
    } else {
      fondo = Colors.red;
    }
    Navigator.of(context).pop();
    Fluttertoast.showToast(
        msg: respjson['msj'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: fondo,
        textColor: Colors.white,
        fontSize: 16.0);
    if (respjson['est'] == 'success') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => vLugares(usuario: widget.usuario)));
    } else {
      fondo = Colors.red;
    }
  }

  void confirmar() {
    String descrLug = txtdescrLug.text;
    String dirLug = txtdirLug.text;
    String telfLug = txttelfLug.text;
    String altLug = txtaltLug.text;
    String latLug = txtlatLug.text;

    if (descrLug != "" &&
        dirLug != "" &&
        telfLug != "" &&
        altLug != "" &&
        latLug != "") {
      mLugar mod = mLugar("", descrLug, dirLug, telfLug, altLug, latLug, "");
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
                          child: Text("CONFIRMACION DE ACCION",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14))),
                    ])
              ]),
              content: Container(
                  child: Text("¿DESEAS REGISTRAR EL LUGAR?",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14))),
              actions: <Widget>[
                this.componentes.btn(0, 0, 250, "REGISTRAR",
                    pAccion: () => salvarDatos(mod)),
                this.componentes.btn(250, 0, 0, "CANCELAR",
                    pAccion: () => {Navigator.of(context).pop()})
              ],
            );
          });
    } else {
      Fluttertoast.showToast(
          msg: "NO SE REALIZO LA ACCION,VERIFICAR DATOS",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void cerrar() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => vDocentes(usuario: widget.usuario)));
  }
}
