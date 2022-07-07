import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sakit/app/data/models/pasien_model.dart';

import '../../../../theme.dart';
import '../../../data/models/dokter_model.dart';
import '../controllers/edit_pasien_controller.dart';

class EditPasienView extends GetView<EditPasienController> {
  const EditPasienView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Pasien pasien = Get.arguments;
    controller.kodePasienC.text = pasien.kdPasien!;
    controller.hintDokter.value = pasien.kdDokter!;
    controller.kodeDokterC.text = pasien.kdDokter!;
    controller.namaPasienC.text = pasien.namaPasien!;
    return Scaffold(
      backgroundColor: plainBlueColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text('Edit Data Pasien'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            readOnly: true,
            controller: controller.kodePasienC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text(
                "Kode Dokter",
                style: greyTextStyle,
              ),
            ),
          ),
          box,
          Obx(
            () => DecoratedBox(
              decoration: gradient,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton<Dokter>(
                  style: whiteTextStyle,
                  borderRadius: BorderRadius.circular(10),
                  focusColor: Colors.blue,
                  dropdownColor: Colors.blue,
                  alignment: Alignment.center,
                  underline: const SizedBox(),
                  isExpanded: true,
                  items: (controller.dokterC.allDokter as List<Dokter>)
                      .map((Dokter e) => DropdownMenuItem<Dokter>(
                            value: e,
                            child: Text("${e.kdDokter} - ${e.namaDokter}"),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.kodeDokterC.text = value!.kdDokter!;
                    controller.hintDokter.value =
                        "${value.kdDokter} - ${value.namaDokter}";
                  },
                  hint: Text(controller.hintDokter.value),
                ),
              ),
            ),
          ),
          box,
          TextField(
            controller: controller.namaPasienC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text(
                "Nama Pasien",
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
                    await controller.addPasien();
                  }
                },
                child: Text(
                  (controller.isLoading.isFalse) ? "Edit Pasien" : "Loading...",
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
