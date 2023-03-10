class Musuario{
  String id;
  String dni;
  String datos;
  String tipo;

  Musuario(this.id, this.dni, this.datos, this.tipo);

  @override
  String toString() {
    return 'Musuario{id: $id, dni: $dni, datos: $datos, tipo: $tipo}';
  }
}