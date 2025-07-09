import 'package:etech_cricket_app/components/customButton.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:etech_cricket_app/routes/app_routes.dart';
import 'package:etech_cricket_app/view/player/home_screen/player_uploaded_video.dart';
import 'package:etech_cricket_app/view/player/home_screen/playerVideos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';

class CoachDrawermenu extends StatelessWidget {
  const CoachDrawermenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.whiteColor,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            accountName: Text(
              'Syed Ahmed',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            accountEmail: Text(
              'asyedhmed@gmail.com',
              style: GoogleFonts.poppins(),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/userpicture.jpg'), // Replace with your image path
            ),
          ),

          /// Menu Options
         Expanded(
  child: ListView(
    children: [
      ListTile(
        leading: const Icon(Icons.home, color: AppColors.primaryColor),
        title: Text('Home', style: GoogleFonts.poppins()),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16), // Right arrow
        onTap: () {
       
        },
      ),
      ListTile(
        leading: const Icon(Icons.person, color: AppColors.primaryColor),
        title: Text('Profile', style: GoogleFonts.poppins()),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
            Get.toNamed(AppRoutes.profileScreen);
        },
      ),
      ListTile(
        leading: const Icon(Icons.dashboard, color: AppColors.primaryColor),
        title: Text('Coach Dashboard', style: GoogleFonts.poppins()),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
           Get.toNamed(AppRoutes.coachDashboardScreen);
        },
      ),
       ListTile(
        leading: const Icon(Icons.video_camera_front, color: AppColors.primaryColor),
        title: Text("Add Player Video's", style: GoogleFonts.poppins()),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Get.to(PlayerHomeScreen());
        },
      ),

      ListTile(
        leading: const Icon(Icons.videocam, color: AppColors.primaryColor),
        title: Text("Player Video's", style: GoogleFonts.poppins()),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Get.to(PlayerVideosScreen());
        },
      ),
    ],
  ),
),


          /// Logout Option
         Container(
          margin: EdgeInsets.all(CustomSize().customWidth(context) / 30),
          child:   CustomButton(
                radius: CustomSize().customWidth(context) / 30,
                height: CustomSize().customHeight(context) / 14,
                width: double.infinity,
                title: "Logout",
                onTap: () {
                  Get.toNamed(AppRoutes.login);

                },
                loading: false,
                color: AppColors.primaryColor,
              ),
         )
          
        ],
      ),
    );
  }
}
