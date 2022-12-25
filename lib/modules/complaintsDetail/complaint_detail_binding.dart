import 'package:fereli_admin_panel/modules/complaintsDetail/complaintDetail.dart';
import 'package:get/get.dart';

class ComplaintDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComplaintDetailController>(() => ComplaintDetailController());
  }
}
