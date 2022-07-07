import 'package:get/get.dart';

import '../controllers/edit_pasien_controller.dart';

class EditPasienBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPasienController>(
      () => EditPasienController(),
    );
  }
}
