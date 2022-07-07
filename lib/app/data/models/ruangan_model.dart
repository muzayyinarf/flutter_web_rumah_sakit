class Ruangan {
  String? kdRuangan;
  String? jenisRuangan;
  int? hargaPermalam;

  Ruangan({this.kdRuangan, this.jenisRuangan, this.hargaPermalam});

  Ruangan.fromJson(Map<String, dynamic> json) {
    kdRuangan = json['kd_ruangan'];
    jenisRuangan = json['jenis_ruangan'];
    hargaPermalam = json['harga_permalam'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['kd_ruangan'] = kdRuangan;
    data['jenis_ruangan'] = jenisRuangan;
    data['harga_permalam'] = hargaPermalam;
    return data;
  }

  static List<Ruangan> fromJsonList(List? data) {
    if (data == null || data.isEmpty) return [];
    return data.map((e) => Ruangan.fromJson(e)).toList();
  }
}
