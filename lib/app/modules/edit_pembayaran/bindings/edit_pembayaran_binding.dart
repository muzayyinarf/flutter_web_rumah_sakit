import 'package:get/get.dart';

import '../controllers/edit_pembayaran_controller.dart';

class EditPembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPembayaranController>(
      () => EditPembayaranController(),
    );
  }
}
