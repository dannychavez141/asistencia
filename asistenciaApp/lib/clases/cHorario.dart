import 'dart:convert';
import 'dart:async';
import 'package:app/modelos/Manio.dart';
import 'package:app/modelos/mAsistencia.dart';
import 'package:app/modelos/mDia.dart';
import 'package:app/modelos/mHorario.dart';
import 'package:http/http.dart' as http;
import 'package:app/clases/Conexion.dart';
import 'package:app/modelos/mDocente.dart';
import 'package:app/modelos/Musuario.dart';

class cHorario {
  Conexion conexion = new Conexion();

  Future<List<mHorario>> getHorario(String idDoc) async {
    String api = conexion.url + "app2/apis/apiHorario.php?ac=ver&idDoc="+
        idDoc;
    print(api);
    var uri = Uri.parse(api);
    final resp = await http.get(uri);
    List<mHorario> datos = [];
    if (resp.statusCode == 200) {
      //  print(resp.body);
      String body = resp.body;
      final datosjson = jsonDecode(body);
      //print(datosjson[0]);
      for (var item in datosjson) {
        print(item);
        final docente = mDocente(
            item["idDoc"],
            item["dniDoc"],
            "",
            item["nomDoc"],
            item["apepaDoc"],
            item["apemaDoc"],
            "",
            "",
            "",
            "",
            "",
            "");
final dia=mDia(item["idDia"], item["descrDia"], item["idEst"]);
        datos.add(mHorario(
            item["idHor"],
            docente,
            dia,
            item["hEntrada"],
            item["hSalida"]));
      }
      return datos;
    } else {
      throw Exception("Error de api");
    }
  }
  Future<String> rHorario(mHorario mod) async {
    String api = conexion.url + "app2/apis/apiHorario.php";
    Uri uri = Uri.parse(api);
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'ac': 'reg',
      'idDoc': mod.docente.idDoc,
      'idDia': mod.dia.idDia,
      'hEntrada': mod.hEntrada,
      'hSalida': mod.hSalida,

    };
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');
    final response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );
    //int statusCode = response.statusCode;
    String responseBody = response.body;
    print(responseBody);
    return responseBody;
  }
  //funcion eliminar horario
  Future<String> eliHorario(mHorario mod) async {
    String api = conexion.url + "app2/apis/apiHorario.php";
    Uri uri = Uri.parse(api);
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'ac': 'eli',
      'idHor': mod.idHor,
    };
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');
    final response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );
    //int statusCode = response.statusCode;
    String responseBody = response.body;
    print(responseBody);
    return responseBody;
  }
}
