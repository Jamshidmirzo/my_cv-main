import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_cv/ui/screens/contact_screen.dart';
import 'package:my_cv/ui/screens/languages_screen.dart';
import 'package:my_cv/ui/widgets/custom_drawer_widget.dart';
import 'package:my_cv/ui/widgets/pdf_button_widget.dart';
import 'package:my_cv/ui/widgets/share_screen_widget.dart';
import 'package:my_cv/ui/widgets/skills_widget.dart';
import 'package:screenshot/screenshot.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
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
                        "Skills: Tech",
                        style: GoogleFonts.orelegaOne(
                          fontSize: 30.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                const SkillsWidget(),
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
                      return const LanguagesScreen();
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
