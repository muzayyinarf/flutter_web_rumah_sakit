class Pembayaran {
  String? kdBayar;
  String? kdRuangan;
  String? kdPasien;
  int? lamaMenginap;
  int? jumlahBayar;

  Pembayaran(
      {this.kdBayar,
      this.kdRuangan,
      this.kdPasien,
      this.lamaMenginap,
      this.jumlahBayar});

  Pembayaran.fromJson(Map<String, dynamic> json) {
    kdBayar = json['kd_bayar'];
    kdRuangan = json['kd_ruangan'];
    kdPasien = json['kd_pasien'];
    lamaMenginap = json['lama_menginap'];
    jumlahBayar = json['jumlah_bayar'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['kd_bayar'] = kdBayar;
    data['kd_ruangan'] = kdRuangan;
    data['kd_pasien'] = kdPasien;
    data['lama_menginap'] = lamaMenginap;
    data['jumlah_bayar'] = jumlahBayar;
    return data;
  }

  static List<Pembayaran> fromJsonList(List? data) {
    if (data == null || data.isEmpty) return [];
    return data.map((e) => Pembayaran.fromJson(e)).toList();
  }
}
