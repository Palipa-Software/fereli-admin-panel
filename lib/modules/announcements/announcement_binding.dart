import 'package:fereli_admin_panel/modules/announcements/announcement.dart';
import 'package:get/get.dart';

class AnnouncementBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnnouncementController>(() => AnnouncementController());
  }
}
