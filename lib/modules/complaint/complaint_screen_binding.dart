import 'package:get/get.dart';

import 'complaint.dart';

class ComplaintScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComplaintScreenController>(() => ComplaintScreenController());
  }
}
