import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sakit/app/data/models/ruangan_model.dart';

import '../../../../theme.dart';
import '../controllers/edit_ruangan_controller.dart';

class EditRuanganView extends GetView<EditRuanganController> {
  const EditRuanganView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Ruangan ruangan = Get.arguments;
    controller.kodeRuangan.text = ruangan.kdRuangan!;
    controller.jenisRuangan.text = ruangan.jenisRuangan!;
    controller.hargaPermalam.text = ruangan.hargaPermalam.toString();
    return Scaffold(
      backgroundColor: plainBlueColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text('Edit Ruangan'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            readOnly: true,
            controller: controller.kodeRuangan,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text(
                "Kode Ruangan",
                style: greyTextStyle,
              ),
            ),
          ),
          box,
          TextField(
            controller: controller.jenisRuangan,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text(
                "Jenis Ruangan",
                style: greyTextStyle,
              ),
            ),
          ),
          box,
          TextField(
            controller: controller.hargaPermalam,
            autocorrect: false,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text(
                "Harga Permalam",
                style: greyTextStyle,
              ),
            ),
          ),
          box,
          Obx(
            () => SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: () async {
                  if (controller.isLoading.isFalse) {
                    //eksekusi
                    await controller.addRuangan();
                  }
                },
                child: Text(
                  (controller.isLoading.isFalse)
                      ? "Tambah Ruangan"
                      : "Loading...",
                  style: whiteTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
