class Dokter {
  String? kdDokter;
  String? namaDokter;
  String? spesialis;

  Dokter({this.kdDokter, this.namaDokter, this.spesialis});

  Dokter.fromJson(Map<String, dynamic> json) {
    kdDokter = json['kd_dokter'];
    namaDokter = json['nama_dokter'];
    spesialis = json['spesialis'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['kd_dokter'] = kdDokter;
    data['nama_dokter'] = namaDokter;
    data['spesialis'] = spesialis;
    return data;
  }

  static List<Dokter> fromJsonList(List? data) {
    if (data == null || data.isEmpty) return [];
    return data.map((e) => Dokter.fromJson(e)).toList();
  }
}
