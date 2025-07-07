import 'package:etech_cricket_app/components/customButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading:false,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.poppins(
            fontSize: size.customWidth(context) * 0.05,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(size.customHeight(context) * 0.02),
        child: Column(
          children: [
            _buildTextField(context, "Full Name", "Syed Ahmed", Icons.person),
            _buildTextField(context, "Email", "syed@example.com", Icons.email),
            _buildTextField(context, "Phone", "+92 300 1234567", Icons.phone),
            _buildTextField(context, "Location", "Lahore, Pakistan", Icons.location_on),
            _buildTextField(context, "Member Since", "Jan 2024", Icons.calendar_month),
            _buildTextField(context, "Batting Hand", "Right", Icons.sports_cricket),
            _buildTextField(context, "Age", "21", Icons.cake),
            _buildTextField(context, "Gender", "Male", Icons.male),
            SizedBox(height: size.customHeight(context) * 0.03),

            CustomButton(
                radius: CustomSize().customWidth(context) / 30,
                height: CustomSize().customHeight(context) / 14,
                width: double.infinity,
                title: "Save Changes",
                onTap: () {
                    // Get.toNamed(AppRoutes.selectionScreen);

                },
                loading: false,
                color: AppColors.primaryColor,
              ),
             SizedBox(height: size.customHeight(context) * 0.04),

          ],
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label, String hint, IconData icon) {
    final size = CustomSize();
    return Padding(
      padding: EdgeInsets.only(bottom: size.customHeight(context) * 0.025),
      child: TextFormField(
        style: const TextStyle(color: AppColors.blackColor),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.poppins(
            color: AppColors.blackColor,
            fontSize: size.customWidth(context) * 0.038,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.customWidth(context) / 15),
          ),
          hintText: hint,
          prefixIcon: Icon(icon, color: AppColors.blackColor),
          hintStyle: TextStyle(
            color: AppColors.blackColor,
            fontSize: size.customWidth(context) / 28,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: size.customWidth(context) / 65,
            horizontal: size.customWidth(context) / 30,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.customWidth(context) / 30),
            borderSide: const BorderSide(color: AppColors.blackColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.customWidth(context) / 15),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
