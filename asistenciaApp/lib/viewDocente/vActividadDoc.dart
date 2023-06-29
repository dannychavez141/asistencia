import 'dart:async';
import 'package:app/clases/sesion.dart';
import 'package:app/clases/cActividad.dart';
import 'package:app/modelos/mActividad.dart';
import 'package:app/viewDocente/rActividadDoc.dart';
import 'package:app/viewDocente/rHorario.dart';
import 'package:flutter/material.dart';
import 'package:app/clases/vistas.dart';
import 'package:flutter/services.dart';
import 'dart:io' show File, Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../modelos/Musuario.dart';

class vActividadDoc extends StatefulWidget {
  final Musuario usuario;

  const vActividadDoc({super.key, required this.usuario});

  @override
  State<vActividadDoc> createState() => _vActividadDocState();
}

class _vActividadDocState extends State<vActividadDoc> {
  late Future<List<mActividad>> lista;
  cActividad metodos = new cActividad();
  sesion ses = sesion();

  late Vistas componentes;
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => rActividadDoc(usuario: widget.usuario)));
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
    child: Text("Lugar")),
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
                  )/*,
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
                children: [Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(ele.fechaAct),
                ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text("De "+ele.hIniAct),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text("a "+ele.hFinAct),
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

                Container(margin: EdgeInsets.all(0), child: this.componentes.btn(200, 0, 0, "Modificar", pAccion: () => {saltoMod(ele)}))
              ]))

        ],
      )));
    }
    return element;
  }

  void saltoMod(mActividad doc){
   /* Navigator.push(context,
        MaterialPageRoute(builder: (context) => modHoraro(usuario: widget.usuario,mdoc: doc)));*/
  }

  }




