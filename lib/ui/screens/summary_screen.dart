import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_cv/ui/screens/academic_screen.dart';
import 'package:my_cv/ui/screens/contact_screen.dart';
import 'package:my_cv/ui/widgets/custom_drawer_widget.dart';
import 'package:my_cv/ui/widgets/pdf_button_widget.dart';
import 'package:my_cv/ui/widgets/share_screen_widget.dart';
import 'package:screenshot/screenshot.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawerWidget(),
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 10,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () async {
              final image = await screenshotController.capture();
              if (image != null) {
                await shareScreenshot(image);
              }
              setState(() {});
            },
            icon: const Icon(Icons.screenshot),
          ),
          const PdfButtonWidget(),
        ],
      ),
      body: Screenshot(
        controller: screenshotController,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, left: 20.w),
                    child: Row(
                      children: [
                        Text(
                          "Summary",
                          style: GoogleFonts.orelegaOne(
                            fontSize: 30.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(20.h),
                  Column(
                    children: [
                      Center(
                        child:
                            SvgPicture.asset("assets/icons/summary_skils.svg"),
                      ),
                      Gap(10.h),
                      Text(
                        "Polivalent",
                        style: GoogleFonts.orelegaOne(
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Plenty of skills around\ncommunication, media, web and\nadvertising.",
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  Gap(40.h),
                  Column(
                    children: [
                      Center(
                        child:
                            SvgPicture.asset("assets/icons/summary_skils.svg"),
                      ),
                      Gap(10.h),
                      Text(
                        "Polivalent",
                        style: GoogleFonts.orelegaOne(
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Plenty of skills around\ncommunication, media, web and\nadvertising.",
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  Gap(40.h),
                  Column(
                    children: [
                      Center(
                        child:
                            SvgPicture.asset("assets/icons/summary_skils.svg"),
                      ),
                      Gap(10.h),
                      Text(
                        "Polivalent",
                        style: GoogleFonts.orelegaOne(
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Plenty of skills around\ncommunication, media, web and\nadvertising.",
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  Gap(40.h),
                  Column(
                    children: [
                      Center(
                        child:
                            SvgPicture.asset("assets/icons/summary_skils.svg"),
                      ),
                      Gap(10.h),
                      Text(
                        "Polivalent",
                        style: GoogleFonts.orelegaOne(
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Plenty of skills around\ncommunication, media, web and\nadvertising.",
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  Gap(80.h),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              left: 130,
              right: 130,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      return const ContactScreen();
                    },
                  ));
                },
                child: Container(
                  width: 98,
                  height: 39,
                  decoration: BoxDecoration(
                    color: Colors.amber[200],
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0xff000072),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Contact",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xff000072),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 30,
              child: FloatingActionButton(
                onPressed: () => Navigator.pop(context),
                backgroundColor: Colors.amber[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: const Center(
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
            Positioned(
              right: 30,
              bottom: 20,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      return const AcademicScreen();
                    },
                  ));
                },
                backgroundColor: Colors.amber[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: const Center(
                  child: Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
