
import 'package:app/clases/Calumnos.dart';
import 'package:app/modelos/Malumno.dart';
import 'package:app/modelos/Masistencia.dart';
import 'package:flutter/material.dart';


class asistencias extends StatefulWidget {
  final Malumno matricula;
  const asistencias({super.key,required this.matricula});

  @override
  State<asistencias> createState() => _asistenciasState();
}

class _asistenciasState extends State<asistencias> {
  late Future<List<Masistencia>> lAlumnos;
  Calumnos metodos = new Calumnos();
  String idMes="0";
  @override
  void initState()  {
    super.initState();
    lAlumnos = metodos.getAsistencias(widget.matricula.id,idMes);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(title: Text("ASISTENCIAS")),
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
            "ASISTENCIAS REGISTRADAS",
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
                  child: Column(children: [Center(child: Text("Selecciona el Mes:"),),spMeses()],) ),
              Container(
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: btnBuscar())
            ]),
        Center(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: const Text("Lista de Asistencia:"),
            )),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: listaDatos(context)),
      ],
    );
  }

  Widget spMeses() {
    List<String> meses=["TODOS","ENERO",
      "FEBRERO",
      "MARZO",
      "ABRIL",
      "MAYO",
      "JUNIO",
      "JULIO",
      "AGOSTO",
      "SETIEMBRE",
      "OCTUBRE",
      "NOVIEMBRE",
      "DICIEMBRE"
    ];
    String selectedFc = meses.first;
    return   DropdownButtonFormField(
      hint: Text('Seleccionar'),
      value: selectedFc,
      onChanged: (String? newValue) {
        setState(() {
          selectedFc = newValue!;
          idMes = newValue;
         lAlumnos = metodos.getAsistencias(widget.matricula.id,idMes);
          print(idMes);
        });
      },
      items: meses.map((item) => DropdownMenuItem<String>(
          onTap:(){
            setState(() {
              //CREA UNA VARIABLE DE CLASE DEL ID
              idMes = item;
            });
          },
          child: Text(item, textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
          value: item)).toList(),
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
                  lAlumnos = metodos.getAsistencias(widget.matricula.id,idMes);
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



  List<Widget> elementos(List<Masistencia>? data) {
    List<Widget> element = [];
    int i = 0;
    for (var ele in data!) {
      i++;
      String img = "";
      var hora= ele.hora.split(":");
      bool tarde=false;
      if((int.parse(hora[0])==7 && int.parse(hora[1])>40) || (int.parse(hora[0])>8 ))
      {tarde=true;

      }
      if (tarde== false) {
        img = metodos.conexion.url + "/img/caritabuena.jpg";
      } else {
        img = metodos.conexion.url + "/img/caritamala.jpg";
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
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          // print("por que me tocas papi"+ele.dni);
                          detallerAlu(ele);
                        });
                      },
                      child: Image.network(img))),
              Container(
                  margin: const EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(ele.Alumno),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(ele.grado+" "+ele.seccion+" "+ele.tipo),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(ele.fecha),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text( ele.hora),
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
                   // Container(margin: EdgeInsets.all(2),child: btnDatos(ele)),
                    tardanza(tarde)
                  ])),
            ],
          )));
    }
    return element;
  }
  Widget tardanza(bool tarde){
    if (tarde== false) {
      return Text("LLego Temprano",textAlign: TextAlign.center,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.blue));
    } else {
      return Text("LLego Tarde",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red));
    }
   
  }

  void detallerAlu(Masistencia ele) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (buildcontext) {
          String img;
          if (ele.tentrada == "1") {
            img = metodos.conexion.url + "/img/caritabuena.jpg";
          } else {
            img = metodos.conexion.url + "/img/caritamala.jpg";
          }
          return AlertDialog(
            insetPadding: EdgeInsets.all(0),
            title: Text(ele.tentrada),
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



}