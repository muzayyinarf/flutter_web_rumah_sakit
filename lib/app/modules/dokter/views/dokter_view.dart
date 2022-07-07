import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sakit/app/routes/app_pages.dart';
import 'package:rumah_sakit/theme.dart';

import '../../../data/models/dokter_model.dart';
import '../controllers/dokter_controller.dart';

class DokterView extends GetView<DokterController> {
  const DokterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: plainBlueColor,
      appBar: AppBar(
        title: Text(
          'Data Dokter',
          style: whiteTextStyle,
        ),
        backgroundColor: secondaryColor,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getAllDokter(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Obx(
            () => controller.allDokter.isEmpty
                ? const Center(
                    child: Text("Tidak ada data dokter"),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20),
                    itemCount: controller.allDokter.length,
                    itemBuilder: (context, index) {
                      Dokter dokter = controller.allDokter[index];
                      //return SizedBox();
                      return DokterItem(
                        kdDokter: dokter.kdDokter,
                        namaDokter: dokter.namaDokter,
                        spesialis: dokter.spesialis,
                        edit: () =>
                            Get.toNamed(Routes.EDIT_DOKTER, arguments: dokter),
                        delete: () => controller.deleteDokter(dokter.kdDokter!),
                      );
                    },
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_DOKTER),
        child: Icon(Icons.add),
      ),
    );
  }
}

class DokterItem extends StatelessWidget {
  final String? kdDokter;
  final String? namaDokter;
  final String? spesialis;
  final Function()? edit;
  final Function()? delete;

  const DokterItem({
    Key? key,
    this.delete,
    this.edit,
    this.kdDokter,
    this.namaDokter,
    this.spesialis,
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
                    "Kode Dokter",
                    style: greyTextStyle,
                  ),
                  Text(
                    "Nama Dokter",
                    style: greyTextStyle,
                  ),
                  Text(
                    "Spesialis",
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
                    "$kdDokter",
                    style: blackTextStyle,
                  ),
                  Text(
                    "$namaDokter",
                    style: blackTextStyle,
                  ),
                  Text(
                    "$spesialis",
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
