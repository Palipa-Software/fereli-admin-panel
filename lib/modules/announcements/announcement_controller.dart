import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../shared/constants/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AnnouncementController extends GetxController {
  Timestamp date = Timestamp.now();
  final TextEditingController announcementsTitle = TextEditingController();
  final TextEditingController announcementsText = TextEditingController();

  Rx<File?> imagee = null.obs;

  Future pickImageGallery() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imagee.update((val) {
          // val değeri bir önceki pathi tutuyor burada
          imagee = File(pickedFile.path).obs;
        });
      }
      return;
    } on PlatformException catch (e) {
      print("hataaaaa");
    }
  }

  Future createAnnouncement({
    required String announcementsTitle,
    required String announcementsText,
    required String imagePath,
  }) async {
    if (announcementsTitle.isNotEmpty &&
        announcementsText.isNotEmpty &&
        imagePath.isNotEmpty) {
      final docComplaint =
          FirebaseFirestore.instance.collection("announcements").doc();

      final json = {
        "title": announcementsTitle,
        "text": announcementsText,
        "date": date,
        "image_name": imagePath
      };
      await docComplaint.set(json);
      Get.snackbar(
        "Başarılı",
        "başarılı mesaj",
        backgroundColor: AppColors.sodaliteBlue,
        titleText: Text(
          "Duyuru Durumu",
          style: GoogleFonts.inconsolata(
            color: AppColors.white,
            fontSize: 20.sp,
          ),
        ),
        messageText: Text(
          "Duyuru Başarılı Bir Şekilde Eklendi!",
          style: GoogleFonts.inconsolata(
            color: AppColors.white,
            fontSize: 17.sp,
          ),
        ),
      );
    } else {
      Get.snackbar(
        "Success",
        "Success message",
        backgroundColor: AppColors.sodaliteBlue,
        titleText: Text(
          "Duyuru Durumu",
          style: GoogleFonts.inconsolata(
            color: AppColors.white,
            fontSize: 20.sp,
          ),
        ),
        messageText: Text(
          "Boş Bırakılan Yerleri Doldurunuz!!!",
          style:
              GoogleFonts.inconsolata(color: AppColors.white, fontSize: 17.sp),
        ),
      );
    }
  }
}
