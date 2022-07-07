import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../ruangan/controllers/ruangan_controller.dart';

class EditRuanganController extends GetxController {
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
      var tes = await client.from("ruangan").update({
        "jenis_ruangan": jenisRuangan.text,
        "harga_permalam": hargaPermalam.text,
      }).match({"kd_ruangan": kodeRuangan.text}).execute();
      print(tes.toJson());
      isLoading.value = false;
      ruanganC.getAllRuangan();
      Get.back();
    }
  }
}
