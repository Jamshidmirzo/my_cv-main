import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 30),
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: SvgPicture.asset("assets/icons/dart.svg"),
              ),
              Gap(10.w),
              Text(
                "Dart",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: SvgPicture.asset("assets/icons/python.svg"),
              ),
              Gap(10.w),
              Text(
                "Python",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: SvgPicture.asset("assets/icons/flutter.svg"),
              ),
              Gap(10.w),
              Text(
                "Flutter",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: SvgPicture.asset("assets/icons/vs-code.svg"),
              ),
              Gap(10.w),
              Text(
                "Vs Code",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: SvgPicture.asset("assets/icons/figma.svg"),
              ),
              Gap(10.w),
              Text(
                "Figma",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
