import 'package:etech_cricket_app/components/coachDrawer.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

class CoachScreen extends StatelessWidget {
  const CoachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
       endDrawer: const CoachDrawermenu(),
     appBar: AppBar(
      automaticallyImplyLeading:false,
  backgroundColor: Colors.transparent,

  elevation: 0,
  centerTitle: true,
    actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: AppColors.whiteColor),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
  title: Text(
    "Coach",
    style: GoogleFonts.poppins(
      fontSize: size.customWidth(context) * 0.05,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    ),
  ),
  flexibleSpace: Container(
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(size.customWidth(context) * 0.02),
        bottomRight: Radius.circular(size.customWidth(context) * 0.03),
      ),
    ),
  ),
),

      body:Padding(
          padding: EdgeInsets.all(size.customHeight(context) * 0.02),
        child: Column(
          children: [
              SizedBox(height: size.customHeight(context) * 0.05),
                GestureDetector(
  onTap: () {
    // Get.toNamed(AppRoutes.home);
  },
  child: Card(
    elevation: 5,
    child: Container(
       padding: EdgeInsets.only(left:size.customHeight(context) * 0.02,top:size.customHeight(context) * 0.05),      
      decoration: BoxDecoration(
        border: Border.all(
          width: size.customHeight(context) * 0.001,
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(
          size.customHeight(context) * 0.01,
        ),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image on the left
              Container(
               
                margin: EdgeInsets.only(
                  bottom: size.customHeight(context) * 0.05,
                ),
                padding: EdgeInsets.only(left: size.customHeight(context) * 0.01,right: size.customHeight(context) * 0.01,top: size.customHeight(context) * 0.03,bottom: size.customHeight(context) * 0.03),
                decoration: BoxDecoration(
                  color: AppColors.yellowColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(
                    size.customHeight(context) * 0.02,
                  ),
                ),
                child: Image.asset(
                  'assets/add_player.png',
                  height: size.customHeight(context) * 0.16,
                  width: size.customWidth(context) * 0.21,
                ),
              ),
              SizedBox(width: size.customWidth(context) * 0.04),
              
              // Texts on the right
              Expanded(
                child: Container(
                   margin: EdgeInsets.only(
                  bottom: size.customHeight(context) * 0.05,
                ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add Player",
                        style: GoogleFonts.poppins(
                          fontSize: size.customWidth(context) * 0.05,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: size.customHeight(context) * 0.005),
                      Text(
                        "Add a player to monitor their performance and provide personalized guidance",
                        style: GoogleFonts.poppins(
                          fontSize: size.customWidth(context) * 0.037,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Bottom right press-hand icon
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(left: size.customHeight(context) * 0.015,right: size.customHeight(context) * 0.015,top: size.customHeight(context) * 0.01,bottom: size.customHeight(context) * 0.01),
                decoration: BoxDecoration(
                  color: AppColors.yellowColor.withOpacity(0.7),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(size.customHeight(context) * 0.01,))
                
                ),
              child: Icon(
                Icons.add,
                size: size.customWidth(context) * 0.08,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

                   SizedBox(height: size.customHeight(context) * 0.05),
                  GestureDetector(
  onTap: () {
    // Get.toNamed(AppRoutes.home);
  },
  child: Card(
    elevation: 5,
    child: Container(
      padding: EdgeInsets.only(
        left: size.customHeight(context) * 0.02,
        top: size.customHeight(context) * 0.05,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: size.customHeight(context) * 0.001,
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(
          size.customHeight(context) * 0.01,
        ),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Rounded rectangle image container
              Container(
                margin: EdgeInsets.only(
                  bottom: size.customHeight(context) * 0.05,
                ),
                padding: EdgeInsets.only(left: size.customHeight(context) * 0.015,right: size.customHeight(context) * 0.015,top: size.customHeight(context) * 0.04,bottom: size.customHeight(context) * 0.04),
                decoration: BoxDecoration(
                  color: AppColors.yellowColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(
                    size.customHeight(context) * 0.02,
                  ),
                ),
                child: Image.asset(
                  'assets/add_nets.png',
                  height: size.customHeight(context) * 0.12,
                  width: size.customWidth(context) * 0.20,
                ),
              ),
              SizedBox(width: size.customWidth(context) * 0.04),

              // Text column
              Expanded(
                child: Container(
                   margin: EdgeInsets.only(
                  bottom: size.customHeight(context) * 0.02,
                ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add Nets",
                        style: GoogleFonts.poppins(
                          fontSize: size.customWidth(context) * 0.05,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: size.customHeight(context) * 0.005),
                      Text(
                        
                        "Nets orientation help in capturing your swing data accuratly",
                        style: GoogleFonts.poppins(
                          fontSize: size.customWidth(context) * 0.037,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Bottom-right hand press icon
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(left: size.customHeight(context) * 0.015,right: size.customHeight(context) * 0.015,top: size.customHeight(context) * 0.01,bottom: size.customHeight(context) * 0.01),
                decoration: BoxDecoration(
                  color: AppColors.yellowColor.withOpacity(0.7),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(size.customHeight(context) * 0.01,))
                
                ),
              child: Icon(
                Icons.add,
                size: size.customWidth(context) * 0.08,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

                
          ],
        ),
      ),
    );
  }
}