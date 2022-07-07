import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sakit/app/modules/ruangan/controllers/ruangan_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddRuanganController extends GetxController {
  RxBool isLoading = false.obs;
  SupabaseClient client = Supabase.instance.client;
  TextEditingController kodeRuangan = TextEditingController(text: "R00");
  TextEditingController jenisRuangan = TextEditingController();
  TextEditingController hargaPermalam = TextEditingController();
  RuanganController ruanganC = Get.find();

  Future<void> addRuangan() async {
    if (hargaPermalam.text.isNotEmpty &&
        kodeRuangan.text.isNotEmpty &&
        jenisRuangan.text.isNotEmpty) {
      isLoading.value = true;
      var tes = await client.from("ruangan").insert({
        "kd_ruangan": kodeRuangan.text,
        "jenis_ruangan": jenisRuangan.text,
        "harga_permalam": hargaPermalam.text,
      }).execute();
      print(tes.toJson());
      isLoading.value = false;
      ruanganC.getAllRuangan();
      Get.back();
    }
  }
}
