class Musuario{
  String id;
  String dniUsu;
  String nombUsu;
  String apepaUsu;
  String apemaUsu;
  String tipoUsu;


  Musuario(this.id, this.dniUsu, this.nombUsu, this.apepaUsu, this.apemaUsu,
      this.tipoUsu);

  @override
  String toString() {
    return 'Musuario{id: $id, dniUsu: $dniUsu, nombUsu: $nombUsu, apepaUsu: $apepaUsu, apemaUsu: $apemaUsu, tipoUsu: $tipoUsu}';
  }
}