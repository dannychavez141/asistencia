class Mdocente {
  String idDoc;
  String dniDoc;
  String claveDoc;
  String nomDoc;
  String apepaDoc;
  String apemaDoc;
  String foto;
  String est;
  String imghuella1;
  String imghuella2;
  String idgAcademico;


  Mdocente(this.idDoc,
      this.dniDoc,
      this.claveDoc,
      this.nomDoc,
      this.apepaDoc,
      this.apemaDoc,
      this.foto,
      this.est,
      this.imghuella1,
      this.imghuella2,
      this.idgAcademico);

  @override
  String toString() {
    return 'Mdocente{dniDoc: $dniDoc, claveDoc: $claveDoc, nomDoc: $nomDoc, apepaDoc: $apepaDoc, apemaDoc: $apemaDoc, foto: $foto, est: $est, imghuella1: $imghuella1, imghuella2: $imghuella2, idgAcademico: $idgAcademico}';
  }
}
