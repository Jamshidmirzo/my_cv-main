import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_cv/ui/screens/contact_screen.dart';
import 'package:my_cv/ui/screens/experience_screen.dart';
import 'package:my_cv/ui/widgets/custom_drawer_widget.dart';
import 'package:my_cv/ui/widgets/pdf_button_widget.dart';
import 'package:my_cv/ui/widgets/share_screen_widget.dart';
import 'package:screenshot/screenshot.dart';

class AcademicScreen extends StatefulWidget {
  const AcademicScreen({super.key});

  @override
  State<AcademicScreen> createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {
  int _currentStep = 0;
  final ScreenshotController screenshotController = ScreenshotController();

  List<Step> _getSteps() {
    return [
      Step(
        title: Text(
          'Graduate',
          style: GoogleFonts.montserrat(),
        ),
        subtitle: Text(
          'MFFIFUDUM',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'The best school in Tash',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Gap(5.h),
            Row(
              children: [
                Text(
                  'Year 2022',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text(
          'Graduate',
          style: GoogleFonts.montserrat(),
        ),
        subtitle: Text(
          'Inxa',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Universidad Pontificia de\nSalamanca',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Gap(5.h),
            Row(
              children: [
                Text(
                  'Year 2020',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text(
          'Graduate',
          style: GoogleFonts.montserrat(),
        ),
        subtitle: Text(
          'JOURNALISM',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Universidad Pontificia de\nSalamanca',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Gap(5.h),
            Row(
              children: [
                Text(
                  'Year 2020',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        isActive: _currentStep >= 2,
      ),
      Step(
        title: Text(
          'Graduate',
          style: GoogleFonts.montserrat(),
        ),
        subtitle: Text(
          'Opercoder',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Universidad Pontificia de\nSalamanca',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Gap(5.h),
            Row(
              children: [
                Text(
                  'Year 2020',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        isActive: _currentStep >= 3,
      ),
    ];
  }

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
                        "Academic backgr.",
                        style: GoogleFonts.orelegaOne(
                          fontSize: 30.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stepper(
                    steps: _getSteps(),
                    currentStep: _currentStep,
                    onStepTapped: (step) {
                      setState(() {
                        _currentStep = step;
                      });
                    },
                    controlsBuilder:
                        (BuildContext context, ControlsDetails details) {
                      return const SizedBox.shrink();
                    },
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
                      return const ExperienceScreen();
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
