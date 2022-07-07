import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sakit/theme.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Rumah Sakit',
            style: whiteTextStyle,
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: const [
            MenuItem("Dokter", Routes.DOKTER),
            MenuItem("Pasien", Routes.PASIEN),
            MenuItem("Ruangan", Routes.RUANGAN),
            MenuItem("Pembayaran", Routes.PEMBAYARAN),
          ],
        ));
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final dynamic nav;

  const MenuItem(
    this.title,
    this.nav, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Get.toNamed(nav),
        title: Text(
          title,
          style: blackTextStyle,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
