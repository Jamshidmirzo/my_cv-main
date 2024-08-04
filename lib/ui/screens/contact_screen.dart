import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_cv/ui/screens/home_screen.dart';
import 'package:my_cv/ui/widgets/custom_drawer_widget.dart';
import 'package:my_cv/ui/widgets/pdf_button_widget.dart';
import 'package:my_cv/ui/widgets/share_screen_widget.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final ScreenshotController screenshotController = ScreenshotController();

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("The page could not be found."),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
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
                        "Contact",
                        style: GoogleFonts.orelegaOne(
                          fontSize: 30.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(30.h),
                Text(
                  "Hello! I am based in Culleredo, Galiza\n(Spain) and there are plenty of ways to\nget in touch with me:",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 40.h),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: SvgPicture.asset("assets/icons/phone.svg"),
                      ),
                      Gap(10.w),
                      Text(
                        "(+998) 95-555-47-27",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.w, top: 20.h),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: SvgPicture.asset("assets/icons/email.svg"),
                      ),
                      Gap(10.w),
                      Text(
                        "flutterforeveruz@gmail.com",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.w, top: 40.h, right: 50.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            _launchUrl("https://instagram.com/shokhtime07"),
                        child: SvgPicture.asset("assets/icons/instagram.svg"),
                      ),
                      GestureDetector(
                        onTap: () => _launchUrl("https://t.me/I_am_Dasturshik"),
                        child: SvgPicture.asset("assets/icons/telegram.svg"),
                      ),
                      GestureDetector(
                        onTap: () => _launchUrl(
                            "https://linkedin.com/in/shokhrukh-rasulov"),
                        child: SvgPicture.asset("assets/icons/linkedin.svg"),
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
                      return const HomeScreen();
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
                      "Home",
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No Page"),
                    ),
                  );
                },
                backgroundColor: Colors.amber[50],
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
