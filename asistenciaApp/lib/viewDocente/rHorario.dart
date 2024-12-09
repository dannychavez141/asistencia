import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:app/clases/cHorario.dart';
import 'package:app/clases/sesion.dart';
import 'package:app/modelos/mDia.dart';
import 'package:app/modelos/mHorario.dart';
import 'package:app/vDocentes.dart';
import 'package:app/viewDocente/vHorario.dart';
import 'package:flutter/material.dart';
import 'package:app/clases/cDocente.dart';
import 'package:app/modelos/mDocente.dart';
import 'package:app/clases/vistas.dart';
import 'package:flutter/services.dart';
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../modelos/Musuario.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
class rHorario extends StatefulWidget {
  final Musuario usuario;

  const rHorario({super.key, required this.usuario});

  @override
  State<rHorario> createState() => _rHorarioState();
}

class _rHorarioState extends State<rHorario> {
  TextEditingController txtNomb = TextEditingController();
  TextEditingController hentrada = TextEditingController();
  TextEditingController hsalida = TextEditingController();
  cHorario metodos = new cHorario();
  sesion ses = sesion();
  late Vistas componentes;
  int iddia=0;
  List<String> dias = <String>[
    'Lunes',
    'Martes',
    'Miercoles',
    'Jueves',
    'Viernes',
    'Sabado'
  ];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    componentes = new Vistas("REGISTRO DE HORARIO", context, widget.usuario);
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
            "REGISTRANDO HORARIO",
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
            Text("DOCENTE:", textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Text(widget.usuario.dniUsu+"-"+widget.usuario.nombUsu+" "+widget.usuario.apepaUsu+" "+widget.usuario.apemaUsu, textAlign: TextAlign.right)
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Text("DIA DE HORARIO:", textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            cbDias()
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(0),
        child: Column(
          children: [
            Text("HORA DE ENTRADA", textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            TextField(
              controller: hentrada, //editing controller of this TextField
              decoration: InputDecoration(
                  icon: Icon(Icons.timer), //icon of text field
                  labelText: "Selecione hora de entrada." //label text of field
              ),
              readOnly: true,  //set it true, so that user will not able to edit text
              onTap: () async {
                TimeOfDay? pickedTime =  await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                if(pickedTime != null ){
                  print(pickedTime.format(context));   //output 10:51 PM
                  String formattedTime =pickedTime.format(context).toString()+":00";
                  try{
                    DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                    //converting to DateTime so that we can further format on different pattern.
                    print(parsedTime); //output 1970-01-01 22:53:00.000
                    String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                    print(formattedTime); //output 14:59:00
                    //DateFormat() is from intl package, you can format the time on any pattern you need.
                  }catch(e){}
                  setState(() {
                    hentrada.text = formattedTime; //set the value of text field.
                  });
                }else{
                  print("Hora no seleccionada");
                }
              },
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(1,10,1,1),
        child: Column(
          children: [
            Text("HORARIO DE SALIDA", textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            TextField(
        controller: hsalida, //editing controller of this TextField
        decoration: InputDecoration(
            icon: Icon(Icons.timer), //icon of text field
            labelText: "Selecione hora de salida." //label text of field
        ),
        readOnly: true,  //set it true, so that user will not able to edit text
        onTap: () async {
          TimeOfDay? pickedTime =  await showTimePicker(
            initialTime: TimeOfDay.now(),
            context: context,
          );

          if(pickedTime != null ){
            print(pickedTime.format(context));   //output 10:51 PM
            String formattedTime =pickedTime.format(context).toString()+":00";
            try{
            DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
            //converting to DateTime so that we can further format on different pattern.
            print(parsedTime); //output 1970-01-01 22:53:00.000
            String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
            print(formattedTime); //output 14:59:00
            //DateFormat() is from intl package, you can format the time on any pattern you need.
    }catch(e){}
            setState(() {
              hsalida.text = formattedTime; //set the value of text field.
            });
          }else{
            print("Time is not selected");
          }
        },
      )

          ],
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Container( margin: EdgeInsets.all(5),
    child:  this.componentes
            .btn(100, 50, 200, "GUARDAR", pAccion: () => confirmar())),
        Container( margin: EdgeInsets.all(5),
            child: this.componentes.btn(200, 0, 0, "CANCELAR", pAccion: () => cerrar())
        )
      ])
    ]);
  }

  salvarDatos() async {
    String hent = hentrada.text;
    String hsal = hsalida.text;
    String dia=(iddia+1).toString();
   String idDoc= widget.usuario.id;
   //print(idDoc);
    mHorario doc = mHorario("", new mDocente(idDoc, "", "", "","","","","","","","",""),new mDia(dia, "", "") , hent, hsal);
    String resp = await metodos.rHorario(doc);
    final respjson = jsonDecode(resp);
    //  print(resp);
    var fondo;
    if (respjson['est'] == 'success') {
       fondo=Colors.blue;
    } else {
       fondo=Colors.red;
    }
    Navigator.of(context).pop();
    Fluttertoast.showToast(
        msg: respjson['msj'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: fondo ,
        textColor: Colors.white,
        fontSize: 16.0);
    if (respjson['est'] == 'success') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => vHorario(usuario: widget.usuario)));
    } else {
      fondo=Colors.red;
    }
  }


  void confirmar() {
    String hent = hentrada.text;
    String hsal = hsalida.text;
    if ( hent != "" && hsal != "" ) {
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
                this
                    .componentes
                    .btn(0, 0, 250, "REGISTRAR", pAccion: () => salvarDatos()),
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
  Widget cbDias() {
    return DropdownButton<String>(
      value: dias[iddia],
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
          for (var dia in dias) {
            if (dia == value) {
              iddia = pos;
             // print(iddia);
            }
            pos++;
          }
        });
      },
      items: dias.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
    );
    ;
  }
  void cerrar() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => vDocentes(usuario: widget.usuario)));
  }
}
