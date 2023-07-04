import 'dart:async';
import 'dart:convert';
import 'package:app/clases/cActividad.dart';
import 'package:app/clases/cLugar.dart';
import 'package:app/clases/sesion.dart';
import 'package:app/modelos/mActividad.dart';
import 'package:app/modelos/mLugar.dart';
import 'package:app/modelos/mTipoAct.dart';
import 'package:app/viewDocente/vActividadDoc.dart';
import 'package:flutter/material.dart';
import 'package:app/modelos/mDocente.dart';
import 'package:app/clases/vistas.dart';
import 'package:flutter/services.dart';
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../modelos/Musuario.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class rActividadDoc extends StatefulWidget {
  final Musuario usuario;

  const rActividadDoc({super.key, required this.usuario});

  @override
  State<rActividadDoc> createState() => _rActividadDocState();
}

class _rActividadDocState extends State<rActividadDoc> {
  TextEditingController descrAct = TextEditingController();
  TextEditingController hentrada = TextEditingController();
  TextEditingController hsalida = TextEditingController();
  TextEditingController fActi = TextEditingController();
  cActividad metodos = new cActividad();
  cLugar cLug = new cLugar();
  sesion ses = sesion();
  late Vistas componentes;
  late Future<List<mTipoAct>> tipos;
  late Future<List<mLugar>> lugares;
   mTipoAct tipo = mTipoAct("", "", "");
   mLugar lugar= mLugar("", "", "","", "", "","");
  int idTipo = 0;
  int idLugar = 0;

  @override
  void initState() {
    super.initState();
    lugares = cLug.getLugares("");
    tipos = metodos.getTipos();


  }

  @override
  Widget build(BuildContext context) {
    componentes = new Vistas("REGISTRO DE ACTIVIDAD", context, widget.usuario);
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
            "REGISTRANDO ACTIVIDAD",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(width: 350, child: regDoc()),
      ],
    );
  }

  Widget regDoc() {
    return Column(children: [
      Container(
        child: Column(
          children: [
            Text("DOCENTE:",
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Text(
                widget.usuario.dniUsu +
                    "-" +
                    widget.usuario.nombUsu +
                    " " +
                    widget.usuario.apepaUsu +
                    " " +
                    widget.usuario.apemaUsu,
                textAlign: TextAlign.right)
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(1, 10, 1, 10),
        child: Column(
          children: [
            Text("LUGAR DE ACTIVIDAD",
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            getLugares(context)
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(1, 10, 1, 10),
        child: Column(
          children: [
            Text("TIPO DE ACTIVIDAD",
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            getTipos(context)
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(1, 10, 1, 10),
        child: Column(
          children: [
            Text("DESCRIPCION DE ACTIVIDAD",
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            TextFormField(
                decoration: InputDecoration(
                    hintText: "Escribe Descripcion de Actividad"),
                controller: descrAct,
                keyboardType: TextInputType.text,
                maxLength: 100,
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
        margin: EdgeInsets.fromLTRB(1, 10, 1, 10),
        child: Column(
          children: [
            Text("FECHA DE ACTIVIDAD",
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            TextField(
              controller: fActi,
              //editing controller of this TextField
              decoration: InputDecoration(
                  icon: Icon(Icons.calendar_month), //icon of text field
                  labelText:
                      "Selecione fecha de Actividad." //label text of field
                  ),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100));
                if (pickedTime != null) {
                  //converting to DateTime so that we can further format on different pattern.
                  String formattedTime =
                      DateFormat('yyyy-MM-dd').format(pickedTime);
                  print(formattedTime); //output 14:59:00
                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                  setState(() {
                    fActi.text = formattedTime; //set the value of text field.
                  });
                } else {
                  print("Fecha no Seleccionada");
                }
              },
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(0),
        child: Column(
          children: [
            Text("HORA DE ENTRADA",
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            TextField(
              controller: hentrada,
              //editing controller of this TextField
              decoration: InputDecoration(
                  icon: Icon(Icons.timer), //icon of text field
                  labelText: "Selecione hora de entrada." //label text of field
                  ),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );
                if (pickedTime != null) {
                  print(pickedTime.format(context)); //output 10:51 PM
                  DateTime parsedTime = DateFormat.jm()
                      .parse(pickedTime.format(context).toString());
                  //converting to DateTime so that we can further format on different pattern.
                  print(parsedTime); //output 1970-01-01 22:53:00.000
                  String formattedTime =
                      DateFormat('HH:mm:ss').format(parsedTime);
                  print(formattedTime); //output 14:59:00
                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                  setState(() {
                    hentrada.text =
                        formattedTime; //set the value of text field.
                  });
                } else {
                  print("Hora no seleccionada");
                }
              },
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(1, 10, 1, 1),
        child: Column(
          children: [
            Text("HORARIO DE SALIDA",
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            TextField(
              controller: hsalida,
              //editing controller of this TextField
              decoration: InputDecoration(
                  icon: Icon(Icons.timer), //icon of text field
                  labelText: "Selecione hora de salida." //label text of field
                  ),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                if (pickedTime != null) {
                  print(pickedTime.format(context)); //output 10:51 PM
                  DateTime parsedTime = DateFormat.jm()
                      .parse(pickedTime.format(context).toString());
                  //converting to DateTime so that we can further format on different pattern.
                  print(parsedTime); //output 1970-01-01 22:53:00.000
                  String formattedTime =
                      DateFormat('HH:mm:ss').format(parsedTime);
                  print(formattedTime); //output 14:59:00
                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                  setState(() {
                    hsalida.text = formattedTime; //set the value of text field.
                  });
                } else {
                  print("Hora no seleccionada");
                }
              },
            )
          ],
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: EdgeInsets.all(5),
            child: this
                .componentes
                .btn(100, 50, 200, "GUARDAR", pAccion: () => confirmar())),
        Container(
            margin: EdgeInsets.all(5),
            child: this
                .componentes
                .btn(200, 0, 0, "CANCELAR", pAccion: () => cerrar()))
      ])
    ]);
  }

  salvarDatos(mActividad dato) async {
    String resp = await metodos.registrar(dato);
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
              builder: (context) => vActividadDoc(usuario: widget.usuario)));
    } else {
      fondo = Colors.red;
    }
  }

  void confirmar() {
    String hent = hentrada.text;
    String hsal = hsalida.text;
    String fAct = fActi.text;
    String descr = descrAct.text;
    print(lugar.toString());
    print(tipo.toString());
    if (hent != "" && hsal != "" && fAct != "") {
      mActividad dato = mActividad(
          "",
          new mDocente(
              widget.usuario.id, "", "", "", "", "", "", "", "", "", "", ""),
          lugar,
          tipo,
          descr,
          fAct,
          hent,
          hsal,"","","","","","");
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
                  child: Text("¿DESEAS REGISTRAR AL DOCENTE?",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14))),
              actions: <Widget>[
                this.componentes.btn(0, 0, 250, "REGISTRAR",
                    pAccion: () => salvarDatos(dato)),
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

  Widget getLugares(context) {
    return FutureBuilder(
        future: lugares,
        builder: (context, snapshop) {
          if (snapshop.hasData) {
            // print(snapshop.data);
            // List<Calumno>? datos= snapshop.data;
            if (lugar.idLug == "") {
              lugar = snapshop.data![0];
            }
            return cbLugar(snapshop.data);
          } else if (snapshop.hasError) {
            print(snapshop.error);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Widget cbLugar(List<mLugar>? datos) {
    // print(lugar.toString());
    return DropdownButton<String>(
      value: datos?[idLugar].descrLug,
      icon: const Icon(Icons.arrow_downward),
      elevation: 20,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          int pos = 0;
          for (var dato in datos!) {
            if (dato.descrLug == value) {
              idLugar = pos;
              lugar = dato;
              print(lugar.toString());
            }
            pos++;
          }
        });
      },
      items: datos?.map((mLugar value) {
        return DropdownMenuItem<String>(
          value: value.descrLug,
          child: Text(
            value.descrLug as String,
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
    );
  }

  Widget getTipos(context) {
    return FutureBuilder(
        future: tipos,
        builder: (context, snapshop) {
          if (snapshop.hasData) {
            // print(snapshop.data);
            // List<Calumno>? datos= snapshop.data;
            if (tipo.idTipAct=="") {
              tipo = snapshop.data![0];
            }
            return cbTipo(snapshop.data);
          } else if (snapshop.hasError) {
            print(snapshop.error);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Widget cbTipo(List<mTipoAct>? datos) {
    //print(tipo.toString());
    return DropdownButton<String>(
      value: datos?[idTipo].descrTipAct,
      icon: const Icon(Icons.arrow_downward),
      elevation: 20,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          int pos = 0;
          for (var dato in datos!) {
            if (dato.descrTipAct == value) {
              idTipo = pos;
              tipo = dato;
              print(tipo.toString());
            }
            pos++;
          }
        });
      },
      items: datos?.map((mTipoAct value) {
        return DropdownMenuItem<String>(
          value: value.descrTipAct,
          child: Text(
            value.descrTipAct as String,
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
    );
  }

  void cerrar() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => vActividadDoc(usuario: widget.usuario)));
  }
}
