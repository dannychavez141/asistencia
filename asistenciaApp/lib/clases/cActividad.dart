import 'dart:convert';
import 'dart:async';
import 'package:app/modelos/Manio.dart';
import 'package:app/modelos/mActividad.dart';
import 'package:app/modelos/mAsistencia.dart';
import 'package:app/modelos/mDia.dart';
import 'package:app/modelos/mHorario.dart';
import 'package:app/modelos/mLugar.dart';
import 'package:app/modelos/mTipoAct.dart';
import 'package:http/http.dart' as http;
import 'package:app/clases/Conexion.dart';
import 'package:app/modelos/mDocente.dart';
import 'package:app/modelos/Musuario.dart';

class cActividad {
  Conexion conexion = new Conexion();

  Future<List<mActividad>> getDatos(String idDoc) async {
    String api = conexion.url + "apis/apiActividad.php?ac=ver&idDoc=" + idDoc;
    print(api);
    var uri = Uri.parse(api);
    final resp = await http.get(uri);
    List<mActividad> datos = [];
    if (resp.statusCode == 200) {
      //  print(resp.body);
      String body = resp.body;
      final datosjson = jsonDecode(body);
      //print(datosjson[0]);
      for (var item in datosjson) {
        //print(item);
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
        final tipoAct = mTipoAct(item["idTipAct"], item["descrTipAct"], item["estTipAct"]);
        final lugar = mLugar(item["idLug"], item["descrLug"], item["dirLug"], item["telfLug"], item["altLug"], item["latLug"], item["estLug"]);
        datos.add(mActividad(
            item["idAct"], docente, lugar,tipoAct,item["descrAct"],item["fechaAct"], item["hIniAct"], item["hFinAct"]
            ,item["hIniDoc"], item["logIniAct"], item["latIniAct"]
            ,item["hFinDoc"], item["logFinDoc"], item["latFinDoc"]));
      }
      return datos;
    } else {
      throw Exception("Error de api");
    }
  }
  Future<List<mActividad>> getDatosRep(String fecha) async {
    String api = conexion.url + "apis/apiActividad.php?ac=verRep&fechaAct=" + fecha;
    print(api);
    var uri = Uri.parse(api);
    final resp = await http.get(uri);
    List<mActividad> datos = [];
    if (resp.statusCode == 200) {
      //  print(resp.body);
      String body = resp.body;
      final datosjson = jsonDecode(body);
      //print(datosjson[0]);
      for (var item in datosjson) {
        //print(item);
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
        final tipoAct = mTipoAct(item["idTipAct"], item["descrTipAct"], item["estTipAct"]);
        final lugar = mLugar(item["idLug"], item["descrLug"], item["dirLug"], item["telfLug"], item["altLug"], item["latLug"], item["estLug"]);
        datos.add(mActividad(
            item["idAct"], docente, lugar,tipoAct,item["descrAct"],item["fechaAct"], item["hIniAct"], item["hFinAct"]
            ,item["hIniDoc"], item["logIniAct"], item["latIniAct"]
            ,item["hFinDoc"], item["logFinDoc"], item["latFinDoc"]));
      }
      return datos;
    } else {
      throw Exception("Error de api");
    }
  }
  Future<String> registrar(mActividad mod) async {
    String api = conexion.url + "apis/apiActividad.php";
    Uri uri = Uri.parse(api);
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'ac': 'reg',
      'idDoc': mod.docente.idDoc,
      'idTipAct': mod.tipo.idTipAct,
      'idLug': mod.lugar.idLug,
      'hIniAct': mod.hIniAct,
      'hFinAct': mod.hFinAct,
      'descrAct': mod.descrAct,
      'fechaAct':mod.fechaAct
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
  Future<String> modificar(mHorario mod) async {
    String api = conexion.url + "apis/apiActividad.php";
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
  //funcion marcar actividad
  Future<String> marcar(mActividad mod,int idTipAsis,String horaAct,String lonAsisActi,String latAsisActi) async {
    String api = conexion.url + "apis/apiActividad.php";
    Uri uri = Uri.parse(api);
    final headers = {'Content-Type': 'application/json'};
    String txthora="hIniDoc";
    String txtlon="logIniAct";
    String txtlat="latIniAct";
    if(idTipAsis==2){
       txthora="hFinDoc";
       txtlon="logFinDoc";
       txtlat="latFinDoc";
    }
    Map<String, dynamic> body = {
      'ac': 'marcar',
      'idAct': mod.idAct,
      'txthora': txthora,
      'txtlon': txtlon,
      'txtlat': txtlat,
      'hora': horaAct,
      'lon': lonAsisActi,
      'lat': latAsisActi
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
  Future<List<mTipoAct>> getTipos() async {
    String api = conexion.url + "apis/apiActividad.php?ac=verTipo";
    print(api);
    var uri = Uri.parse(api);
    final resp = await http.get(uri);
    List<mTipoAct> datos = [];
    if (resp.statusCode == 200) {
      //  print(resp.body);
      String body = resp.body;
      final datosjson = jsonDecode(body);
      //print(datosjson[0]);

      for (var item in datosjson) {
       // print(item);
        final tipoAct = mTipoAct(item["idTipAct"], item["descrTipAct"], item["estTipAct"]);
        datos.add(tipoAct);
      }
      return datos;
    } else {
      throw Exception("Error de api");
    }
  }
}
