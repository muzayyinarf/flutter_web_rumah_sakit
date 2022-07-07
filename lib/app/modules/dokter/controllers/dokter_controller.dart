import 'package:get/get.dart';
import 'package:rumah_sakit/app/data/models/dokter_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DokterController extends GetxController {
  RxList allDokter = List<Dokter>.empty().obs;
  SupabaseClient client = Supabase.instance.client;

  Future<void> getAllDokter() async {
    var dokters = await client.from("dokter").select("*").execute();

    List<Dokter> dataDokter = Dokter.fromJsonList((dokters.data as List));

    allDokter(dataDokter);
    allDokter.refresh();
    print(allDokter[0].toJson());
  }

  void deleteDokter(String id) async {
    await client.from("dokter").delete().match({"kd_dokter": id}).execute();
    getAllDokter();
  }
}
