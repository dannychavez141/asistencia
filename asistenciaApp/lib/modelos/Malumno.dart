class Malumno {
  String dni;
  String nomb;
  String fnac;
  String sex;
  String ext;
  String id;

  Malumno(this.dni, this.nomb, this.fnac, this.sex, this.ext,this.id);

  @override
  String toString() {
    return 'Malumno{id: $dni, nomb: $nomb, ape: $fnac, dni: $dni, ext: $ext}';
  }
}
