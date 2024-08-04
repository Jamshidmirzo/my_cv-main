import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_cv/ui/screens/academic_screen.dart';
import 'package:my_cv/ui/screens/contact_screen.dart';
import 'package:my_cv/ui/screens/experience_screen.dart';
import 'package:my_cv/ui/screens/home_screen.dart';
import 'package:my_cv/ui/screens/languages_screen.dart';
import 'package:my_cv/ui/screens/skills_screen.dart';
import 'package:my_cv/ui/screens/summary_screen.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber[200],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage("assets/images/ali.png"),
                ),
                Gap(10.h),
                Text(
                  'Shoxruxmirzo CV',
                  style: GoogleFonts.orelegaOne(
                    fontSize: 24,
                    color: const Color(0xff000072),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text('Home', style: GoogleFonts.montserrat()),
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: Text('Contact', style: GoogleFonts.montserrat()),
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) {
                  return const ContactScreen();
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: Text('Summary', style: GoogleFonts.montserrat()),
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) {
                  return const SummaryScreen();
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: Text('Academic', style: GoogleFonts.montserrat()),
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) {
                  return const AcademicScreen();
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.work),
            title: Text('Experience', style: GoogleFonts.montserrat()),
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) {
                  return const ExperienceScreen();
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.build),
            title: Text('Skills', style: GoogleFonts.montserrat()),
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) {
                  return const SkillsScreen();
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text('Languages', style: GoogleFonts.montserrat()),
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) {
                  return const LanguagesScreen();
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: Text('Exit', style: GoogleFonts.montserrat()),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}
