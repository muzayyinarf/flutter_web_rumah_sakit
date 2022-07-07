import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sakit/app/data/models/dokter_model.dart';

import '../../../../theme.dart';
import '../controllers/add_pasien_controller.dart';

class AddPasienView extends GetView<AddPasienController> {
  const AddPasienView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data Pasien'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
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
                  underline: SizedBox(),
                  autofocus: true,
                  style: whiteTextStyle,
                  borderRadius: BorderRadius.circular(10),
                  focusColor: Colors.blue,
                  dropdownColor: Colors.blue,
                  alignment: Alignment.center,
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
                  iconEnabledColor: Colors.white,
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
                  (controller.isLoading.isFalse)
                      ? "Tambah Pasien"
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
