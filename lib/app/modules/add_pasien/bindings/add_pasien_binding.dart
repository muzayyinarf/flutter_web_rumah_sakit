import 'package:get/get.dart';

import '../controllers/add_pasien_controller.dart';

class AddPasienBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPasienController>(
      () => AddPasienController(),
    );
  }
}
