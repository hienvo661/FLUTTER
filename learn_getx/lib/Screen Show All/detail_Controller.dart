import 'package:get/get.dart';

class detail_Controller extends GetxController {
  var favorites = 0.obs;
  void favCounter() {
    if (favorites.value == 1) {
      Get.snackbar('Loved it', 'You already loved it');
    } else {
      favorites.value++;
      Get.snackbar('Loved it', 'You just love it');
    }
  }
}
