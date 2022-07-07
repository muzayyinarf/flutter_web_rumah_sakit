import 'package:get/get.dart';
import 'package:rumah_sakit/app/data/models/ruangan_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RuanganController extends GetxController {
  RxList allRuangan = List<Ruangan>.empty().obs;
  SupabaseClient client = Supabase.instance.client;

  Future<void> getAllRuangan() async {
    var ruangan = await client.from("ruangan").select("*").execute();

    List<Ruangan> dataRuangan = Ruangan.fromJsonList((ruangan.data as List));

    allRuangan(dataRuangan);
    allRuangan.refresh();
    print(allRuangan[0].toJson());
  }

  void deletePasien(String id) async {
    await client.from("ruangan").delete().match({"kd_ruangan": id}).execute();
    getAllRuangan();
  }
}
