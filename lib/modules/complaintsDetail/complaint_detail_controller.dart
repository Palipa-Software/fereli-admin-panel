import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../shared/constants/firebase_manager.dart';

class ComplaintDetailController extends GetxController {
  CollectionReference homePageComplaint =
      FirebaseFirestore.instance.collection("homePageComplaint");

  final Stream<QuerySnapshot<Object?>>? stream =
      FirebaseManager.stream("homePageComplaint");
}
