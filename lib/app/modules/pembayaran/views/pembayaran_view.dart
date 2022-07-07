import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sakit/app/data/models/pembayaran_model.dart';

import '../../../../theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/pembayaran_controller.dart';

class PembayaranView extends GetView<PembayaranController> {
  const PembayaranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: plainBlueColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text(
          'Data Pembayaran',
          style: whiteTextStyle,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getAllPembayaran(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Obx(() => controller.allPembayaran.isEmpty
              ? const Center(
                  child: Text("Tidak ada data pembayaran"),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: controller.allPembayaran.length,
                  itemBuilder: (context, index) {
                    Pembayaran pembayaran = controller.allPembayaran[index];
                    return PembayaranItem(
                      kdBayar: pembayaran.kdBayar,
                      kdPasien: pembayaran.kdPasien,
                      kdRuangan: pembayaran.kdRuangan,
                      lamaMenginap: pembayaran.lamaMenginap,
                      jumlahBayar: pembayaran.jumlahBayar,
                      edit: () => Get.toNamed(Routes.EDIT_PEMBAYARAN,
                          arguments: pembayaran),
                      delete: () =>
                          controller.deletePembayaran(pembayaran.kdBayar!),
                    );
                  },
                ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PEMBAYARAN),
        child: Icon(Icons.add),
      ),
    );
  }
}

class PembayaranItem extends StatelessWidget {
  final String? kdBayar;
  final String? kdRuangan;
  final String? kdPasien;
  final int? lamaMenginap;
  final int? jumlahBayar;
  final Function()? edit;
  final Function()? delete;

  const PembayaranItem({
    Key? key,
    this.kdBayar,
    this.kdRuangan,
    this.kdPasien,
    this.lamaMenginap,
    this.jumlahBayar,
    this.delete,
    this.edit,
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
                    "Kode Bayar",
                    style: greyTextStyle,
                  ),
                  Text(
                    "Kode Ruangan",
                    style: greyTextStyle,
                  ),
                  Text(
                    "Kode Pasien",
                    style: greyTextStyle,
                  ),
                  Text(
                    "Lama Menginap",
                    style: greyTextStyle,
                  ),
                  Text(
                    "Jumlah Bayar",
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
                    "$kdBayar",
                    style: blackTextStyle,
                  ),
                  Text(
                    "$kdRuangan",
                    style: blackTextStyle,
                  ),
                  Text(
                    "$kdPasien",
                    style: blackTextStyle,
                  ),
                  Text(
                    "$lamaMenginap Malam",
                    style: blackTextStyle,
                  ),
                  Text(
                    "Rp. $jumlahBayar",
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
