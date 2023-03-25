import 'package:app/clases/cDocente.dart';
import 'package:app/modelos/Mdocente.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
cDocente metodos = cDocente();
class qr extends StatefulWidget {
  final Mdocente alu;
  const qr({Key? key,required this.alu}) : super(key: key);

  @override
  State<qr> createState() => _qrState();
}
class _qrState extends State<qr> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("QR DE IDENTIFICACION PREMIUM"),
        ),
        body: Container(  child: ventana(context),));
  }
  Widget ventana(context){
    String url = metodos.conexion.url + "identificacion/?cod=A-" + widget.alu.idDoc;

    return  Container(

        width: MediaQuery.of(context).size.width,
        child: Stack(children: <Widget>[ Center(child:Column(mainAxisAlignment: MainAxisAlignment.center,children: [QrImage(
          data: url,
          version: QrVersions.auto,
          size: 320,
          gapless: false,
        ),Text(widget.alu.nomDoc),Text(widget.alu.apepaDoc),Text(widget.alu.apemaDoc)
          ],)
            )
        ]));
  }

}
