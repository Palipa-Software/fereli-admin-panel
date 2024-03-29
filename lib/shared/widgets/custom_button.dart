import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  void Function() func;
  bool isTextButton;
  String title;
  Color? color;
  bool? isAllWidth;
  CustomButton(
      {required this.func,
      required this.isTextButton,
      required this.title,
      this.isAllWidth = false,
      this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return isTextButton
        ? Bounceable(
            onTap: func,
            child: Text(
              title,
              style: GoogleFonts.inconsolata(
                color: AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        : Bounceable(
            onTap: func,
            child: Container(
              padding: EdgeInsets.all(18.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.sp),
                color: color ?? AppColors.oceanNight,
              ),
              width: isAllWidth == false ? 18.w : 100.w,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.inconsolata(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
  }
}
