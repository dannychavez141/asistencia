// ignore_for_file: prefer_interpolation_to_compose_strings
import 'package:flutter/services.dart';
import 'package:app/clases/sesion.dart';
import 'package:flutter/material.dart';
import 'clases/vistas.dart';
import 'modelos/Musuario.dart';


sesion ses = sesion();
 //Musuario usuario = Musuario("", "", "", "","","");

class principal extends StatefulWidget {
  final Musuario usuario;
  const principal({super.key,required this.usuario});

  @override
  State<principal> createState() => _principalState();
}

class _principalState extends State<principal> {
  String idAnio = "";

  @override
  void initState()  {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    ses.verificarInicio().then((value) {
      setState(() {
       // widget.usuario = value;
        print(widget.usuario);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(usuario);
    Vistas componentes = new Vistas("Menu Principal", context, widget.usuario);
    return Scaffold(
        drawer: componentes.menu(widget.usuario.tipoUsu),
        appBar: AppBar(title: Text(componentes.titulopage)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [componentes.Inicio(widget.usuario.nombUsu)],
          ),
        ));
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
