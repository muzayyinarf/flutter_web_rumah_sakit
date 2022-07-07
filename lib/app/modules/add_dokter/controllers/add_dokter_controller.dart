import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../dokter/controllers/dokter_controller.dart';

class AddDokterController extends GetxController {
  DokterController dokterC = Get.find();
  RxBool isLoading = false.obs;
  SupabaseClient client = Supabase.instance.client;
  TextEditingController kodeDokterC = TextEditingController(text: "DR00");
  TextEditingController namaDokterC = TextEditingController();
  TextEditingController spesialisDokterC = TextEditingController();

  Future<void> addDokter() async {
    if (namaDokterC.text.isNotEmpty && spesialisDokterC.text.isNotEmpty) {
      isLoading.value = true;
      var tes = await client.from("dokter").insert({
        "kd_dokter": kodeDokterC.text,
        "nama_dokter": namaDokterC.text,
        "spesialis": spesialisDokterC.text,
      }).execute();
      print(tes.toJson());
      isLoading.value = false;
      dokterC.getAllDokter();
      Get.back();
    }
  }
}
