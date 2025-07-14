import 'package:etech_cricket_app/view/startScreen/player_roles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:etech_cricket_app/components/customButton.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PlayerPersonalInformationScreen extends StatefulWidget {
  const PlayerPersonalInformationScreen({super.key});

  @override
  State<PlayerPersonalInformationScreen> createState() =>
      _PlayerPersonalInformationScreenState();
}

class _PlayerPersonalInformationScreenState
    extends State<PlayerPersonalInformationScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  String? completePhoneNumber;

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.customHeight(context) * 0.02),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row with Back Button and Centered Title
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: AppColors.primaryColor),
                        onPressed: () => Get.back(),
                      ),
                      const Spacer(),
                      Text(
                        'Complete Your Profile',
                        style: GoogleFonts.poppins(
                          fontSize: size.customWidth(context) * 0.05,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                  SizedBox(height: size.customHeight(context) * 0.02),

                  Text(
                    'Please provide your player information to complete registration.',
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.04,
                      color: AppColors.greyColor,
                    ),
                  ),
                  SizedBox(height: size.customHeight(context) * 0.03),

                  // Name Field
                  TextFormField(
                    controller: nameController,
                    validator: (val) =>
                        val == null || val.trim().isEmpty ? 'Name is required' : null,
                    style: const TextStyle(color: AppColors.blackColor),
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      prefixIcon:
                          const Icon(Icons.person, color: AppColors.blackColor),
                      hintStyle: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: size.customWidth(context) / 28,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: size.customWidth(context) / 65,
                        horizontal: size.customWidth(context) / 30,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(size.customWidth(context) / 15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(size.customWidth(context) / 15),
                        borderSide: const BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(height: size.customHeight(context) * 0.03),

                  // Phone Field
                  IntlPhoneField(
                    controller: phoneController,
                    initialCountryCode: 'PK',
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: size.customWidth(context) / 28,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: size.customWidth(context) / 65,
                        horizontal: size.customWidth(context) / 30,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(size.customWidth(context) / 15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(size.customWidth(context) / 15),
                        borderSide: const BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                    onChanged: (phone) {
                      completePhoneNumber = phone.completeNumber;
                    },
                  ),
                  SizedBox(height: size.customHeight(context) * 0.03),

                  // Address Field
                  TextFormField(
                    controller: addressController,
                    validator: (val) => val == null || val.trim().isEmpty
                        ? 'Address is required'
                        : null,
                    style: const TextStyle(color: AppColors.blackColor),
                    decoration: InputDecoration(
                      hintText: 'Address',
                      prefixIcon: const Icon(Icons.location_on,
                          color: AppColors.blackColor),
                      hintStyle: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: size.customWidth(context) / 28,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: size.customWidth(context) / 65,
                        horizontal: size.customWidth(context) / 30,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(size.customWidth(context) / 15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(size.customWidth(context) / 15),
                        borderSide:
                            const BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(height: size.customHeight(context) * 0.1),

                  // Submit Button
                  CustomButton(
                    title: "Continue",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        if (completePhoneNumber == null ||
                            completePhoneNumber!.isEmpty) {
                          Get.snackbar(
                            "Validation Error",
                            "Phone number is required",
                            backgroundColor: Colors.red.withOpacity(0.9),
                            colorText: Colors.white,
                          );
                          return;
                        }

                        print("Name: ${nameController.text}");
                        print("Phone: $completePhoneNumber");
                        print("Address: ${addressController.text}");

                        Get.snackbar(
                          "Success",
                          "Information submitted successfully!",
                          backgroundColor: Colors.green.withOpacity(0.9),
                          colorText: Colors.white,
                        );

                        Get.to(PlayerSelectionScreen());
                      }
                    },
                    radius: size.customWidth(context) / 30,
                    height: size.customHeight(context) / 14,
                    width: double.infinity,
                    color: AppColors.primaryColor,
                    loading: false,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
