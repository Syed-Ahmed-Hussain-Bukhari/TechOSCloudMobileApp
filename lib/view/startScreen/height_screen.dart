import 'package:etech_cricket_app/view/startScreen/player_infromation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';

class HeightController extends GetxController {
  var isCm = true.obs;
  var height = 175.0.obs;
}

class HeightScreen extends StatelessWidget {
  const HeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();
    final controller = Get.put(HeightController());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        toolbarHeight: size.customHeight(context) / 10,
        backgroundColor: AppColors.whiteColor,
        leading: Icon(Icons.arrow_back, color: AppColors.primaryColor),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.customWidth(context) * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What Is Your Height?",
              style: GoogleFonts.poppins(
                fontSize: size.customWidth(context) / 15,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: size.customHeight(context) * 0.01),
            Text(
              "Please select your height using the scale below.",
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                fontSize: size.customWidth(context) / 26,
                color: AppColors.greyColor,
              ),
            ),
            SizedBox(height: size.customHeight(context) * 0.04),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _unitToggle(context, 'CM', controller.isCm.value, () {
                  if (!controller.isCm.value) {
                    controller.height.value = (controller.height.value * 2.54).clamp(100.0, 220.0);
                    controller.isCm.value = true;
                  }
                }),
                SizedBox(width: size.customWidth(context) * 0.03),
                _unitToggle(context, 'IN', !controller.isCm.value, () {
                  if (controller.isCm.value) {
                    controller.height.value = (controller.height.value / 2.54).clamp(39.0, 86.0);
                    controller.isCm.value = false;
                  }
                }),
              ],
            )),
            SizedBox(height: size.customHeight(context) * 0.04),
            _heightSlider(context, controller),
            SizedBox(height: size.customHeight(context) * 0.03),
            Obx(() => Center(
              child: Text(
                _getFormattedHeight(controller.height.value, controller.isCm.value),
                style: GoogleFonts.poppins(
                  fontSize: size.customWidth(context) / 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
            )),
            SizedBox(height: size.customHeight(context) * 0.06),
            Center(
              child: ElevatedButton(
                onPressed: () {
                    final height = controller.height.value;
                    final unit = controller.isCm.value ? "CM" : "IN";
                    print("Selected Height: ${height.toStringAsFixed(1)} $unit");
                    Get.to(PlayerInformationScreen());
                 },

                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: size.customWidth(context) * 0.2,
                    vertical: size.customHeight(context) * 0.02,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.poppins(
                    fontSize: size.customWidth(context) / 22,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _unitToggle(BuildContext context, String label, bool isSelected, VoidCallback onTap) {
    final size = CustomSize();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.customWidth(context) * 0.07,
          vertical: size.customHeight(context) * 0.01,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.grey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: size.customWidth(context) / 25,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }

  Widget _heightSlider(BuildContext context, HeightController controller) {
    return Obx(() => SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbColor: AppColors.primaryColor,
            activeTrackColor: AppColors.primaryColor,
            inactiveTrackColor: Colors.grey,
            trackHeight: 2,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
          ),
          child: Slider(
            min: controller.isCm.value ? 100 : 39,
            max: controller.isCm.value ? 220 : 86,
            divisions: controller.isCm.value ? 120 : 47,
            value: controller.height.value,
            onChanged: (value) {
              controller.height.value = value;
            },
          ),
        ));
  }

  String _getFormattedHeight(double heightValue, bool isCm) {
    if (!isCm) {
      return "${heightValue.toStringAsFixed(0)} IN";
    }

    double totalInches = heightValue / 2.54;
    int feet = totalInches ~/ 12;
    int inches = (totalInches % 12).round();
    return "$feet'${inches}\" (${heightValue.toStringAsFixed(0)} cm)";
  }
}
