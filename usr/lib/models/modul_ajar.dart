class ModulAjar {
  String id;
  String judul;
  String mataPelajaran;
  String fase;
  String kelas;
  String alokasiWaktu;
  
  String kompetensiAwal;
  String profilPelajarPancasila;
  String saranaPrasarana;
  String targetPesertaDidik;
  String modelPembelajaran;
  
  String tujuanPembelajaran;
  String pemahamanBermakna;
  String pertanyaanPemantik;
  String kegiatanPembelajaran;
  String asesmen;
  String pengayaanRemedial;
  
  String lkpd;
  String bahanBacaan;
  String glosarium;
  String daftarPustaka;

  ModulAjar({
    required this.id,
    required this.judul,
    required this.mataPelajaran,
    required this.fase,
    required this.kelas,
    required this.alokasiWaktu,
    this.kompetensiAwal = '',
    this.profilPelajarPancasila = '',
    this.saranaPrasarana = '',
    this.targetPesertaDidik = '',
    this.modelPembelajaran = '',
    this.tujuanPembelajaran = '',
    this.pemahamanBermakna = '',
    this.pertanyaanPemantik = '',
    this.kegiatanPembelajaran = '',
    this.asesmen = '',
    this.pengayaanRemedial = '',
    this.lkpd = '',
    this.bahanBacaan = '',
    this.glosarium = '',
    this.daftarPustaka = '',
  });
}

final List<ModulAjar> dummyModulAjar = [];
