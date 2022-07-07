import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../pasien/controllers/pasien_controller.dart';
import '../../pembayaran/controllers/pembayaran_controller.dart';
import '../../ruangan/controllers/ruangan_controller.dart';

class EditPembayaranController extends GetxController {
  PembayaranController pembayaranC = Get.find();
  PasienController pasienC = Get.put(PasienController());
  RuanganController ruanganC = Get.put(RuanganController());

  RxBool isLoading = false.obs;
  SupabaseClient client = Supabase.instance.client;

  TextEditingController kodeBayarC = TextEditingController();
  TextEditingController kodeRuanganC = TextEditingController();
  TextEditingController kodePasienC = TextEditingController();
  TextEditingController lamaMenginapC = TextEditingController();
  TextEditingController jumlahBayarC = TextEditingController();

  @override
  void onInit() {
    pasienC.getAllPasien();
    pasienC.allPasien;
    ruanganC.getAllRuangan();
    ruanganC.allRuangan;
    super.onInit();
  }

  RxString hintPasien = "Pilih Pasien".obs;
  RxString hintRuangan = "Pilih Ruangan".obs;

  Future<void> addPasien() async {
    if (kodeBayarC.text.isNotEmpty &&
        kodeRuanganC.text.isNotEmpty &&
        lamaMenginapC.text.isNotEmpty &&
        jumlahBayarC.text.isNotEmpty) {
      isLoading.value = true;
      var tes = await client.from("pembayaran").update({
        "kd_bayar": kodeBayarC.text,
        "kd_ruangan": kodeRuanganC.text,
        "kd_pasien": kodePasienC.text,
        "lama_menginap": lamaMenginapC.text,
        "jumlah_bayar": jumlahBayarC.text
      }).match({"kd_bayar": kodeBayarC.text}).execute();
      print(tes.toJson());
      isLoading.value = false;
      pasienC.getAllPasien();
      Get.back();
    }
  }
}
