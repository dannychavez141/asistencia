import 'package:flutter/material.dart';
import '../clases/cDocente.dart';
import 'package:webview_flutter/webview_flutter.dart';
cDocente metodos = cDocente();
class pdfNotas extends StatelessWidget {
  final String cod;
  const pdfNotas({super.key,required this.cod});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("BOLETA DE NOTAS"),
        ),
        body: Container(child: ventana(context),));
  }
  Widget ventana(context){
    String yourURL =
        metodos.conexion.url + "appmovil/pdfnotas.php?cod=" + cod;
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