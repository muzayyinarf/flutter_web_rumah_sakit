import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../dokter/controllers/dokter_controller.dart';

class EditDokterController extends GetxController {
  DokterController dokterC = Get.find();
  RxBool isLoading = false.obs;

  SupabaseClient client = Supabase.instance.client;
  TextEditingController kodeDokterC = TextEditingController();
  TextEditingController namaDokterC = TextEditingController();
  TextEditingController spesialisDokterC = TextEditingController();

  Future<void> editDokter(String id) async {
    if (namaDokterC.text.isNotEmpty && spesialisDokterC.text.isNotEmpty) {
      isLoading.value = true;
      var tes = await client.from("dokter").update({
        "nama_dokter": namaDokterC.text,
        "spesialis": spesialisDokterC.text,
      }).match({"kd_dokter": id}).execute();
      print(tes.toJson());
      isLoading.value = false;
      dokterC.getAllDokter();
      Get.back();
    }
  }
}
