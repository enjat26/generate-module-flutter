import 'package:get/get.dart';

import '../controllers/name_controller.dart';

class NameBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NameController>(() => NameController());
  }
}
