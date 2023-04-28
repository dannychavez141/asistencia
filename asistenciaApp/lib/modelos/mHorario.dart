import 'package:app/modelos/mDia.dart';
import 'package:app/modelos/mDocente.dart';

class mHorario {
  String idHor;
  mDocente docente;
  mDia dia;
  String hEntrada;
  String hSalida;
  mHorario(this.idHor, this.docente, this.dia, this.hEntrada, this.hSalida);

  @override
  String toString() {
    return 'mHorario{idHor: $idHor, docente: $docente, dia: $dia, hEntrada: $hEntrada, hSalida: $hSalida}';
  }
}
