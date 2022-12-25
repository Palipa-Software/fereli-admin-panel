import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fereli_admin_panel/modules/complaintsDetail/complaint_detail_screen.dart';
import 'package:fereli_admin_panel/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../shared/constants/constants.dart';
import 'roomTechnicalSupport.dart';

class RoomTechnicalSupportScreen
    extends GetView<RoomTechnicalSupportController> {
  const RoomTechnicalSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppStrings.roomTechSupportTitle,
            style: GoogleFonts.inconsolata(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Padding(
          padding: AppPadding.projectpaddingHorizontal,
          child: StreamBuilder<QuerySnapshot>(
            stream: controller.stream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      return Bounceable(
                        onTap: () {
                          Get.to(ComplaintDetailScreen(isRoomTech: true),
                              arguments: [
                                snapshot.data?.docs[index]["nameSurname"],
                                snapshot.data?.docs[index]["email"],
                                snapshot.data?.docs[index]
                                    ["subjectOfComplaint"],
                                snapshot.data?.docs[index]["complaintText"],
                                snapshot.data?.docs[index]["roomInfo"],
                                AppStrings.roomTechSupportTitle
                              ]);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 2.h),
                          padding: AppPadding.projectPadding,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(
                              color: AppColors.white,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  snapshot
                                      .data?.docs[index]["subjectOfComplaint"]
                                      .toUpperCase(),
                                  style: GoogleFonts.inconsolata(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              CustomButton(
                                func: () {
                                  controller.roomTechnicalSupportComplaint
                                      .doc(snapshot.data?.docs[index].id
                                          .toString())
                                      .delete();
                                },
                                isTextButton: false,
                                title: "SİL",
                                color: AppColors.lakeView,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.white,
                ),
              );
            },
          ),
        ));
  }
}
