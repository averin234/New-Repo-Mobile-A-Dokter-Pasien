import 'package:get/get.dart';

class RegisterRsController extends GetxController {
  //TODO: Implement RegisterRsController
  final kode_bagian = ''.obs;
  final provinsi = ''.obs;
  final kota = ''.obs;
  final kecamatan = ''.obs;
  final isNoHome = (Get.arguments ?? false) as bool;

  String rangeHari(String rangeHari) {
    String formattedDays;
    List<String> days = rangeHari.split(",");
    if (days.length <= 1) {
      formattedDays = days.first;
    } else {
      formattedDays =
          "${days.getRange(0, days.length - 1).join(', ')} dan ${days.last}";
    }
    return formattedDays;
  }
}
