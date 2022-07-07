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
        backgroundColor: plainBlueColor,
        appBar: AppBar(
          backgroundColor: secondaryColor,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.amber,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'asset/images/clinic.png',
                      width: 50,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Sistem Informasi \nRumah Sakit",
                      maxLines: 2,
                      style: whiteTextStyle.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            MenuItem(Icons.person_search_rounded, "Dokter", Routes.DOKTER),
            MenuItem(Icons.person_search_rounded, "Pasien", Routes.PASIEN),
            MenuItem(Icons.home_work_rounded, "Ruangan", Routes.RUANGAN),
            MenuItem(Icons.monetization_on, "Pembayaran", Routes.PEMBAYARAN),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: primaryColor,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "Muzayyin Arifin \n14011900102\nILMU KOMPUTER UNIBA",
                      maxLines: 2,
                      style: whiteTextStyle.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final dynamic nav;

  const MenuItem(
    this.icon,
    this.title,
    this.nav, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: primaryColor),
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
