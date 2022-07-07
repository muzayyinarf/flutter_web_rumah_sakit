import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../theme.dart';
import '../../../data/models/ruangan_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/ruangan_controller.dart';

class RuanganView extends GetView<RuanganController> {
  const RuanganView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Ruangan',
          style: whiteTextStyle,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getAllRuangan(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Obx(
            () => controller.allRuangan.isEmpty
                ? const Center(
                    child: Text("Tidak ada data ruangan"),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20),
                    itemCount: controller.allRuangan.length,
                    itemBuilder: (context, index) {
                      Ruangan ruangan = controller.allRuangan[index];
                      //return SizedBox();

                      return RuanganItem(
                        kdRuangan: ruangan.kdRuangan,
                        jenisRuangan: ruangan.jenisRuangan,
                        hargaPermalam: ruangan.hargaPermalam.toString(),
                        edit: () => Get.toNamed(Routes.EDIT_RUANGAN,
                            arguments: ruangan),
                        delete: () =>
                            controller.deletePasien(ruangan.kdRuangan!),
                      );
                    },
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_RUANGAN),
        child: Icon(Icons.add),
      ),
    );
  }
}

class RuanganItem extends StatelessWidget {
  final String? kdRuangan;
  final String? jenisRuangan;
  final String? hargaPermalam;
  final Function()? edit;
  final Function()? delete;

  const RuanganItem({
    Key? key,
    this.kdRuangan,
    this.jenisRuangan,
    this.hargaPermalam,
    this.edit,
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
                    "$kdRuangan",
                    style: blackTextStyle,
                  ),
                  Text(
                    "$jenisRuangan",
                    style: blackTextStyle,
                  ),
                  Text(
                    "$hargaPermalam",
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
