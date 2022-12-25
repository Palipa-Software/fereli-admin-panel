import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fereli_admin_panel/shared/constants/constants.dart';
import 'package:get/get.dart';

class LoginComplaintScreenController extends GetxController {
  CollectionReference loginComplaint =
      FirebaseFirestore.instance.collection("loginComplaint");

  final Stream<QuerySnapshot<Object?>>? stream =
      FirebaseManager.stream("loginComplaint");
}
