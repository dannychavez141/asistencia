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
import 'dart:io' show File, Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'modelos/Musuario.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class mdLugar extends StatefulWidget {
  final Musuario usuario;
  final mLugar mod;

  const mdLugar({super.key, required this.usuario, required this.mod});

  @override
  State<mdLugar> createState() => _mdLugarState();
}

class _mdLugarState extends State<mdLugar> {
  TextEditingController txtdescrLug = TextEditingController();
  TextEditingController txtdirLug = TextEditingController();
  TextEditingController txttelfLug = TextEditingController();
  TextEditingController txtaltLug = TextEditingController();
  TextEditingController txtlatLug = TextEditingController();
  String est = "1";
  cLugar metodos = new cLugar();
  sesion ses = sesion();
String estado="ACTIVO";
  late Vistas componentes;

  @override
  void initState() {
    txtdescrLug.text = widget.mod.descrLug;
    txtdirLug.text = widget.mod.dirLug;
    txttelfLug.text = widget.mod.telfLug;
    txtaltLug.text = widget.mod.altLug;
    txtlatLug.text = widget.mod.latLug;
    est = widget.mod.estLug;
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
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.90,
        height: MediaQuery.of(context).size.height*0.87,
        child: new SingleChildScrollView(child: registro()));
  }

  Widget registro() {
    const List<String> list = <String>['ACTIVO', 'INACTIVO'];
    print(widget.mod.estLug+"ACA TOY");
    estado=list[(int.parse(widget.mod.estLug)-1)];
    return Column(children: [
      Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(6),
              child: const Text(
                "MODIFICANDO LUGAR",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Text("Descripción  del Lugar:", textAlign: TextAlign.right),
            TextFormField(
              decoration: InputDecoration(hintText: "Escribe Descripción  del Lugar"),
              controller: txtdescrLug,
              keyboardType: TextInputType.text,
              maxLength: 100,
              validator: (value) {
                if (value != "") {
                  return 'Escribe Descripción  del Lugar';
                }
                return null;
                return 'Ingrese el numero';
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
            Text("Dirección del Lugar:", textAlign: TextAlign.right),
            TextFormField(
                decoration: InputDecoration(hintText: "Dirección del Lugar"),
                controller: txtdirLug,
                keyboardType: TextInputType.text,
                maxLength: 60,
                validator: (value) {
                  if (value != "") {
                    return 'Escribe Dirección del Lugar';
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
                decoration: InputDecoration(hintText: "Telefono del Lugar"),
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
                  FilteringTextInputFormatter.digitsOnly
                ])
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(0),
        child: Column(
          children: [
            Text("Longitud del Lugar:", textAlign: TextAlign.right),
            TextFormField(
                decoration:
                    InputDecoration(hintText: "Escribe Longitud del Lugar"),
                controller: txtaltLug,
                keyboardType: TextInputType.number,
                maxLength: 30,
                validator: (value) {
                  if (value != "") {
                    return 'Escribe Longitud del Lugar';
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
                decoration: InputDecoration(
                    hintText: "Escribe Latitud del Lugar"),
                controller: txtlatLug,
                keyboardType: TextInputType.text,
                maxLength: 20,
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
      Container(
        margin: EdgeInsets.all(0),
        child: Column(
          children: [
            Text("Estado del Lugar:", textAlign: TextAlign.right),
            DropdownButton<String>(
              value: estado,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  estado = value!;
                 for (var i = 0; i < list.length; i++) {
                    if(list[i]==estado){
                      widget.mod.estLug=(i+1).toString();
                      print(widget.mod.estLug);
                    }
                  }
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )],
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        this
            .componentes
            .btn(100, 50, 200, "MODIFICAR", pAccion: () => confirmar()),
        this.componentes.btn(200, 0, 0, "CANCELAR", pAccion: () => cerrar())
      ])
    ]);
  }

  salvarDatos(mLugar reg) async {

    String resp = await metodos.mdLugar(reg);
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
    if (descrLug != "" && dirLug != "" && telfLug != "" && altLug != "" && latLug != "") {
      mLugar reg = mLugar(widget.mod.idLug, descrLug, dirLug, telfLug, altLug, latLug, widget.mod.estLug);
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
                  child: Text("¿DESEAS MODIFICAR EL LUGAR?",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14))),
              actions: <Widget>[
                this
                    .componentes
                    .btn(0, 0, 250, "MODIFICAR", pAccion: () => salvarDatos(reg)),
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
            builder: (context) => vLugares(usuario: widget.usuario)));
  }
}
