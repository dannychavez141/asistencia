// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:async';
import 'package:app/modelos/Manio.dart';
import 'package:app/modelos/Masistencia.dart';
import 'package:http/http.dart' as http;
import 'package:app/clases/Conexion.dart';
import 'package:app/modelos/Mdocente.dart';
import 'package:app/modelos/Musuario.dart';

class cDocente {
  Conexion conexion = new Conexion();

  Future<List<Mdocente>> getMatriculados(String dni, String anio) async {
    String api = conexion.url + "app2/apis/apiDocente.php?ac=todos&busq=" + dni;
    print(api);
    var uri = Uri.parse(api);
    final resp = await http.get(uri);
    List<Mdocente> datos = [];
    if (resp.statusCode == 200) {
      //  print(resp.body);
      String body = resp.body;
      final datosjson = jsonDecode(body);
      //print(datosjson[0]);

      for (var item in datosjson) {
        datos.add(Mdocente(
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

  //funciones del docente
  Future<String> rDocente(Mdocente mod) async {
    String api = conexion.url + "app2/apis/apiDocente.php";
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
  Future<String> mdDocente(Mdocente mod) async {
    String api = conexion.url + "app2/apis/apiDocente.php";
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

  Future<List<Mdocente>> getDocentes(String busq) async {
    String api =
        conexion.url + "app2/apis/apiDocente.php?ac=todos&busq=" + busq;
    //print(api);
    var uri = Uri.parse(api);
    final resp = await http.get(uri);
    List<Mdocente> datos = [];
    if (resp.statusCode == 200) {
      // print(resp.body);
      String body = resp.body;
      final datosjson = jsonDecode(body);
      //print(datosjson[0]);
      for (var item in datosjson) {
        datos.add(Mdocente(
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

  Future<List<Manio>> getAnios() async {
    String api = conexion.url + "ajax/cAnioEscolar.php?control=all";
    var uri = Uri.parse(api);
    final resp = await http.get(uri);
    List<Manio> datos = [];
    if (resp.statusCode == 200) {
      print(resp.body);
      String body = resp.body;
      final datosjson = jsonDecode(body);
      //print(datosjson[0]);

      for (var item in datosjson) {
        datos.add(Manio(item["idAnioEscolar"], item["descr"]));
      }

      return datos;
    } else {
      throw Exception("Error de api");
    }
  }

  Future<List<Masistencia>> getAsistencias(String id, String mes) async {
    String api = conexion.url +
        "ajax/cAlumnos.php?control=asistencia&idmat=" +
        id +
        "&mes=" +
        mes;
    print(api);
    var uri = Uri.parse(api);
    final resp = await http.get(uri);
    List<Masistencia> datos = [];
    if (resp.statusCode == 200) {
      //  print(resp.body);
      String body = resp.body;
      final datosjson = jsonDecode(body);
      //print(datosjson[0]);

      for (var item in datosjson) {
        datos.add(Masistencia(
            item["dnialu"],
            item["nomb"] + " " + item["apepa"] + " " + item["apema"],
            item["3"],
            item["32"],
            item["36"],
            item["39"],
            item["39"],
            item["4"],
            item["tipo"]));
      }
      return datos;
    } else {
      throw Exception("Error de api");
    }
  }

  Future<List<Musuario>> getUsuario(
      String usu, String pass, String tipo) async {
    String api = conexion.url +
        "app2/apis/apiDocente.php?ac=login&loginUsu=" +
        usu +
        "&passUsu=" +
        pass +
        "&tipoUsu=" +
        tipo;
    // print(api);
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
