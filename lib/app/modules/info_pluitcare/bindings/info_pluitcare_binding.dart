import 'package:pluitcare/app/modules/info_pluitcare/controllers/info_pluitcare_controller.dart';
import 'package:get/get.dart';

class InfopluitcareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfopluitcareController>(
      () => InfopluitcareController(),
    );
  }
}
