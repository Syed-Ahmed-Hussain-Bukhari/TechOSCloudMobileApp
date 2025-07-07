import 'package:etech_cricket_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:etech_cricket_app/components/playerDrawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
     appBar: AppBar(
      automaticallyImplyLeading:false,
  backgroundColor: Colors.transparent,
  elevation: 0,
  centerTitle: true,
  title: Text(
    "profile",
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

      body: Padding(
        padding: EdgeInsets.all(size.customHeight(context) * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
             // Profile Image with Responsive Edit Icon
          Center(
            child: Stack(
              children: [
                CircleAvatar(
          radius: size.customHeight(context) * 0.08,
          backgroundImage: const AssetImage('assets/userpicture.jpg'),
                ),
                Positioned(
          bottom: size.customHeight(context) * 0.001,
          right: size.customWidth(context) * 0.001,
          child: GestureDetector(
            onTap: () {
            Get.toNamed(AppRoutes.editProfileScreen);
            },
            child: Container(
              padding: EdgeInsets.all(size.customWidth(context) * 0.015),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: size.customWidth(context) * 0.007,
                ),
              ),
              child: Icon(
                Icons.edit,
                size: size.customWidth(context) * 0.045,
                color: Colors.white,
              ),
            ),
          ),
                ),
              ],
            ),
          ),
          
              SizedBox(height: size.customHeight(context) * 0.01),
          
              // Name
              Center(
                child: Text(
                  "Syed Ahmed",
                  style: GoogleFonts.poppins(
                    fontSize: size.customWidth(context) * 0.055,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              // SizedBox(height: size.customHeight(context) * 0.005),
          
              // Email
              Center(
                child: Text(
                  "syed@example.com",
                  style: GoogleFonts.poppins(
                    fontSize: size.customWidth(context) * 0.04,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              SizedBox(height: size.customHeight(context) * 0.04),
          
              // Profile Info Card
              Card(
                elevation: 4,
               
                child: Padding(
                  padding: EdgeInsets.all(size.customHeight(context) * 0.02),
                  child: Container(
                     padding: EdgeInsets.all(size.customHeight(context) * 0.05),
                       decoration: BoxDecoration(
                        border: Border.all(
                          width: size.customHeight(context) * 0.001,
                          color: AppColors.primaryColor
                        ),
                        borderRadius: BorderRadius.circular(size.customHeight(context) * 0.01)
                       ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow(context, "Phone", "+92 300 1234567"),
                        _buildInfoRow(context, "Location", "Lahore, Pakistan"),
                        _buildInfoRow(context, "Member Since", "Jan 2024"),
                        _buildInfoRow(context, "Batting Hand", "Right"),
                        _buildInfoRow(context, "Age", "21"),
                        _buildInfoRow(context, "Gender", "Male"),
                        _buildInfoRow(context, "Height", "5'9\" (175 cm)"),
                        _buildInfoRow(context, "Weight", "70 kg"),
                        _buildInfoRow(context, "Fitness Level", "Fit"),
          
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String title, String value) {
    final size = CustomSize();
    return Padding(
      padding: EdgeInsets.only(bottom: size.customHeight(context) * 0.015),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: GoogleFonts.poppins(
              fontSize: size.customWidth(context) * 0.045,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: size.customWidth(context) * 0.042,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
