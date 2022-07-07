import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sakit/app/modules/dokter/controllers/dokter_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../pasien/controllers/pasien_controller.dart';

class AddPasienController extends GetxController {
  PasienController pasienC = Get.find();
  RxBool isLoading = false.obs;
  SupabaseClient client = Supabase.instance.client;
  TextEditingController kodePasienC = TextEditingController(text: "PS00");
  TextEditingController kodeDokterC = TextEditingController();
  TextEditingController namaPasienC = TextEditingController();
  DokterController dokterC = Get.put(DokterController());
  @override
  void onInit() {
    dokterC.getAllDokter();
    dokterC.allDokter;
    super.onInit();
  }

  RxString hintDokter = "Pilih Dokter".obs;

  Future<void> addPasien() async {
    if (namaPasienC.text.isNotEmpty &&
        kodePasienC.text.isNotEmpty &&
        kodeDokterC.text.isNotEmpty) {
      isLoading.value = true;
      var tes = await client.from("pasien").insert({
        "kd_pasien": kodePasienC.text,
        "kd_dokter": kodeDokterC.text,
        "nama_pasien": namaPasienC.text,
      }).execute();
      print(tes.toJson());
      isLoading.value = false;
      pasienC.getAllPasien();
      Get.back();
    }
  }
}
