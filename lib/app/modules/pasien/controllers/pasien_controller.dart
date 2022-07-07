import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/models/pasien_model.dart';

class PasienController extends GetxController {
  RxList allPasien = List<Pasien>.empty().obs;
  SupabaseClient client = Supabase.instance.client;

  Future<void> getAllPasien() async {
    var pasiens = await client.from("pasien").select("*").execute();

    List<Pasien> dataPasien = Pasien.fromJsonList((pasiens.data as List));

    allPasien(dataPasien);
    allPasien.refresh();
    print(allPasien[0].toJson());
  }

  void deletePasien(String id) async {
    await client.from("pasien").delete().match({"kd_pasien": id}).execute();
    getAllPasien();
  }
}
