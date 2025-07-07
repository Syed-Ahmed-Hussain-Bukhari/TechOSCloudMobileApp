import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var selectedImage = Rx<File?>(null);
  var selectedBatting = 'Right'.obs;
  var selectedFitness = 'Fit'.obs;
  var selectedGender = 'Male'.obs;
  var age = 18.obs;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }
}



class PlayerInformationScreen extends StatelessWidget {
  const PlayerInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        toolbarHeight: size.customHeight(context) / 10,
        leading: Icon(Icons.arrow_back, color: AppColors.primaryColor),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(size.customHeight(context) * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please fill your player information",
              style: GoogleFonts.poppins(
                fontSize: size.customWidth(context) / 22,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: size.customHeight(context) * 0.005),
            Text(
              "This helps us personalize your cricket experience",
              style: GoogleFonts.poppins(
                fontSize: size.customWidth(context) / 30,
                color: AppColors.greyColor,
              ),
            ),
            SizedBox(height: size.customHeight(context) * 0.04),

            // Profile Image Picker
            Center(
              child: Stack(
                children: [
                  Obx(() => CircleAvatar(
                        radius: size.customHeight(context) * 0.08,
                        backgroundImage: controller.selectedImage.value != null
                            ? FileImage(controller.selectedImage.value!)
                            : const AssetImage('assets/userpicture.jpg') as ImageProvider,
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: controller.pickImage,
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
                          Icons.image,
                          size: size.customWidth(context) * 0.045,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: size.customHeight(context) * 0.04),
            _buildDropdown(context, 'Batting Hand', controller.selectedBatting, ['Right', 'Left']),
            _buildDropdown(context, 'Fitness Level', controller.selectedFitness, ['Fit', 'Moderate', 'Injury Prone']),
            _buildDropdown(context, 'Gender', controller.selectedGender, ['Male', 'Female']),
            _buildAgeSelector(context, controller),

            SizedBox(height: size.customHeight(context) * 0.04),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Proceed or Save
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
            SizedBox(height: size.customHeight(context) * 0.05),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(BuildContext context, String title, RxString selectedValue, List<String> options) {
    final size = CustomSize();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.customHeight(context) * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: size.customWidth(context) / 24,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(height: size.customHeight(context) * 0.008),
          Obx(() => Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedValue.value,
                    icon: Icon(Icons.arrow_drop_down, color: AppColors.primaryColor),
                    isExpanded: true,
                    items: options
                        .map((option) => DropdownMenuItem(
                              value: option,
                              child: Row(
                                children: [
                                  Icon(
                                    selectedValue.value == option ? Icons.check_circle : Icons.circle_outlined,
                                    color: AppColors.primaryColor,
                                    size: size.customWidth(context) * 0.045,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    option,
                                    style: GoogleFonts.poppins(
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                    onChanged: (val) {
                      if (val != null) selectedValue.value = val;
                    },
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildAgeSelector(BuildContext context, ProfileController controller) {
    final size = CustomSize();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.customHeight(context) * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Age",
            style: GoogleFonts.poppins(
              fontSize: size.customWidth(context) / 24,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(height: size.customHeight(context) * 0.008),
          Obx(() => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // TextField to enter age
                    Expanded(
                      child: TextFormField(
                        key: ValueKey(controller.age.value), // avoid rebuild issues
                        initialValue: controller.age.value.toString(),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          final intVal = int.tryParse(value);
                          if (intVal != null && intVal > 0) {
                            controller.age.value = intVal;
                          }
                        },
                        decoration: const InputDecoration(border: InputBorder.none),
                        style: GoogleFonts.poppins(
                          color: AppColors.blackColor,
                          fontSize: size.customWidth(context) / 26,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline, color: AppColors.primaryColor),
                          onPressed: () {
                            if (controller.age.value > 1) controller.age.value--;
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline, color: AppColors.primaryColor),
                          onPressed: () {
                            controller.age.value++;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
