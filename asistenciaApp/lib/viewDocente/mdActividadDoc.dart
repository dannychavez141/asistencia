import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:app/clases/sesion.dart';
import 'package:app/vDocentes.dart';
import 'package:flutter/material.dart';
import 'package:app/clases/cDocente.dart';
import 'package:app/modelos/mDocente.dart';
import 'package:app/clases/vistas.dart';
import 'package:flutter/services.dart';
import 'dart:io' show File, Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../modelos/Musuario.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class modHoraro extends StatefulWidget {
  final Musuario usuario;
  final mDocente mdoc;

  const modHoraro({super.key, required this.usuario, required this.mdoc});

  @override
  State<modHoraro> createState() => _modHoraroState();
}
class _modHoraroState extends State<modHoraro> {
  TextEditingController txtDni = TextEditingController();
  TextEditingController txtClave = TextEditingController();
  TextEditingController txtNomb = TextEditingController();
  TextEditingController txtApepa = TextEditingController();
  TextEditingController txtApema = TextEditingController();
  String est = "1";
  cDocente metodos = new cDocente();
  sesion ses = sesion();

  late Vistas componentes;

  @override
  void initState() {
    txtDni.text = widget.mdoc.dniDoc;
    txtNomb.text = widget.mdoc.nomDoc;
    txtApepa.text = widget.mdoc.apepaDoc;
    txtApema.text = widget.mdoc.apemaDoc;
    txtClave.text = widget.mdoc.claveDoc;
    est = widget.mdoc.est;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    componentes = new Vistas("DOCENTES", context, widget.usuario);

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
        child: new SingleChildScrollView(child: regDoc()));
  }

  Widget regDoc() {

    return Column(children: [
      Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(6),
              child: const Text(
                "MODIFICANDO DOCENTES",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Text("Dni:", textAlign: TextAlign.right),
            TextFormField(
              decoration: InputDecoration(hintText: "Escribe DNI del Docente"),
              controller: txtDni,
              keyboardType: TextInputType.number,
              maxLength: 8,
              validator: (value) {
                if (value != "") {
                  return 'Escribe nro de DNI';
                }
                return null;
                return 'Ingrese el numero';
              },
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(0),
        child: Column(
          children: [
            Text("Clave:", textAlign: TextAlign.right),
            TextFormField(
                decoration: InputDecoration(hintText: "Escribe Clave"),
                controller: txtClave,
                keyboardType: TextInputType.text,
                maxLength: 12,
                validator: (value) {
                  if (value != "") {
                    return 'Escribe Clave del Docente';
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
            Text("Nombres:", textAlign: TextAlign.right),
            TextFormField(
                decoration:
                InputDecoration(hintText: "Escribe Nombres del Docente"),
                controller: txtNomb,
                keyboardType: TextInputType.text,
                maxLength: 30,
                validator: (value) {
                  if (value != "") {
                    return 'Escribe Nombres del Docente';
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
            Text("Apellido Paterno:", textAlign: TextAlign.right),
            TextFormField(
                decoration: InputDecoration(
                    hintText: "Escribe Apellido Paterno del Docente"),
                controller: txtApepa,
                keyboardType: TextInputType.text,
                maxLength: 20,
                validator: (value) {
                  if (value != "") {
                    return 'Escribe Apellido Paterno del Docente';
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
            Text("Apellido Materno:", textAlign: TextAlign.right),
            TextFormField(
                decoration: InputDecoration(
                    hintText: "Escribe Apellido Paterno del Docente"),
                controller: txtApema,
                keyboardType: TextInputType.text,
                maxLength: 20,
                validator: (value) {
                  if (value != "") {
                    return 'Escribe Apellido Paterno del Docente';
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
            .btn(100, 50, 200, "MODIFICAR", pAccion: () => confirmar()),
        this.componentes.btn(200, 0, 0, "CANCELAR", pAccion: () => cerrar())
      ])
    ]);
  }

  salvarDatos() async {
    String dni = txtDni.text;
    String nomb = txtNomb.text;
    String apepa = txtApepa.text;
    String apema = txtApema.text;
    String clave = txtClave.text;

    mDocente doc = mDocente(widget.mdoc.idDoc, dni, clave, nomb, apepa, apema,
        "", "1", "", "", "", "");
    String resp = await metodos.mdDocente(doc);
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
              builder: (context) => vDocentes(usuario: widget.usuario)));
    } else {
      fondo = Colors.red;
    }
  }


  void confirmar() {
    String dni = txtDni.text;
    String clave = txtClave.text;
    String nomb = txtNomb.text;
    String apepa = txtApepa.text;
    String apema = txtApema.text;
    if (dni.length == 8 && clave.length >= 4  && nomb != "" && apema != "" && apepa != "") {
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
                  child: Text("¿DESEAS MODIFICAR AL DOCENTE?",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14))),
              actions: <Widget>[
                this
                    .componentes
                    .btn(0, 0, 250, "MODIFICAR", pAccion: () => salvarDatos()),
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
