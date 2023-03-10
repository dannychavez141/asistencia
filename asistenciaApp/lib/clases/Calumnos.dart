// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:async';
import 'package:app/modelos/Manio.dart';
import 'package:app/modelos/Masistencia.dart';
import 'package:http/http.dart' as http;
import 'package:app/clases/Conexion.dart';
import 'package:app/modelos/Malumno.dart';
import 'package:app/modelos/Musuario.dart';

class Calumnos {
  Conexion conexion = new Conexion();

  Future<List<Malumno>> getMatriculados(String dni, String anio) async {
    String api = conexion.url +
        "ajax/cMatricula.php?control=mApoAnio&dni=" +
        dni +
        "&anio=" +
        anio;
    print(api);
    var uri = Uri.parse(api);
    final resp = await http.get(uri);
    List<Malumno> datos = [];
    if (resp.statusCode == 200) {
      //  print(resp.body);
      String body = resp.body;
      final datosjson = jsonDecode(body);
      //print(datosjson[0]);

      for (var item in datosjson) {
        datos.add(Malumno(
            item["1"],
            item["alu"],
            item["8"] + " - " + item["10"],
            item["12"] + " " + item["14"],
            item["ext"],
            item["0"]));
      }
      return datos;
    } else {
      throw Exception("Error de api");
    }
  }

  Future<List<Malumno>> getAlumnos(String dni) async {
    String api = conexion.url + "appmovil/valumno.php?cod=" + dni + "&busq";
    print(api);
    var uri = Uri.parse(api);
    final resp = await http.get(uri);
    List<Malumno> datos = [];
    if (resp.statusCode == 200) {
      print(resp.body);
      String body = resp.body;
      final datosjson = jsonDecode(body);
      //print(datosjson[0]);
      for (var item in datosjson) {
        datos.add(Malumno(item["dni"], item["alum"], item["fnac"],
            item["descrSex"], item["ext"], item["0"]));
      }
      return datos;
    } else {
      throw  Exception("Error de api");}
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

  Future<List<Musuario>> getUsuario(String usu, String pass) async {
    String api = conexion.url +
        "ajax/apiApoderado.php?control=login&usu=" +
        usu +
        "&pass=" +
        pass;
    var uri = Uri.parse(api);
    final resp = await http.get(uri);
    List<Musuario> datos = [];
    if (resp.statusCode == 200) {
      print(resp.body);
      String body = resp.body;
      final datosjson = jsonDecode(body);
      //print(datosjson[0]);

      for (var item in datosjson) {
        datos.add(Musuario(
            item["idApoderado"], item["dni"], item["datos"], item["descr"]));
      }

      return datos;
    } else {
      throw Exception("Error de api");
    }
  }
}
