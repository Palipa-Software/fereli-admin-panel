import 'package:get/get.dart';

import 'login_complaint.dart';

class LoginComplaintScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginComplaintScreenController>(
        () => LoginComplaintScreenController());
  }
}
