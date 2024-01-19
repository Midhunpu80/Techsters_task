import 'package:get/get.dart';

class selectbutton_controller extends GetxController {
  var value = 0.obs;
  changebutton({required var index}) {
    value.value = index;
    update();
  }
}
