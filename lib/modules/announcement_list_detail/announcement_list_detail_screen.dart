import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fereli_admin_panel/modules/announcement_list_detail/announcement_list_detail_controller.dart';
import 'package:fereli_admin_panel/modules/complaintsDetail/complaintDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../shared/constants/constants.dart';

class AnnouncementListDetailScreen
    extends GetView<AnnouncementListDetailController> {
  AnnouncementListDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
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
        body: Padding(
            padding: AppPadding.projectpaddingHorizontal,
            child: FutureBuilder(
              future: controller.downloadURL(args[3]),
              builder: (context, AsyncSnapshot futureSnapshot) {
                if (futureSnapshot.hasData) {
                  return StreamBuilder<QuerySnapshot>(
                    stream: controller.stream,
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text("Something went wrong");
                      } else if (snapshot.hasData) {
                        return Container(
                          width: 100.w,
                          margin: EdgeInsets.only(bottom: 2.h),
                          padding: AppPadding.projectPadding,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(
                              color: AppColors.white,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Flexible(
                                        child: Text(
                                          args[2].toDate().toString(),
                                          style: GoogleFonts.inconsolata(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Flexible(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              futureSnapshot.data.toString(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Flexible(
                                      child: Text(
                                        args[0].toUpperCase(),
                                        style: GoogleFonts.inconsolata(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Flexible(
                                      child: Text(
                                        args[1],
                                        style: GoogleFonts.inconsolata(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                  ),
                );
              },
            )));
  }
}
