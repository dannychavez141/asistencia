import 'package:flutter/material.dart';
import '../clases/Calumnos.dart';
import 'package:webview_flutter/webview_flutter.dart';
Calumnos metodos = Calumnos();
class pdfMatri extends StatelessWidget {
  final String cod;
  const pdfMatri({super.key,required this.cod});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text("BOLETA DE MATRICULA"),
    ),
    body: Container(child: ventana(context),));
  }
  Widget ventana(context){
    String yourURL =
        metodos.conexion.url + "appmovil/pdfmatriculaApp.php?cod=" + cod;
    yourURL = "https://docs.google.com/gview?embedded=true&url=" + yourURL;

          return  Container(
                width: MediaQuery.of(context).size.width,
                child: Stack(children: <Widget>[
                  WebView(
                    initialUrl: yourURL,
                    javascriptMode: JavascriptMode.unrestricted,
                  )
                ]));
  }
}