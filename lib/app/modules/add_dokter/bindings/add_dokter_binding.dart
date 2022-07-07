import 'package:get/get.dart';

import '../controllers/add_dokter_controller.dart';

class AddDokterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDokterController>(
      () => AddDokterController(),
    );
  }
}
