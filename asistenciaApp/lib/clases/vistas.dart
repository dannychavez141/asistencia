import 'package:app/vActividad.dart';
import 'package:app/vAsistencias.dart';
import 'package:app/clases/sesion.dart';
import 'package:app/main.dart';
import 'package:app/principal.dart';
import 'package:app/vLugares.dart';
import 'package:app/viewDocente/asistDocente.dart';
import 'package:app/viewDocente/vActividadDoc.dart';
import 'package:app/viewDocente/vHorario.dart';
import 'package:flutter/material.dart';
import '../vDocentes.dart';
import '../modelos/Musuario.dart';

class Vistas {
  String titulopage;
  BuildContext context;
  Musuario usuario;

  Vistas(this.titulopage, this.context, this.usuario);

  Widget menu(String tUsusario) {
    Widget menu = Column();
    if (tUsusario == "ADMINISTRADOR") {
      menu = menuAdmin();
    } else if (tUsusario == "DOCENTE") {
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
                child: Text(
                    usuario.nombUsu +
                        " " +
                        usuario.apepaUsu +
                        " " +
                        usuario.apemaUsu,
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
      elementoMenu("ASISTENCIAS", "", "asisDoc", this.usuario),
      elementoMenu("HORARIOS", "", "horarios", this.usuario),
      elementoMenu("ACTIVIDADES", "", "actiDoc", this.usuario)
    ]);
  }

  Widget menuAdmin() {
    return Column(children: [
      elementoMenu("INICIO", "", "principal", this.usuario),
      elementoMenu("DOCENTES", "", "docentes", this.usuario),
      elementoMenu("ASISTENCIAS", "", "asistencias", this.usuario),
      elementoMenu("LUGARES", "", "lugares", this.usuario),
      elementoMenu("ACTIVIDADES", "", "actividades", this.usuario)
    ]);
  }

  Widget elementoMenu(titulo, icono, enlace, Musuario usuario) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      padding: EdgeInsets.all(2),
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
        ",\nBienvenido(a) a nuestra aplicación, el cual le permitirá ver toda la información de asistencias y horarios.";
    return Text(msj,
        textAlign: TextAlign.center, style: TextStyle(fontSize: 25));
  }

  Widget btn(int r, int g, int b, String txt, {required Function pAccion}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              //margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(r, g, b, 1.0),
                    Color.fromRGBO(r, g, b, 1.0)
                  ],
                ),
              ),
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle:  TextStyle(fontSize: 10),alignment: Alignment.center,
              ),
              onPressed: () {
                pAccion();
              },
              child: Text(txt,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
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
            MaterialPageRoute(builder: (context) => vDocentes(usuario: usuario)));
        break;
      case "asistencias":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => vAsistencias(usuario: usuario)));
        break;
      case "asisDoc":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => asistDocente(usuario: usuario)));
        break;
      case "horarios":
       Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => vHorario(usuario: usuario)));
        break;
      case "actividades":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => vActividad(usuario: usuario)));
        break;
      case "lugares":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => vLugares(usuario: usuario)));
        break;
      case "actiDoc":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => vActividadDoc(usuario: usuario)));
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
