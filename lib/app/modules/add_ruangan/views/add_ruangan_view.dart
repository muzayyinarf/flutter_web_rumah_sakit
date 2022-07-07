import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../theme.dart';
import '../controllers/add_ruangan_controller.dart';

class AddRuanganView extends GetView<AddRuanganController> {
  const AddRuanganView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Ruangan'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
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
