import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../theme.dart';
import '../../../data/models/pasien_model.dart';
import '../../../data/models/pembayaran_model.dart';
import '../../../data/models/ruangan_model.dart';
import '../controllers/edit_pembayaran_controller.dart';

class EditPembayaranView extends GetView<EditPembayaranController> {
  const EditPembayaranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Pembayaran pembayaran = Get.arguments;
    controller.kodeBayarC.text = pembayaran.kdBayar!;
    controller.kodeRuanganC.text = pembayaran.kdRuangan!;
    controller.kodePasienC.text = pembayaran.kdPasien!;
    controller.lamaMenginapC.text = pembayaran.lamaMenginap.toString();
    controller.jumlahBayarC.text = pembayaran.jumlahBayar.toString();
    controller.hintRuangan.value = pembayaran.kdRuangan!;
    controller.hintPasien.value = pembayaran.kdPasien!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Pembayaran'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.kodeBayarC,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text(
                "Kode Bayar",
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
                child: DropdownButton<Ruangan>(
                  underline: SizedBox(),
                  autofocus: true,
                  style: whiteTextStyle,
                  borderRadius: BorderRadius.circular(10),
                  focusColor: Colors.blue,
                  dropdownColor: Colors.blue,
                  alignment: Alignment.center,
                  isExpanded: true,
                  items: (controller.ruanganC.allRuangan as List<Ruangan>)
                      .map((Ruangan e) => DropdownMenuItem<Ruangan>(
                            value: e,
                            child: Text("${e.kdRuangan} - ${e.jenisRuangan}"),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.kodeRuanganC.text = value!.kdRuangan!;
                    controller.hintRuangan.value =
                        "${value.kdRuangan} - ${value.jenisRuangan}";
                  },
                  hint: Text(controller.hintRuangan.value),
                  iconEnabledColor: Colors.white,
                ),
              ),
            ),
          ),
          box,
          Obx(
            () => DecoratedBox(
              decoration: gradient,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton<Pasien>(
                  underline: SizedBox(),
                  autofocus: true,
                  style: whiteTextStyle,
                  borderRadius: BorderRadius.circular(10),
                  focusColor: Colors.blue,
                  dropdownColor: Colors.blue,
                  alignment: Alignment.center,
                  isExpanded: true,
                  items: (controller.pasienC.allPasien as List<Pasien>)
                      .map((Pasien e) => DropdownMenuItem<Pasien>(
                            value: e,
                            child: Text("${e.kdPasien} - ${e.namaPasien}"),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.kodePasienC.text = value!.kdPasien!;
                    controller.hintPasien.value =
                        "${value.kdPasien} - ${value.namaPasien}";
                  },
                  hint: Text(controller.hintPasien.value),
                  iconEnabledColor: Colors.white,
                ),
              ),
            ),
          ),
          box,
          TextField(
            controller: controller.lamaMenginapC,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text(
                "Lama Menginap",
                style: greyTextStyle,
              ),
            ),
          ),
          box,
          TextField(
            controller: controller.jumlahBayarC,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text(
                "Jumlah Bayar",
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
                      ? "Edit Pembayaran"
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
