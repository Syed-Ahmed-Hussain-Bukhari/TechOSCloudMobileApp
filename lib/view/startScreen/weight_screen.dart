import 'package:etech_cricket_app/view/startScreen/height_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';

class WeightController extends GetxController {
  var isKg = true.obs;
  var weight = 75.0.obs;
}

class WeightScreen extends StatelessWidget {
  const WeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();
    final controller = Get.put(WeightController());

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
              "What Is Your Weight?",
              style: GoogleFonts.poppins(
                fontSize: size.customWidth(context) / 15,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: size.customHeight(context) * 0.01),
            Text(
              "Please select your weight using the scale below.",
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
                    _unitToggle(context, 'KG', controller.isKg.value, () => controller.isKg.value = true),
                    SizedBox(width: size.customWidth(context) * 0.03),
                    _unitToggle(context, 'LB', !controller.isKg.value, () => controller.isKg.value = false),
                  ],
                )),
            SizedBox(height: size.customHeight(context) * 0.04),
            _weightSlider(context, controller), // ✅ Not wrapped in Obx here
            SizedBox(height: size.customHeight(context) * 0.03),
            Obx(() => Center(
              child: Text(
                    "${controller.weight.value.toStringAsFixed(0)} ${controller.isKg.value ? 'KG' : 'LB'}",
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
                      print("Selected Weight: ${controller.weight.value.toStringAsFixed(1)} ${controller.isKg.value ? 'KG' : 'LB'}");
                      // Navigate or store weight if needed
                      Get.to(HeightScreen());
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

  Widget _weightSlider(BuildContext context, WeightController controller) {
    return Obx(() => SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbColor: AppColors.primaryColor,
            activeTrackColor: AppColors.primaryColor,
            inactiveTrackColor: Colors.grey,
            trackHeight: 2,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
          ),
          child: Slider(
            min: 30,
            max: 150,
            divisions: 120,
            value: controller.weight.value,
            onChanged: (value) {
              controller.weight.value = value;
            },
          ),
        ));
  }
}
