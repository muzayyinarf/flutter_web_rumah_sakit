import 'package:get/get.dart';

import '../controllers/add_pembayaran_controller.dart';

class AddPembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPembayaranController>(
      () => AddPembayaranController(),
    );
  }
}
