import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../shared/constants/firebase_manager.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AnnouncementListDetailController extends GetxController {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult results =
        await storage.ref("images/announcements").listAll();
    results.items.forEach((firebase_storage.Reference ref) {
      print("found file: $ref");
    });
    return results;
  }

  Future<String> downloadURL(String imageName) async {
    String downloadURL =
        await storage.ref("images/announcements/$imageName").getDownloadURL();
    return downloadURL;
  }

  CollectionReference announcement_list_detail =
      FirebaseFirestore.instance.collection("announcements");

  final Stream<QuerySnapshot<Object?>>? stream =
      FirebaseManager.stream("announcements");
}
