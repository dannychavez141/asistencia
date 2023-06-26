class mLugar {
  String idLug;
  String descrLug;
  String dirLug;
  String telfLug;
  String altLug;
  String latLug;
  String estLug;

  mLugar(this.idLug, this.descrLug, this.dirLug, this.telfLug, this.altLug,
      this.latLug, this.estLug);

  @override
  String toString() {
    return 'mLugar{idLug: $idLug, descrLug: $descrLug, dirLug: $dirLug, telfLug: $telfLug, altLug: $altLug, latLug: $latLug, estLug: $estLug}';
  }
}
