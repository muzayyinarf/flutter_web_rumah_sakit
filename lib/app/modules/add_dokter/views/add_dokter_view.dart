import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../theme.dart';
import '../controllers/add_dokter_controller.dart';

class AddDokterView extends GetView<AddDokterController> {
  const AddDokterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: plainBlueColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text(
          'Tambah Dokter',
          style: whiteTextStyle,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
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
                    await controller.addDokter();
                  }
                },
                child: Text(
                  (controller.isLoading.isFalse)
                      ? "Tambah Dokter"
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
