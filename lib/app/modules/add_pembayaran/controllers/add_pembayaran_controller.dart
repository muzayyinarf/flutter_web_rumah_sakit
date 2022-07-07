import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sakit/app/modules/pembayaran/controllers/pembayaran_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../pasien/controllers/pasien_controller.dart';
import '../../ruangan/controllers/ruangan_controller.dart';

class AddPembayaranController extends GetxController {
  PembayaranController pembayaranC = Get.find();
  PasienController pasienC = Get.put(PasienController());
  RuanganController ruanganC = Get.put(RuanganController());

  RxBool isLoading = false.obs;
  SupabaseClient client = Supabase.instance.client;

  TextEditingController kodeBayarC = TextEditingController(text: "TR00");
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
      var tes = await client.from("pembayaran").insert({
        "kd_bayar": kodeBayarC.text,
        "kd_ruangan": kodeRuanganC.text,
        "kd_pasien": kodePasienC.text,
        "lama_menginap": lamaMenginapC.text,
        "jumlah_bayar": jumlahBayarC.text
      }).execute();
      print(tes.toJson());
      isLoading.value = false;
      pembayaranC.allPembayaran();
      Get.back();
    }
  }
}
