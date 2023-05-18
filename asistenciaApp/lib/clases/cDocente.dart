// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:async';
import 'package:app/modelos/Manio.dart';
import 'package:app/modelos/mAsistencia.dart';
import 'package:http/http.dart' as http;
import 'package:app/clases/Conexion.dart';
import 'package:app/modelos/mDocente.dart';
import 'package:app/modelos/Musuario.dart';

class cDocente {
  Conexion conexion = new Conexion();


  //funciones del docente
  Future<String> rDocente(mDocente mod) async {
    String api = conexion.url + "apis/apiDocente.php";
    Uri uri = Uri.parse(api);
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'ac': 'reg',
      'idDoc': mod.idDoc,
      'dniDoc': mod.dniDoc,
      'claveDoc': mod.claveDoc,
      'nomDoc': mod.nomDoc,
      'apepaDoc': mod.apepaDoc,
      'apemaDoc': mod.apemaDoc,
      'foto': mod.foto,
      'est': mod.est
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
    // print(responseBody);
    return responseBody;
  }

  Future<String> mdDocente(mDocente mod) async {
    String api = conexion.url + "apis/apiDocente.php";
    Uri uri = Uri.parse(api);
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'ac': 'mod',
      'idDoc': mod.idDoc,
      'dniDoc': mod.dniDoc,
      'claveDoc': mod.claveDoc,
      'nomDoc': mod.nomDoc,
      'apepaDoc': mod.apepaDoc,
      'apemaDoc': mod.apemaDoc,
      'foto': mod.foto,
      'est': mod.est
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

  Future<List<mDocente>> getDocentes(String busq) async {
    String api =
        conexion.url + "apis/apiDocente.php?ac=todos&busq=" + busq;
    //print(api);
    var uri = Uri.parse(api);
    final resp = await http.get(uri);
    List<mDocente> datos = [];
    if (resp.statusCode == 200) {
      // print(resp.body);
      String body = resp.body;
      final datosjson = jsonDecode(body);
      //print(datosjson[0]);
      for (var item in datosjson) {
        datos.add(mDocente(
            item["idDoc"],
            item["dniDoc"],
            item["claveDoc"],
            item["nomDoc"],
            item["apepaDoc"],
            item["apemaDoc"],
            item["foto"],
            item["est"],
            "",
            "",
            item["idgAcademico"],
            item["idgAcademico"]));
      }
      return datos;
    } else {
      throw Exception("Error de api");
    }
  }


  Future<List<Musuario>> getUsuario(
      String usu, String pass, String tipo) async {
    String api = conexion.url +"apis/apiDocente.php?ac=login&loginUsu=" +
        usu +
        "&passUsu=" +
        pass +
        "&tipoUsu=" +
        tipo;
     print(api);
    var uri = Uri.parse(api);
    final resp = await http.get(uri);
    List<Musuario> datos = [];
    if (resp.statusCode == 200) {
      // print(resp.body);
      String body = resp.body;
      final datosjson = jsonDecode(body);
      print(datosjson[0]);

      for (var item in datosjson) {
        if (tipo == "DOCENTE") {
          datos.add(Musuario(item["idDoc"], item["dniDoc"], item["nomDoc"],
              item["apepaDoc"], item["apemaDoc"], tipo));
        } else {
          datos.add(Musuario(item["idUsu"], item["dniUsu"], item["nombUsu"],
              item["apepaUsu"], item["apemaUsu"], tipo));
        }
      }
      print(datos.toString());
      return datos;
    } else {
      throw Exception("Error de api");
    }
  }
}
