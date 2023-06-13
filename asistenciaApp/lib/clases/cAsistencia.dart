import 'dart:convert';
import 'dart:async';
import 'package:app/modelos/Manio.dart';
import 'package:app/modelos/mAsistencia.dart';
import 'package:http/http.dart' as http;
import 'package:app/clases/Conexion.dart';
import 'package:app/modelos/mDocente.dart';
import 'package:app/modelos/Musuario.dart';

class cAsistencia {
  Conexion conexion = new Conexion();
  Future<List<mAsistencia>> getAsistencias(String fecha) async {
    String api = conexion.url + "apis/apiAsistencia.php?ac=verDia&fechaAsist="+
    fecha;
    //print(api);
    var uri = Uri.parse(api);
    final resp = await http.get(uri);
    List<mAsistencia> datos = [];
    if (resp.statusCode == 200) {
      //  print(resp.body);
      String body = resp.body;
      final datosjson = jsonDecode(body);
     // print(datosjson[0]);
      for (var item in datosjson) {
        //print(item);
        final docente = mDocente(
            item["idDoc"],
            item["dniDoc"],
            "",
            item["nomDoc"],
            item["apepaDoc"],
            item["apemaDoc"],
            item["foto"],
            item["est"],
            "",
            "",
            "",
            "");

        datos.add(mAsistencia(
            item["idAsist"],
            docente,
            item["fechaAsist"],
            item["inAsist"] == null ? "" : item["inAsist"],
            item["outAsist"] == null ? "" : item["outAsist"]));
      }
      return datos;
    } else {
      throw Exception("Error de api");
    }
  }
  Future<List<mAsistencia>> getAsistenciasDocente(int mes,String idDoc) async {
    String api = conexion.url + "apis/apiAsistencia.php?ac=verAsisDoc&mes="+
        mes.toString()+"&idDoc="+idDoc;
    //print(api);
    var uri = Uri.parse(api);
    final resp = await http.get(uri);
    List<mAsistencia> datos = [];
    if (resp.statusCode == 200) {
      //  print(resp.body);
      String body = resp.body;
      final datosjson = jsonDecode(body);
     // print(datosjson[0]);
      for (var item in datosjson) {
      //  print(item);
        final docente = mDocente(
            item["idDoc"],
            item["dniDoc"],
            "",
            item["nomDoc"],
            item["apepaDoc"],
            item["apemaDoc"],
            "",
            item["est"],
            "",
            "",
            "",
            "");

        datos.add(mAsistencia(
            item["idAsist"],
            docente,
            item["fechaAsist"],
            item["inAsist"] == null ? "" : item["inAsist"],
            item["outAsist"] == null ? "" : item["outAsist"]));
      }
      return datos;
    } else {
      throw Exception("Error de api");
    }
  }

}
