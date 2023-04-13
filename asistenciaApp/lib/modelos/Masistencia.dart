import 'package:app/modelos/mDocente.dart';

class mAsistencia {
  String idAsist;
  mDocente docente;
  String fecha;
  String entrada;
  String salida;

  mAsistencia(this.idAsist, this.docente, this.fecha, this.entrada, this.salida);
}
