// import 'package:etech_cricket_app/routes/app_routes.dart';
// import 'package:etech_cricket_app/view/player/home_screen/player_uploaded_video%20(2).dart';
// import 'package:etech_cricket_app/view/player/home_screen/player_uploaded_video.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';

// class ProfileController extends GetxController {
//   var selectedImage = Rx<File?>(null);
//   var selectedBatting = 'Right'.obs;
//   var selectedFitness = 'Fit'.obs;
//   var selectedGender = 'Male'.obs;
//   var age = 18.obs;

//   Future<void> pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       selectedImage.value = File(pickedFile.path);
//     }
//   }
// }

// class PlayerInformationScreen extends StatelessWidget {
//   const PlayerInformationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();
//     final controller = Get.put(ProfileController());

//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.whiteColor,
//         elevation: 0,
//         toolbarHeight: size.customHeight(context) / 10,
//         leading: Icon(Icons.arrow_back, color: AppColors.primaryColor),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(size.customHeight(context) * 0.02),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Please fill your player information",
//               style: GoogleFonts.poppins(
//                 fontSize: size.customWidth(context) / 22,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.blackColor,
//               ),
//             ),
//             SizedBox(height: size.customHeight(context) * 0.005),
//             Text(
//               "This helps us personalize your cricket experience",
//               style: GoogleFonts.poppins(
//                 fontSize: size.customWidth(context) / 30,
//                 color: AppColors.greyColor,
//               ),
//             ),
//             SizedBox(height: size.customHeight(context) * 0.04),

//             /// Profile Image Picker
//             Center(
//               child: Stack(
//                 children: [
//                   Obx(() => CircleAvatar(
//                         radius: size.customHeight(context) * 0.08,
//                         backgroundImage: controller.selectedImage.value != null
//                             ? FileImage(controller.selectedImage.value!)
//                             : const AssetImage('assets/userpicture.jpg') as ImageProvider,
//                       )),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: GestureDetector(
//                       onTap: controller.pickImage,
//                       child: Container(
//                         padding: EdgeInsets.all(size.customWidth(context) * 0.015),
//                         decoration: BoxDecoration(
//                           color: AppColors.primaryColor,
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             color: Colors.white,
//                             width: size.customWidth(context) * 0.007,
//                           ),
//                         ),
//                         child: Icon(
//                           Icons.image,
//                           size: size.customWidth(context) * 0.045,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: size.customHeight(context) * 0.04),
//             _buildDropdown(context, 'Batting Hand', controller.selectedBatting, ['Right', 'Left']),
//             _buildDropdown(context, 'Fitness Level', controller.selectedFitness, ['Fit', 'Moderate', 'Injury Prone']),
//             _buildDropdown(context, 'Gender', controller.selectedGender, ['Male', 'Female']),
//             _buildAgeSelector(context, controller),

//             SizedBox(height: size.customHeight(context) * 0.04),

//             /// Continue Button with Validation
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (controller.selectedImage.value == null) {
//                     Get.snackbar(
//                       'Image Required',
//                       'Please select a profile image.',
//                       snackPosition: SnackPosition.BOTTOM,
//                       backgroundColor: Colors.redAccent,
//                       colorText: Colors.white,
//                       margin: const EdgeInsets.all(12),
//                       duration: const Duration(seconds: 2),
//                     );
//                     return;
//                   }

//                   // Proceed with data (for now just print)
//                   print("Selected Batting: ${controller.selectedBatting.value}");
//                   print("Selected Fitness: ${controller.selectedFitness.value}");
//                   print("Selected Gender: ${controller.selectedGender.value}");
//                   print("Age: ${controller.age.value}");
//                   print("Image path: ${controller.selectedImage.value!.path}");

//                   Get.to(MyNewPlayerHomeScreen());
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primaryColor,
//                   padding: EdgeInsets.symmetric(
//                     horizontal: size.customWidth(context) * 0.2,
//                     vertical: size.customHeight(context) * 0.02,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                 ),
//                 child: Text(
//                   'Sumbit',
//                   style: GoogleFonts.poppins(
//                     fontSize: size.customWidth(context) / 22,
//                     color: AppColors.whiteColor,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: size.customHeight(context) * 0.05),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDropdown(BuildContext context, String title, RxString selectedValue, List<String> options) {
//     final size = CustomSize();
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: size.customHeight(context) * 0.015),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               fontSize: size.customWidth(context) / 24,
//               fontWeight: FontWeight.w600,
//               color: AppColors.blackColor,
//             ),
//           ),
//           SizedBox(height: size.customHeight(context) * 0.008),
//           Obx(() => Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: AppColors.greyColor),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton<String>(
//                     value: selectedValue.value,
//                     icon: Icon(Icons.arrow_drop_down, color: AppColors.primaryColor),
//                     isExpanded: true,
//                     items: options
//                         .map((option) => DropdownMenuItem(
//                               value: option,
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     selectedValue.value == option ? Icons.check_circle : Icons.circle_outlined,
//                                     color: AppColors.primaryColor,
//                                     size: size.customWidth(context) * 0.045,
//                                   ),
//                                   const SizedBox(width: 10),
//                                   Text(
//                                     option,
//                                     style: GoogleFonts.poppins(
//                                       color: AppColors.blackColor,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ))
//                         .toList(),
//                     onChanged: (val) {
//                       if (val != null) selectedValue.value = val;
//                     },
//                   ),
//                 ),
//               )),
//         ],
//       ),
//     );
//   }

//   Widget _buildAgeSelector(BuildContext context, ProfileController controller) {
//     final size = CustomSize();
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: size.customHeight(context) * 0.015),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Age",
//             style: GoogleFonts.poppins(
//               fontSize: size.customWidth(context) / 24,
//               fontWeight: FontWeight.w600,
//               color: AppColors.blackColor,
//             ),
//           ),
//           SizedBox(height: size.customHeight(context) * 0.008),
//           Obx(() => Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: AppColors.greyColor),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         key: ValueKey(controller.age.value),
//                         initialValue: controller.age.value.toString(),
//                         keyboardType: TextInputType.number,
//                         onChanged: (value) {
//                           final intVal = int.tryParse(value);
//                           if (intVal != null && intVal > 0) {
//                             controller.age.value = intVal;
//                           }
//                         },
//                         decoration: const InputDecoration(border: InputBorder.none),
//                         style: GoogleFonts.poppins(
//                           color: AppColors.blackColor,
//                           fontSize: size.customWidth(context) / 26,
//                         ),
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.remove_circle_outline, color: AppColors.primaryColor),
//                           onPressed: () {
//                             if (controller.age.value > 1) controller.age.value--;
//                           },
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.add_circle_outline, color: AppColors.primaryColor),
//                           onPressed: () {
//                             controller.age.value++;
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }


import 'package:etech_cricket_app/routes/app_routes.dart'; // Assuming this is defined
import 'package:etech_cricket_app/view/player/home_screen/player_uploaded_video%20(2).dart'; // Assuming this is defined
import 'package:etech_cricket_app/view/player/home_screen/player_uploaded_video.dart'; // Assuming this is defined
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';

class ProfileController extends GetxController {
  var selectedImage = Rx<File?>(null);
  var selectedBatting = 'Right Handed'.obs; // Updated default to match screenshot options
  var selectedFitness = 'Fit'.obs;
  var selectedGender = 'Male'.obs;
  var age = 24.obs; // Updated default age to match screenshot

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
        // Toolbar height adjusted to give space for progress bar and text
        toolbarHeight: size.customHeight(context) * 0.12,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.blackColor, size: size.customHeight(context) * 0.04),
          onPressed: () {
            Get.back();
          },
        ),
        title: Column(
          children: [
            SizedBox(height: size.customHeight(context) * 0.025),
            LinearProgressIndicator(
              value: 5 / 5, // STEP 5/5
              backgroundColor: AppColors.greyColor.withOpacity(0.4),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              minHeight: size.customHeight(context) * 0.01,
            ),
            SizedBox(height: size.customHeight(context) * 0.005),
            Text(
              'STEP 5/5', //
              style: GoogleFonts.poppins(
                fontSize: size.customWidth(context) * 0.035,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          SizedBox(width: size.customWidth(context) * 0.08), // To balance the leading icon space
        ],
      ),
      body: SingleChildScrollView(
        // Adjusted padding to match screenshot's layout
        padding: EdgeInsets.symmetric(horizontal: size.customWidth(context) * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.customHeight(context) * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Basic Details", // Title from "Player Information - 5.png"
                  style: GoogleFonts.poppins(
                    fontSize: size.customWidth(context) * 0.06,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.customHeight(context) * 0.005),
            // Subtitle from "Player Information - 2.png" if needed, but not present in "Player Information - 5.png"
            // Text(
            //   "Please fill your player information", // This text is from previous screen
            //   style: GoogleFonts.poppins(
            //     fontSize: size.customWidth(context) / 30,
            //     color: AppColors.greyColor,
            //   ),
            // ),
            SizedBox(height: size.customHeight(context) * 0.04),

            /// Profile Card (Image, Name, Player Type)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(size.customWidth(context) * 0.04),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(size.customHeight(context) * 0.02),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyColor.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Obx(() => CircleAvatar(
                            radius: size.customHeight(context) * 0.05,
                            backgroundImage: controller.selectedImage.value != null
                                ? FileImage(controller.selectedImage.value!)
                                : const AssetImage('assets/userpicture.jpg') as ImageProvider, // Placeholder for user image
                            backgroundColor: AppColors.greyColor.withOpacity(0.2),
                          )),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: controller.pickImage,
                          child: Container(
                            padding: EdgeInsets.all(size.customWidth(context) * 0.01),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: size.customWidth(context) * 0.005,
                              ),
                            ),
                            child: Icon(
                              Icons.edit, // Edit icon as per design
                              size: size.customWidth(context) * 0.035,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: size.customWidth(context) * 0.04),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Syed Ahmed', // Hardcoded name from screenshot
                        style: GoogleFonts.poppins(
                          fontSize: size.customWidth(context) * 0.045,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                      Text(
                        'Player - Batsman', // Hardcoded role from screenshot
                        style: GoogleFonts.poppins(
                          fontSize: size.customWidth(context) * 0.035,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: size.customHeight(context) * 0.04),

            _buildDropdown(context, 'Batting Hand', controller.selectedBatting, ['Right Handed', 'Left Handed']),
            _buildDropdown(context, 'Fitness Level', controller.selectedFitness, ['Fit', 'Moderate', 'Low']), // Options adjusted
            _buildDropdown(context, 'Gender', controller.selectedGender, ['Male', 'Female', 'Other']), // Options adjusted
            _buildAgeSelector(context, controller),

            SizedBox(height: size.customHeight(context) * 0.04),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              height: size.customHeight(context) * 0.07,
              child: ElevatedButton(
                onPressed: () {
                  // No specific validation on this screen shown in image,
                  // but you can add it here (e.g., if image is mandatory)
                  if (controller.selectedImage.value == null) {
                    Get.snackbar(
                      'Image Required',
                      'Please select a profile image.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                      margin: const EdgeInsets.all(12),
                      duration: const Duration(seconds: 2),
                    );
                    return;
                  }

                  // Proceed with data (for now just print)
                  print("Selected Batting: ${controller.selectedBatting.value}");
                  print("Selected Fitness: ${controller.selectedFitness.value}");
                  print("Selected Gender: ${controller.selectedGender.value}");
                  print("Age: ${controller.age.value}");
                  print("Image path: ${controller.selectedImage.value!.path}");

                  // Navigate to the next screen after submission
                  Get.to(() => MyNewPlayerHomeScreen()); // Example navigation
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor, // Submit button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2), // Rounded corners
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'Submit', // Text "Submit"
                  style: GoogleFonts.poppins(
                    fontSize: size.customWidth(context) * 0.045,
                    fontWeight: FontWeight.w600,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.customHeight(context) * 0.02), // Bottom padding
          ],
        ),
      ),
    );
  }

  // Reusable Dropdown builder
  Widget _buildDropdown(BuildContext context, String title, RxString selectedValue, List<String> options) {
    final size = CustomSize();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.customHeight(context) * 0.01), // Adjusted vertical padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: size.customWidth(context) * 0.04, // Slightly smaller font size
              fontWeight: FontWeight.w500, // Lighter weight
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(height: size.customHeight(context) * 0.01), // Spacing below title
          Obx(() => Container(
                padding: EdgeInsets.symmetric(horizontal: size.customWidth(context) * 0.04), // Padding inside container
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(size.customHeight(context) * 0.015), // Consistent border radius
                  border: Border.all(color: AppColors.greyColor.withOpacity(0.5)), // Light grey border
                  boxShadow: [ // Shadow as seen in text fields
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedValue.value,
                    icon: Icon(Icons.arrow_drop_down, color: AppColors.primaryColor, size: size.customWidth(context) * 0.06), // Primary color dropdown icon
                    isExpanded: true,
                    style: GoogleFonts.poppins( // Style for selected value text
                      fontSize: size.customWidth(context) * 0.045,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    items: options
                        .map((option) => DropdownMenuItem(
                              value: option,
                              child: Row(
                                children: [
                                  Icon(
                                    // Checkmark for selected item
                                    selectedValue.value == option ? Icons.check_circle : Icons.radio_button_off,
                                    color: AppColors.primaryColor,
                                    size: size.customWidth(context) * 0.045,
                                  ),
                                  SizedBox(width: size.customWidth(context) * 0.02),
                                  Text(
                                    option,
                                    style: GoogleFonts.poppins(
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size.customWidth(context) * 0.045,
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

  // Age Selector builder
 
   Widget _buildAgeSelector(BuildContext context, ProfileController controller) {
    final size = CustomSize();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.customHeight(context) * 0.01), // Adjusted vertical padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Age",
            style: GoogleFonts.poppins(
              fontSize: size.customWidth(context) * 0.04, // Consistent font size
              fontWeight: FontWeight.w500, // Consistent font weight
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(height: size.customHeight(context) * 0.01), // Spacing below title
          Obx(() => Container(
                padding: EdgeInsets.symmetric(horizontal: size.customWidth(context) * 0.04), // Padding inside container
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(size.customHeight(context) * 0.015), // Consistent border radius
                  border: Border.all(color: AppColors.greyColor.withOpacity(0.5)), // Light grey border
                  boxShadow: [ // Shadow as seen in text fields
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Age value text field (editable)
                    // The "24" should be aligned to the start
                    Expanded(
                      child: TextFormField(
                        key: ValueKey(controller.age.value), // Forces rebuild on age change
                        initialValue: controller.age.value.toString(),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.start, // Changed from TextAlign.center to TextAlign.start
                        onChanged: (value) {
                          final intVal = int.tryParse(value);
                          if (intVal != null && intVal >= 1) { // Age can't be less than 1
                            controller.age.value = intVal;
                          }
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true, // Make text field compact
                          contentPadding: EdgeInsets.zero, // Remove default content padding
                        ),
                        style: GoogleFonts.poppins(
                          color: AppColors.primaryColor, // Age number color
                          fontSize: size.customWidth(context) * 0.045,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline, color: AppColors.primaryColor, size: size.customWidth(context) * 0.06),
                          onPressed: () {
                            if (controller.age.value > 1) controller.age.value--;
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.add_circle_outline, color: AppColors.primaryColor, size: size.customWidth(context) * 0.06),
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
