import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fereli_admin_panel/shared/constants/constants.dart';
import 'package:get/get.dart';

class RoomTechnicalSupportController extends GetxController {
  CollectionReference roomTechnicalSupportComplaint =
      FirebaseFirestore.instance.collection("roomTechnicalSupport");

  final Stream<QuerySnapshot<Object?>>? stream =
      FirebaseManager.stream("roomTechnicalSupport");
}
