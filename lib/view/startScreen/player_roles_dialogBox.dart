import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';


class ExpertiseSelectionDialog extends StatefulWidget {
  const ExpertiseSelectionDialog({super.key});

  @override
  State<ExpertiseSelectionDialog> createState() => _ExpertiseSelectionDialogState();
}

class _ExpertiseSelectionDialogState extends State<ExpertiseSelectionDialog> {
  String? selectedExpertise; // To track the selected option

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();

    return AlertDialog(
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor, // Ensures white background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size.customHeight(context) * 0.02), // Match screenshot's rounded corners
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: size.customWidth(context) * 0.1,
        vertical: size.customHeight(context) * 0.05,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min, // Dialog takes minimum vertical space
        children: [
          Text(
            'Select Your Expertise',
            style: GoogleFonts.poppins(
              fontSize: size.customWidth(context) * 0.05,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
                  decorationThickness: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.customHeight(context) * 0.04), // Space after title

          // Batsman Option
          _buildExpertiseOption(
            context,
            text: 'Batsman',
            optionValue: 'batsman',
            selectedOption: selectedExpertise,
            size: size,
            onTap: () {
              setState(() {
                selectedExpertise = 'batsman';
              });
              // Optionally close dialog and return value immediately upon selection
              // Get.back(result: 'batsman');
            },
          ),
          SizedBox(height: size.customHeight(context) * 0.02), // Spacing between options

          // Bowler Option
          _buildExpertiseOption(
            context,
            text: 'Bowler',
            optionValue: 'bowler',
            selectedOption: selectedExpertise,
            size: size,
            onTap: () {
              setState(() {
                selectedExpertise = 'bowler';
              });
              // Get.back(result: 'bowler');
            },
          ),
          SizedBox(height: size.customHeight(context) * 0.02),

          // All Rounder Option
          _buildExpertiseOption(
            context,
            text: 'All Rounder',
            optionValue: 'allRounder',
            selectedOption: selectedExpertise,
            size: size,
            onTap: () {
              setState(() {
                selectedExpertise = 'allRounder';
              });
              // Get.back(result: 'allRounder');
            },
          ),
          SizedBox(height: size.customHeight(context) * 0.03), // Space before 'Done' button if you add one

          // You might want a 'Done' or 'Continue' button here,
          // as per typical dialog patterns, even if not in the small screenshot.
          // For now, I'll add a simple button to demonstrate closing and returning a value.
          if (selectedExpertise != null)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.back(result: selectedExpertise); // Close dialog and return selected value
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
                  ),
                  elevation: 3,
                  padding: EdgeInsets.symmetric(vertical: size.customHeight(context) * 0.015),
                ),
                child: Text(
                  'Done',
                  style: GoogleFonts.poppins(
                    fontSize: size.customWidth(context) * 0.04,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Reusable widget for building each expertise option button (same as before)
  Widget _buildExpertiseOption(
    BuildContext context, {
    required String text,
    required String optionValue,
    required String? selectedOption,
    required CustomSize size,
    required VoidCallback onTap,
  }) {
    bool isSelected = selectedOption == optionValue;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.customWidth(context) * 0.55, // Adjusted width for dialog context
        padding: EdgeInsets.symmetric(
          vertical: size.customHeight(context) * 0.015, // Adjusted vertical padding
          horizontal: size.customWidth(context) * 0.05,
        ),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.greyColor.withOpacity(0.5),
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: size.customWidth(context) * 0.045,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColors.primaryColor : AppColors.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}