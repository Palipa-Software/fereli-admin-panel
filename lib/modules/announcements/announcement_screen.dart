import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fereli_admin_panel/modules/announcements/announcement.dart';
import 'package:fereli_admin_panel/modules/complaint/complaint.dart';
import 'package:fereli_admin_panel/routes/app_pages.dart';
import 'package:fereli_admin_panel/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../shared/constants/constants.dart';

class AnnouncementScreen extends GetView<AnnouncementController> {
  TextEditingController? title;
  TextEditingController? text;
  AnnouncementScreen({super.key, this.title, this.text});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppStrings.announcementsTitle,
            style: GoogleFonts.inconsolata(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Obx(
          () {
            return SingleChildScrollView(
              child: Container(
                width: 100.w,
                height: 80.h,
                margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 3.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 90.w,
                      height: 30.h,
                      child: controller.imagee.value == null
                          ? const SizedBox.shrink()
                          : Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(
                                    controller.imagee.value!,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextFormField(
                      controller: controller.announcementsTitle,
                      cursorColor: AppColors.oceanNight,
                      textInputAction: TextInputAction.next,
                      style: GoogleFonts.inconsolata(
                          color: AppColors.lakeView, fontSize: 17.sp),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(18.sp),
                        hintText: AppStrings.announcementInputTitle,
                        hintStyle: GoogleFonts.inconsolata(
                          color: AppColors.oceanNight,
                          fontSize: 16.sp,
                        ),
                        fillColor: AppColors.white,
                        filled: true,
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(18.sp),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextFormField(
                      controller: controller.announcementsText,
                      cursorColor: AppColors.oceanNight,
                      textInputAction: TextInputAction.next,
                      style: GoogleFonts.inconsolata(
                          color: AppColors.lakeView, fontSize: 17.sp),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(18.sp),
                        hintText: AppStrings.announcementInputTextTitle,
                        hintStyle: GoogleFonts.inconsolata(
                          color: AppColors.oceanNight,
                          fontSize: 16.sp,
                        ),
                        fillColor: AppColors.white,
                        filled: true,
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(18.sp),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    CustomButton(
                      func: () async {
                        await controller.pickImageGallery();
                      },
                      isTextButton: false,
                      color: AppColors.lakeView,
                      isAllWidth: true,
                      title: "Fotoğraf Yükle",
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    CustomButton(
                      func: () {
                        controller.createAnnouncement(
                            announcementsTitle:
                                controller.announcementsTitle.text,
                            announcementsText:
                                controller.announcementsText.text,
                            imagePath: controller.imagee.value!.path);
                        controller.announcementsTitle.text = "";
                        controller.announcementsText.text = "";
                      },
                      isTextButton: false,
                      title: "Gönder",
                      color: AppColors.lakeView,
                      isAllWidth: true,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    CustomButton(
                        func: () {
                          Get.toNamed(Routes.ANNOUNCEMENTLIST,
                              arguments: [AppStrings.announcementsTitle]);
                        },
                        isTextButton: false,
                        title: "Duyurulara Git",
                        isAllWidth: true,
                        color: AppColors.lakeView),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
