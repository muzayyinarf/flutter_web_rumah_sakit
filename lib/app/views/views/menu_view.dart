import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MenuView extends GetView {
  const MenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MenuView'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text("Tambah Dokter"),
            ),
          ],
        ));
  }
}
