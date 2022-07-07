import 'package:get/get.dart';
import 'package:rumah_sakit/app/data/models/pembayaran_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PembayaranController extends GetxController {
  RxList allPembayaran = List<Pembayaran>.empty().obs;
  SupabaseClient client = Supabase.instance.client;

  Future<void> getAllPembayaran() async {
    var pembayaran = await client.from("pembayaran").select("*").execute();

    List<Pembayaran> dataPembayaran =
        Pembayaran.fromJsonList((pembayaran.data as List));

    allPembayaran(dataPembayaran);
    allPembayaran.refresh();
    print(allPembayaran[0].toJson());
  }

  void deletePembayaran(String id) async {
    await client.from("pembayaran").delete().match({"kd_bayar": id}).execute();
    getAllPembayaran();
  }
}
