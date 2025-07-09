import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:etech_cricket_app/routes/app_routes.dart';
import 'package:etech_cricket_app/view/player/home_screen/player_uploaded_video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
           padding: EdgeInsets.all(size.customHeight(context) * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Container(
                  margin:EdgeInsets.only(top:size.customHeight(context) * 0.08),
                  child: Text(
                    'Tell us About You!',
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.06,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                  
                    ),
                  ),
                ), 
          
                SizedBox(height: size.customHeight(context) * 0.005),
                Text(
                  'Please choose an option from below',
                  style: GoogleFonts.poppins(
                    fontSize: size.customWidth(context) * 0.04,
                    // fontWeight: FontWeight.bold,
                    color: AppColors.greyColor,
                
                  ),
                ), 
                SizedBox(height: size.customHeight(context) * 0.05),
                GestureDetector(
                    onTap: (){
                     Get.to(PlayerHomeScreen());
                  },
                  child: Card(elevation: 5,
                  child:Container(
                    padding: EdgeInsets.all(size.customHeight(context) * 0.05),
                     decoration: BoxDecoration(
                      border: Border.all(
                        width: size.customHeight(context) * 0.001,
                        color: AppColors.primaryColor
                      ),
                      borderRadius: BorderRadius.circular(size.customHeight(context) * 0.01)
                     ),
                    child: Center(
                      child: Column(
                        children: [
                            Text(
                    "I'm a Player",
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.04,
                      // fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                  
                    ),),
                     Center(
                  child: Image.asset(
                    'assets/cricket-player.png',
                    height: size.customHeight(context) * 0.15,
                    width: size.customWidth(context) * 0.18,
                    // color: AppColors.primaryColor,
                  ),
                                ),
                        ],
                      ),
                    ),
                  ) ,
                  ),
                ),
 
                 SizedBox(height: size.customHeight(context) * 0.05),
                 GestureDetector(
                  onTap: (){
                      Get.toNamed(AppRoutes.coach);
                  },
                   child: Card(elevation: 5,
                                   child:Container(
                    padding: EdgeInsets.all(size.customHeight(context) * 0.05),
                     decoration: BoxDecoration(
                      border: Border.all(
                        width: size.customHeight(context) * 0.001,
                        color: AppColors.primaryColor
                      ),
                      borderRadius: BorderRadius.circular(size.customHeight(context) * 0.01)
                     ),
                    child: Center(
                      child: Column(
                        children: [
                            Text(
                    "I'm a Coach",
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.04,
                      // fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                                   
                    ),),
                     Center(
                                   child: Image.asset(
                    'assets/coach.png',
                    height: size.customHeight(context) * 0.18,
                    width: size.customWidth(context) * 0.20,
                    // color: AppColors.primaryColor,
                                   ),
                                 ),
                        ],
                      ),
                    ),
                                   ) ,
                                   ),
                 )

            ],
          ),
        ),
      ),
    );
  }
}