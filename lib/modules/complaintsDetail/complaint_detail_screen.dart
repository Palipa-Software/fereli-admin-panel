import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fereli_admin_panel/modules/complaintsDetail/complaintDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../shared/constants/constants.dart';

class ComplaintDetailScreen extends GetView<ComplaintDetailController> {
  bool? isRoomTech;
  bool? isLoginComplaint;
  ComplaintDetailScreen(
      {super.key, this.isRoomTech = false, this.isLoginComplaint = false});

  ComplaintDetailController complaintDetailController =
      Get.put(ComplaintDetailController());

  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            isLoginComplaint == true
                ? args[4]
                : isRoomTech == true
                    ? args[5]
                    : args[4],
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
                return Bounceable(
                  onTap: () {},
                  child: Container(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  "Adı Soyadı: ${args[0].toString().capitalize}",
                                  style: GoogleFonts.inconsolata(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Flexible(
                                child: Text(
                                  isLoginComplaint == true
                                      ? "Telefon No: ${args[1]}"
                                      : "E-mail: ${args[1]}",
                                  style: GoogleFonts.inconsolata(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              isLoginComplaint == true
                                  ? Flexible(
                                      child: Text(
                                        "Oda Bilgisi: ${args[3]}",
                                        style: GoogleFonts.inconsolata(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    )
                                  : isRoomTech == true
                                      ? Flexible(
                                          child: Text(
                                            "Oda Bilgisi: ${args[4]}",
                                            style: GoogleFonts.inconsolata(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Flexible(
                                child: Text(
                                  args[2].toUpperCase(),
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
                                  isLoginComplaint == true ? "" : args[3],
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
                  ),
                );
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
