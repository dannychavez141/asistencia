// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:async';
import 'package:app/modelos/Manio.dart';
import 'package:app/modelos/mAsistencia.dart';
import 'package:app/modelos/mLugar.dart';
import 'package:http/http.dart' as http;
import 'package:app/clases/Conexion.dart';
import 'package:app/modelos/mDocente.dart';
import 'package:app/modelos/Musuario.dart';

class cLugar {
  Conexion conexion = new Conexion();

  //funciones del docente
  Future<String> rLugar(mLugar mod) async {
    String api = conexion.url + "apis/apiLugar.php";
    Uri uri = Uri.parse(api);
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'ac': 'reg',
      'descrLug': mod.descrLug,
      'dirLug': mod.dirLug,
      'telfLug': mod.telfLug,
      'altLug': mod.altLug,
      'latLug': mod.latLug
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

  Future<String> mdLugar(mLugar mod) async {
    String api = conexion.url + "apis/apiLugar.php";
    print(api);
    Uri uri = Uri.parse(api);
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'ac': 'mod',
      'idLug': mod.idLug,
      'descrLug': mod.descrLug,
      'dirLug': mod.dirLug,
      'telfLug': mod.telfLug,
      'altLug': mod.altLug,
      'latLug': mod.latLug,
      'estLug': mod.estLug
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

  Future<List<mLugar>> getLugares(String busq) async {
    String api = conexion.url + "apis/apiLugar.php?ac=ver&descrLug=" + busq;
    print(api);
    var uri = Uri.parse(api);
    final resp = await http.get(uri);
    List<mLugar> datos = [];
    if (resp.statusCode == 200) {
      // print(resp.body);
      String body = resp.body;
      final datosjson = jsonDecode(body);
      //print(datosjson[0]);
      for (var item in datosjson) {
        datos.add(mLugar(item["idLug"], item["descrLug"], item["dirLug"], item["telfLug"], item["altLug"], item["latLug"], item["estLug"]));
      }
      return datos;
    } else {
      throw Exception("Error de api");
    }
  }


}
