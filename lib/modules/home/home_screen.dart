import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../shared/constants/constants.dart';
import 'home.dart';

class HomeScreen extends GetView<HomeScreenController> {
  HomeScreen({super.key});

  List<String> menu = [
    "Duyurular",
    "Yemek Listesi",
    "Dilek/Öneri",
    "Oda Teknik Destek",
    "Anketler",
    "Etkinlikler",
    "Giriş Sorunu"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.appTitle,
          style: GoogleFonts.inconsolata(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: AppPadding.projectPadding,
        child: GridView.builder(
          itemCount: menu.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 3.h,
            mainAxisSpacing: 5.w,
          ),
          itemBuilder: (context, index) {
            return Bounceable(
              onTap: () {
                controller.pageRoute(menu, index);
              },
              child: Container(
                padding: AppPadding.projectPadding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  border: Border.all(
                    color: AppColors.white,
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      menu[index],
                      style: GoogleFonts.inconsolata(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
