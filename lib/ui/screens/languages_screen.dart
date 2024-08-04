import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_cv/ui/screens/contact_screen.dart';
import 'package:my_cv/ui/widgets/custom_drawer_widget.dart';
import 'package:my_cv/ui/widgets/pdf_button_widget.dart';
import 'package:my_cv/ui/widgets/share_screen_widget.dart';
import 'package:screenshot/screenshot.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
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
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20.w),
                  child: Row(
                    children: [
                      Text(
                        "Languages",
                        style: GoogleFonts.orelegaOne(
                          fontSize: 30.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: SvgPicture.asset("assets/icons/uzb.svg"),
                      ),
                      Gap(10.w),
                      Text(
                        "Uzbek",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: SvgPicture.asset("assets/icons/eng.svg"),
                      ),
                      Gap(10.w),
                      Text(
                        "English",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                      return const ContactScreen();
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
