import 'package:get/get.dart';

import '../controllers/edit_dokter_controller.dart';

class EditDokterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDokterController>(
      () => EditDokterController(),
    );
  }
}
