import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fereli_admin_panel/shared/constants/constants.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';

class HomeScreenController extends GetxController {
  CollectionReference homePageComplaint =
      FirebaseFirestore.instance.collection("homePageComplaint");

  final Stream<QuerySnapshot<Object?>>? stream =
      FirebaseManager.stream("homePageComplaint");

  void pageRoute(List<String> menu, dynamic index) {
    if (menu[0] == menu[index]) {
      Get.toNamed(Routes.ANNOUNCEMENT);
    } else if (menu[1] == menu[index]) {
      print("yemek listesi bölümüne git");
    } else if (menu[2] == menu[index]) {
      Get.toNamed(Routes.COMPLAINT);
    } else if (menu[3] == menu[index]) {
      Get.toNamed(Routes.ROOMTECHNICALSUPPORT);
    } else if (menu[4] == menu[index]) {
      print("anketler bölümüne git");
    } else if (menu[5] == menu[index]) {
      print("etkinlikler bölümüne git");
    } else if (menu[6] == menu[index]) {
      Get.toNamed(Routes.LOGINCOMPLAINT);
    }
  }
}
