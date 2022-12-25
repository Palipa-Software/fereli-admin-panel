import 'package:fereli_admin_panel/modules/announcement_list_detail/announcement_list_detail_controller.dart';
import 'package:get/get.dart';

class AnnouncementListDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnnouncementListDetailController>(
        () => AnnouncementListDetailController());
  }
}
