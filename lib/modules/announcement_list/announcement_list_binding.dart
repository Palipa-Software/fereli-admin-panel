import 'package:get/get.dart';

import 'announcement_list.dart';

class AnnouncementListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnnouncementListController>(() => AnnouncementListController());
  }
}
