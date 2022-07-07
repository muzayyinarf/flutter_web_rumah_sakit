import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../theme.dart';
import '../../../data/models/dokter_model.dart';
import '../controllers/edit_dokter_controller.dart';

class EditDokterView extends GetView<EditDokterController> {
  const EditDokterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Dokter dokter = Get.arguments;
    controller.kodeDokterC.text = dokter.kdDokter!;
    controller.namaDokterC.text = dokter.namaDokter!;
    controller.spesialisDokterC.text = dokter.spesialis!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Dokter'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            readOnly: true,
            controller: controller.kodeDokterC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text(
                "Kode Dokter",
                style: greyTextStyle,
              ),
            ),
          ),
          box,
          TextField(
            controller: controller.namaDokterC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text(
                "Nama Dokter",
                style: greyTextStyle,
              ),
            ),
          ),
          box,
          TextField(
            controller: controller.spesialisDokterC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text(
                "Spesialis",
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
                    await controller.editDokter(dokter.kdDokter!);
                  }
                },
                child: Text(
                  (controller.isLoading.isFalse) ? "Edit Dokter" : "Loading...",
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
