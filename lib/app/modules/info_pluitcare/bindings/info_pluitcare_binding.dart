
import 'package:get/get.dart';

import '../controllers/info_pluitcare_controller.dart';

class InfoadokterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoadokterController>(
      () => InfoadokterController(),
    );
  }
}
