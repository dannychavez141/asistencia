import 'dart:async';
import 'dart:convert';
import 'package:app/clases/sesion.dart';
import 'package:app/clases/cActividad.dart';
import 'package:app/modelos/mActividad.dart';
import 'package:app/viewDocente/rActividadDoc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:app/clases/vistas.dart';
import 'package:flutter/services.dart';
import 'dart:io' show File, Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../modelos/Musuario.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class vActividadDoc extends StatefulWidget {
  final Musuario usuario;

  const vActividadDoc({super.key, required this.usuario});

  @override
  State<vActividadDoc> createState() => _vActividadDocState();
}

class _vActividadDocState extends State<vActividadDoc> {
  cActividad metodos = new cActividad();
  sesion ses = sesion();
  late Future<List<mActividad>> lista;
  late Vistas componentes;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  late Position ubicacion;

  @override
  void initState() {
    super.initState();
    lista = metodos.getDatos(widget.usuario.id);
  }

  @override
  Widget build(BuildContext context) {
    componentes = new Vistas("ACTIVIDADES", context, widget.usuario);
    return Scaffold(
        drawer: componentes.menu(widget.usuario.tipoUsu),
        appBar: AppBar(title: Text(componentes.titulopage)),
        body: Center(
          child: Column(
            children: <Widget>[pantalla(context)],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        rActividadDoc(usuario: widget.usuario)));
          }),
          tooltip: 'Registro de Actividades',
          child: const Icon(Icons.add),
        ));
  }

  Widget pantalla(context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(6),
          child: const Text(
            "ACTIVIDADES REGISTRADAS",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Center(
            child: Container(
          margin: const EdgeInsets.all(10),
          child: const Text("Lista de Actividades:"),
        )),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text("Nombre de Actividad")),
              Container(
                  margin: const EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Text("Fecha-Lugar-Hora")),
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

  Widget listaDatos(context) {
    return FutureBuilder(
        future: lista,
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

  List<Widget> elementos(List<mActividad>? data) {
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
              width: MediaQuery.of(context).size.width * 0.25,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(ele.descrAct),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(ele.tipo.descrTipAct),
                  ) /*,
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(ele.docente.apemaDoc),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(3),
                  )*/
                ],
              )),
          Container(
              margin: const EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width * 0.40,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(ele.fechaAct),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(ele.lugar.descrLug),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text("De " + ele.hIniAct + "a " + ele.hFinAct),
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
                if (ele.hIniDoc == "")
                  Container(
                      margin: EdgeInsets.all(1),
                      child: this.componentes.btn(0, 200, 190, "Marcar Inicio",
                          pAccion: () => {marcarEvento(ele, 1)})),
                if (ele.hIniDoc != "" && ele.hFinDoc == "")
                  Container(
                      margin: EdgeInsets.all(1),
                      child: this.componentes.btn(252, 190, 47, "Marcar Fin",
                          pAccion: () => {marcarEvento(ele, 2)})),
                if (ele.hIniDoc != "" && ele.hFinDoc != "")
                  Container(
                      margin: EdgeInsets.all(1),
                      child: Text("Finalizado",style: TextStyle(
                        fontSize: 12,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Colors.red[700]!,
                      )))
              ]))
        ],
      )));
    }
    return element;
  }

  Future<void> marcarEvento(mActividad doc, int tip) async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    ubicacion = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(ubicacion); //here you will get your Latitude and Longitude
    print("local:" + doc.lugar.altLug + " " + doc.lugar.latLug);
    double dist = calculateDistance(ubicacion.latitude, ubicacion.longitude,
        double.parse(doc.lugar.altLug), double.parse(doc.lugar.latLug));
    if (dist < 30) {
      final DateTime now = DateTime.now();
      String dia = DateFormat('yyyy-MM-dd').format(now);
      String hora = DateFormat('HH:mm:ss').format(now);

      DateTime fecha1 = DateTime.parse(doc.fechaAct + " " + doc.hIniAct + "Z");
      if (tip == 2) {
        fecha1 = DateTime.parse(doc.fechaAct + " " + doc.hFinAct + "Z");
      }
      DateTime fecha2 = DateTime.parse(dia + " " + hora + "Z");
      Duration horaTotal = fecha1.difference(fecha2);
      print(doc.fechaAct + " " + doc.hIniAct + "Z");
      print(dia + " " + hora + "Z");
      print(horaTotal.inMinutes);
      if (horaTotal.inMinutes > -10 && horaTotal.inMinutes < 10) {
        String resp = await metodos.marcar(doc, tip, hora, ubicacion.longitude.toString(),
            ubicacion.latitude.toString());
        lista = metodos.getDatos(widget.usuario.id);
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
       }
      } else {
        Fluttertoast.showToast(
            msg:
                "No se puede realizar la acción por que solo tiene 15 minutos antes o después del inicio o cierre de la actividad para marcar asistencia o salida.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      Fluttertoast.showToast(
          msg:
              "No se puede realizar la acción  por que se encuentra fuera del rango del lugar de la actividad.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

/* Navigator.push(context,
        MaterialPageRoute(builder: (context) => modHoraro(usuario: widget.usuario,mdoc: doc)));*/
  }

  double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
    int radiusEarth = 6371;
    double distanceKm;
    double distanceMts;
    double dlat, dlng;
    double a;
    double c;

    //Convertimos de grados a radianes
    lat1 = math.radians(lat1);
    lat2 = math.radians(lat2);
    lng1 = math.radians(lng1);
    lng2 = math.radians(lng2);
    // Fórmula del semiverseno
    dlat = lat2 - lat1;
    dlng = lng2 - lng1;
    a = sin(dlat / 2) * sin(dlat / 2) +
        cos(lat1) * cos(lat2) * (sin(dlng / 2)) * (sin(dlng / 2));
    c = 2 * atan2(sqrt(a), sqrt(1 - a));

    distanceKm = radiusEarth * c;
    //print('Distancia en Kilométros:$distanceKm');
    distanceMts = 1000 * distanceKm;
    print('Distancia en Metros:$distanceMts');

    //return distanceKm;
    return distanceMts;
  }
}
