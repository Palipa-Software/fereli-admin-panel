import 'package:fereli_admin_panel/modules/announcement_list/announcement_list.dart';
import 'package:fereli_admin_panel/modules/announcement_list_detail/announcement_list_detail_binding.dart';
import 'package:fereli_admin_panel/modules/announcement_list_detail/announcement_list_detail_screen.dart';
import 'package:fereli_admin_panel/modules/announcements/announcement.dart';
import 'package:fereli_admin_panel/modules/complaintsDetail/complaintDetail.dart';
import 'package:fereli_admin_panel/modules/complaint/complaint_screen.dart';
import 'package:fereli_admin_panel/modules/complaint/complaint_screen_binding.dart';
import 'package:fereli_admin_panel/modules/home/home.dart';
import 'package:fereli_admin_panel/modules/loginComplaint/login_complaint.dart';
import 'package:fereli_admin_panel/modules/roomTechnicalSupport/roomTechnicalSupport.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.COMPLAINT,
      page: () => const ComplaintScreen(),
      binding: ComplaintScreenBinding(),
    ),
    GetPage(
      name: Routes.COMPLAINTDETAIL,
      page: () => ComplaintDetailScreen(),
      binding: ComplaintDetailBinding(),
    ),
    GetPage(
      name: Routes.HOMESCREEN,
      page: () => HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: Routes.ROOMTECHNICALSUPPORT,
      page: () => const RoomTechnicalSupportScreen(),
      binding: RoomTechnicalSupportBinding(),
    ),
    GetPage(
      name: Routes.LOGINCOMPLAINT,
      page: () => const LoginComplaintScreen(),
      binding: LoginComplaintScreenBinding(),
    ),
    GetPage(
      name: Routes.ANNOUNCEMENT,
      page: () => AnnouncementScreen(),
      binding: AnnouncementBinding(),
    ),
    GetPage(
      name: Routes.ANNOUNCEMENTLIST,
      page: () => AnnouncementListScreen(),
      binding: AnnouncementListBinding(),
    ),
    GetPage(
      name: Routes.ANNOUNCEMENTLISTDETAIL,
      page: () => AnnouncementListDetailScreen(),
      binding: AnnouncementListDetailBinding(),
    ),
  ];
}
