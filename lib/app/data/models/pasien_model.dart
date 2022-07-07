class Pasien {
  String? kdPasien;
  String? kdDokter;
  String? namaPasien;

  Pasien({this.kdPasien, this.kdDokter, this.namaPasien});

  Pasien.fromJson(Map<String, dynamic> json) {
    kdPasien = json['kd_pasien'];
    kdDokter = json['kd_dokter'];
    namaPasien = json['nama_pasien'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['kd_pasien'] = kdPasien;
    data['kd_dokter'] = kdDokter;
    data['nama_pasien'] = namaPasien;
    return data;
  }

  static List<Pasien> fromJsonList(List? data) {
    if (data == null || data.isEmpty) return [];
    return data.map((e) => Pasien.fromJson(e)).toList();
  }
}
