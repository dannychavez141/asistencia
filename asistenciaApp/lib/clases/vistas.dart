import 'package:app/clases/sesion.dart';
import 'package:app/main.dart';
import 'package:app/principal.dart';
import 'package:flutter/material.dart';
import 'package:app/matriculas.dart';
import '../docentes.dart';
import '../modelos/Musuario.dart';

class Vistas {
  String titulopage;
  BuildContext context;
  Musuario usuario;

  Vistas(this.titulopage, this.context, this.usuario);

  Widget menu(String tUsusario) {
    Widget menu = Column();
    if (tUsusario == "admin") {
      menu = menuAdmin();
    } else if (tUsusario == "docente") {
      menu = menuDocente();
    }
    return Drawer(
      child: Container(
        color: Colors.lightGreen,
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: 60),
              child: Image.asset("assets/img/unu.png"),
            ),
            // ignore: prefer_const_constructors
            Text("Asistencia Unu 2.0",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
                margin: EdgeInsets.all(5),
                child: Text(usuario.nombUsu+" "+usuario.apepaUsu+" "+usuario.apemaUsu,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            Container(
                margin: EdgeInsets.all(5),
                child: Text(usuario.tipoUsu,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            Expanded(
                child: Divider(
              color: Colors.black,
              thickness: 2,
            )),
            menu,

            Expanded(child: Container()),
            elementoMenu("Cerrar Sesion", "", "cerrar", this.usuario)
          ],
        ),
      ),
    );
  }

  Widget menuDocente() {
    return Column(children: [
      elementoMenu("INICIO", "", "principal", this.usuario),
      elementoMenu("ASISTENCIAS", "", "asistencias", this.usuario),
      elementoMenu("HORARIOS", "", "horarios", this.usuario),
    ]);
  }

  Widget menuAdmin() {
    return Column(children: [
      elementoMenu("INICIO", "", "principal", this.usuario),
      elementoMenu("DOCENTES", "", "docentes", this.usuario),
      elementoMenu("ASISTENCIAS", "", "asistencias", this.usuario),
      elementoMenu("HORARIOS", "", "horarios", this.usuario),
    ]);
  }

  Widget elementoMenu(titulo, icono, enlace, Musuario usuario) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      padding: EdgeInsets.all(5),
      width: double.infinity,
      color: Colors.white,
      alignment: Alignment.center,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.blue,
        ),
        onPressed: () {
          salto(enlace, usuario);
        },
        child: Text(titulo),
      ),
    );
  }

  Widget Inicio(usuario) {
    var msj = "Hola " +
        usuario +
        ",\nBienvenido(a) a nuestra aplicación, el cual le permitirá ver toda la información de asistencias, incidencias, notas y matriculas de los alumnos asignados a usted como tutor o familiar.";
    return Text(msj,
        textAlign: TextAlign.center, style: TextStyle(fontSize: 25));
  }

  void salto(vista, Musuario usuario) {
    switch (vista) {
      case "principal":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => principal(usuario: usuario)));
        break;
      case "docentes":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => alumnos(usuario: usuario)));
        break;
      case "asistencias":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => matriculas(usuario: usuario)));
        break;
      case "horarios":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => matriculas(usuario: usuario)));
        break;
      case "cerrar":
        sesion ses = sesion();
        ses.cerrarSesion();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(title: "Asistencia Unu 2.0")));
        break;

      default:
    }
  }
}