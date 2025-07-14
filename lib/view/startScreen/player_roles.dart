import 'package:etech_cricket_app/view/startScreen/weight_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:get/get.dart';

class PlayerSelectionScreen extends StatefulWidget {
  const PlayerSelectionScreen({super.key});

  @override
  State<PlayerSelectionScreen> createState() => _PlayerSelectionScreenState();
}

class _PlayerSelectionScreenState extends State<PlayerSelectionScreen> {
  String selectedRole = '';

  final List<Map<String, dynamic>> roles = [
    {'title': 'Wicketkeeper', 'icon': Icons.sports_volleyball}, // Glove-like icon
    {'title': 'All-Rounder', 'icon': Icons.star},               // All-round icon
    {'title': 'Batsman', 'icon': Icons.sports_cricket},         // Cricket bat
    {'title': 'Bowler', 'icon': Icons.sports_tennis},           // Ball-related icon
  ];

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(size.customWidth(context) * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button and title
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
                    onPressed: () => Get.back(),
                  ),
                  const Spacer(),
                  Text(
                    'Select Role',
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.055,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
              SizedBox(height: size.customHeight(context) * 0.03),
              Text(
                'Choose Your Player Role',
                style: GoogleFonts.poppins(
                  fontSize: size.customWidth(context) * 0.07,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: size.customHeight(context) * 0.05),

              // Grid of player roles
              Expanded(
                child: GridView.builder(
                  itemCount: roles.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: size.customWidth(context) * 0.04,
                    mainAxisSpacing: size.customHeight(context) * 0.03,
                    childAspectRatio: 3 / 3.2,
                  ),
                  itemBuilder: (context, index) {
                    final role = roles[index];
                    final isSelected = selectedRole == role['title'];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedRole = role['title']!;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? Colors.purple
                                : AppColors.greyColor,
                            width: size.customHeight(context) * 0.003,
                          ),
                          borderRadius: BorderRadius.circular(
                            size.customHeight(context) * 0.02,
                          ),
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              role['icon'],
                              size: size.customHeight(context) * 0.10,
                              color: isSelected
                                  ? Colors.purple
                                  : AppColors.primaryColor,
                            ),
                            SizedBox(height: size.customHeight(context) * 0.015),
                            Text(
                              role['title']!,
                              style: GoogleFonts.poppins(
                                fontSize: size.customWidth(context) * 0.045,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? Colors.purple
                                    : AppColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: size.customHeight(context) * 0.02),

              // Continue button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedRole.isNotEmpty
                      ? () {
                          // Do something with selectedRole
                          print("Selected Role: $selectedRole");
                          Get.to(WeightScreen());
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    disabledBackgroundColor: AppColors.greyColor.withOpacity(0.5),
                    padding: EdgeInsets.symmetric(
                      vertical: size.customHeight(context) * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        size.customHeight(context) * 0.015,
                      ),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.045,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
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
}
