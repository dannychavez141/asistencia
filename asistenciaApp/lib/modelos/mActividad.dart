import 'package:app/modelos/mDia.dart';
import 'package:app/modelos/mDocente.dart';
import 'package:app/modelos/mLugar.dart';
import 'package:app/modelos/mTipoAct.dart';

class mActividad {
  String idAct;
  mDocente docente;
  mLugar lugar;
  mTipoAct tipo;
  String descrAct;
  String fechaAct;
  String hIniAct;
  String hFinAct;
  String hIniDoc;
  String logIniAct;
  String latIniAct;
  String hFinDoc;
  String logFinDoc;
  String latFinDoc;

  mActividad(
      this.idAct,
      this.docente,
      this.lugar,
      this.tipo,
      this.descrAct,
      this.fechaAct,
      this.hIniAct,
      this.hFinAct,
      this.hIniDoc,
      this.logIniAct,
      this.latIniAct,
      this.hFinDoc,
      this.logFinDoc,
      this.latFinDoc);
}
