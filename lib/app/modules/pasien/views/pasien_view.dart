import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../theme.dart';
import '../../../data/models/pasien_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/pasien_controller.dart';

class PasienView extends GetView<PasienController> {
  const PasienView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pasien'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getAllPasien(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Obx(
            () => controller.allPasien.isEmpty
                ? const Center(
                    child: Text("Tidak ada data pasien"),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20),
                    itemCount: controller.allPasien.length,
                    itemBuilder: (context, index) {
                      Pasien pasien = controller.allPasien[index];
                      //return SizedBox();

                      return PasienItem(
                        kdPasien: pasien.kdPasien,
                        kdDokter: pasien.kdDokter,
                        namaPasien: pasien.namaPasien,
                        edit: () =>
                            Get.toNamed(Routes.EDIT_PASIEN, arguments: pasien),
                        delete: () => controller.deletePasien(pasien.kdPasien!),
                      );
                    },
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PASIEN),
        child: Icon(Icons.add),
      ),
    );
  }
}

class PasienItem extends StatelessWidget {
  final String? kdPasien;
  final String? kdDokter;
  final String? namaPasien;
  final Function()? edit;
  final Function()? delete;

  const PasienItem({
    Key? key,
    this.edit,
    this.kdPasien,
    this.kdDokter,
    this.namaPasien,
    this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Material(
        elevation: 3,
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: edit,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kode Pasien",
                    style: greyTextStyle,
                  ),
                  Text(
                    "Kode Dokter",
                    style: greyTextStyle,
                  ),
                  Text(
                    "Nama Pasien",
                    style: greyTextStyle,
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$kdPasien",
                    style: blackTextStyle,
                  ),
                  Text(
                    "$kdDokter",
                    style: blackTextStyle,
                  ),
                  Text(
                    "$namaPasien",
                    style: blackTextStyle,
                  ),
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
              IconButton(
                onPressed: delete,
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[400],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
