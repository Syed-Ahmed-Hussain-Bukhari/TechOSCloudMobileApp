// import 'package:etech_cricket_app/view/startScreen/player_roles.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';
// import 'package:etech_cricket_app/components/customButton.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

// class PlayerPersonalInformationScreen extends StatefulWidget {
//   const PlayerPersonalInformationScreen({super.key});

//   @override
//   State<PlayerPersonalInformationScreen> createState() =>
//       _PlayerPersonalInformationScreenState();
// }

// class _PlayerPersonalInformationScreenState
//     extends State<PlayerPersonalInformationScreen> {
//   final formKey = GlobalKey<FormState>();
//   final nameController = TextEditingController();
//   final phoneController = TextEditingController();
//   final addressController = TextEditingController();

//   String? completePhoneNumber;

//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();

//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(size.customHeight(context) * 0.02),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Top Row with Back Button and Centered Title
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.arrow_back,
//                             color: AppColors.primaryColor),
//                         onPressed: () => Get.back(),
//                       ),
//                       const Spacer(),
//                       Text(
//                         'Complete Your Profile',
//                         style: GoogleFonts.poppins(
//                           fontSize: size.customWidth(context) * 0.05,
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                       const Spacer(flex: 2),
//                     ],
//                   ),
//                   SizedBox(height: size.customHeight(context) * 0.02),

//                   Text(
//                     'Please provide your player information to complete registration.',
//                     style: GoogleFonts.poppins(
//                       fontSize: size.customWidth(context) * 0.04,
//                       color: AppColors.greyColor,
//                     ),
//                   ),
//                   SizedBox(height: size.customHeight(context) * 0.03),

//                   // Name Field
//                   TextFormField(
//                     controller: nameController,
//                     validator: (val) =>
//                         val == null || val.trim().isEmpty ? 'Name is required' : null,
//                     style: const TextStyle(color: AppColors.blackColor),
//                     decoration: InputDecoration(
//                       hintText: 'Full Name',
//                       prefixIcon:
//                           const Icon(Icons.person, color: AppColors.blackColor),
//                       hintStyle: TextStyle(
//                         color: AppColors.blackColor,
//                         fontSize: size.customWidth(context) / 28,
//                       ),
//                       contentPadding: EdgeInsets.symmetric(
//                         vertical: size.customWidth(context) / 65,
//                         horizontal: size.customWidth(context) / 30,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius:
//                             BorderRadius.circular(size.customWidth(context) / 15),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius:
//                             BorderRadius.circular(size.customWidth(context) / 15),
//                         borderSide: const BorderSide(color: AppColors.primaryColor),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: size.customHeight(context) * 0.03),

//                   // Phone Field
//                   IntlPhoneField(
//                     controller: phoneController,
//                     initialCountryCode: 'PK',
//                     decoration: InputDecoration(
//                       hintText: 'Phone Number',
//                       hintStyle: TextStyle(
//                         color: AppColors.blackColor,
//                         fontSize: size.customWidth(context) / 28,
//                       ),
//                       contentPadding: EdgeInsets.symmetric(
//                         vertical: size.customWidth(context) / 65,
//                         horizontal: size.customWidth(context) / 30,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius:
//                             BorderRadius.circular(size.customWidth(context) / 15),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius:
//                             BorderRadius.circular(size.customWidth(context) / 15),
//                         borderSide: const BorderSide(color: AppColors.primaryColor),
//                       ),
//                     ),
//                     onChanged: (phone) {
//                       completePhoneNumber = phone.completeNumber;
//                     },
//                   ),
//                   SizedBox(height: size.customHeight(context) * 0.03),

//                   // Address Field
//                   TextFormField(
//                     controller: addressController,
//                     validator: (val) => val == null || val.trim().isEmpty
//                         ? 'Address is required'
//                         : null,
//                     style: const TextStyle(color: AppColors.blackColor),
//                     decoration: InputDecoration(
//                       hintText: 'Address',
//                       prefixIcon: const Icon(Icons.location_on,
//                           color: AppColors.blackColor),
//                       hintStyle: TextStyle(
//                         color: AppColors.blackColor,
//                         fontSize: size.customWidth(context) / 28,
//                       ),
//                       contentPadding: EdgeInsets.symmetric(
//                         vertical: size.customWidth(context) / 65,
//                         horizontal: size.customWidth(context) / 30,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius:
//                             BorderRadius.circular(size.customWidth(context) / 15),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius:
//                             BorderRadius.circular(size.customWidth(context) / 15),
//                         borderSide:
//                             const BorderSide(color: AppColors.primaryColor),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: size.customHeight(context) * 0.1),

//                   // Submit Button
//                   CustomButton(
//                     title: "Continue",
//                     onTap: () {
//                       if (formKey.currentState!.validate()) {
//                         if (completePhoneNumber == null ||
//                             completePhoneNumber!.isEmpty) {
//                           Get.snackbar(
//                             "Validation Error",
//                             "Phone number is required",
//                             backgroundColor: Colors.red.withOpacity(0.9),
//                             colorText: Colors.white,
//                           );
//                           return;
//                         }

//                         print("Name: ${nameController.text}");
//                         print("Phone: $completePhoneNumber");
//                         print("Address: ${addressController.text}");

//                         Get.snackbar(
//                           "Success",
//                           "Information submitted successfully!",
//                           backgroundColor: Colors.green.withOpacity(0.9),
//                           colorText: Colors.white,
//                         );

//                         Get.to(PlayerSelectionScreen());
//                       }
//                     },
//                     radius: size.customWidth(context) / 30,
//                     height: size.customHeight(context) / 14,
//                     width: double.infinity,
//                     color: AppColors.primaryColor,
//                     loading: false,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart'; // Import intl_phone_field

// Assume these are your existing constant files
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:etech_cricket_app/routes/app_routes.dart'; // Assuming you have an AppRoutes

class PlayerPersonalInformationScreen extends StatefulWidget {
  const PlayerPersonalInformationScreen({super.key});

  @override
  State<PlayerPersonalInformationScreen> createState() => _PlayerPersonalInformationScreenState();
}

class _PlayerPersonalInformationScreenState extends State<PlayerPersonalInformationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form key for validation
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String? _fullPhoneNumber; // To store the complete phone number with country code

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
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
              value: 2 / 5, // STEP 2/5
              backgroundColor: AppColors.greyColor.withOpacity(0.4),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              minHeight: size.customHeight(context) * 0.01,
            ),
            SizedBox(height: size.customHeight(context) * 0.005),
            Text(
              'STEP 2/5', //
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
          SizedBox(width: size.customWidth(context) * 0.08),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.customWidth(context) * 0.05),
          child: Form( // Wrapped with Form for validation
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.customHeight(context) * 0.03),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      'Complete Your Profile', //
                      style: GoogleFonts.poppins(
                        fontSize: size.customWidth(context) * 0.06,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.customHeight(context) * 0.005),
                Center(
                  child: Text(
                    'Please provide your player information to complete registration', //
                       textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.04,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
                SizedBox(height: size.customHeight(context) * 0.05),

                // Full Name Text Field
                _buildTextField(
                  context,
                  controller: _fullNameController,
                  hintText: 'Your full name', //
                  prefixIcon: Icons.person_outline, //
                  size: size,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Full name is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: size.customHeight(context) * 0.02),

                // Phone Number Field with Country Code Picker (using intl_phone_field)
                // Wrapped in a Container to apply uniform decoration/shadow
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(size.customHeight(context) * 0.015),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IntlPhoneField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      hintText: 'Your phone number', //
                      hintStyle: GoogleFonts.poppins(
                        fontSize: size.customWidth(context) * 0.04,
                        color: AppColors.greyColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(size.customHeight(context) * 0.015),
                        borderSide: BorderSide.none, // No border needed, as container has it
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(size.customHeight(context) * 0.015),
                        borderSide: BorderSide(color: AppColors.greyColor.withOpacity(0.5), width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(size.customHeight(context) * 0.015),
                        borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(size.customHeight(context) * 0.015),
                        borderSide: const BorderSide(color: Colors.red, width: 1.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(size.customHeight(context) * 0.015),
                        borderSide: const BorderSide(color: Colors.red, width: 2.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: size.customHeight(context) * 0.02,
                        horizontal: size.customWidth(context) * 0.04,
                      ),
                    ),
                    initialCountryCode: 'PK', // Default to Pakistan
                    onChanged: (phone) {
                      _fullPhoneNumber = phone.completeNumber;
                      print(_fullPhoneNumber);
                    },
                    validator: (phone) {
                      if (phone == null || phone.number.trim().isEmpty) {
                        return 'Phone number is required';
                      }
                      return null;
                    },
                    dropdownIcon: Icon(Icons.arrow_drop_down, color: AppColors.greyColor, size: size.customWidth(context) * 0.05),
                    keyboardType: TextInputType.phone,
                    cursorColor: AppColors.primaryColor,
                    style: GoogleFonts.poppins( // Style the phone number text
                      fontSize: size.customWidth(context) * 0.04,
                      color: AppColors.blackColor,
                    ),
                    dropdownTextStyle: GoogleFonts.poppins( // Style the country code text in the input
                      fontSize: size.customWidth(context) * 0.04,
                      color: AppColors.blackColor,
                    ),
                    flagsButtonPadding: EdgeInsets.only(left: size.customWidth(context) * 0.04), // Align flag and code
                    // Set flag icon size
                    // flagWidth: size.customWidth(context) * 0.06,
                  ),
                ),
                SizedBox(height: size.customHeight(context) * 0.02),

                // Address Text Field
                _buildTextField(
                  context,
                  controller: _addressController,
                  hintText: 'Your address', //
                  prefixIcon: Icons.location_on_outlined, //
                  size: size,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Address is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: size.customHeight(context) * 0.1),

                /// Continue Button
                SizedBox(
                  width: double.infinity,
                  height: size.customHeight(context) * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // All fields are valid, proceed with saving data
                        print('Full Name: ${_fullNameController.text}');
                        print('Complete Phone Number: $_fullPhoneNumber'); // Use the complete number
                        print('Address: ${_addressController.text}');

                       
                        Get.toNamed(AppRoutes.weightScreen); // Example navigation
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          size.customHeight(context) * 0.2,
                        ),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      'Continue', //
                      style: GoogleFonts.poppins(
                        fontSize: size.customWidth(context) * 0.045,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.customHeight(context) * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable TextField builder with updated border styles and validator
  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    required CustomSize size,
    bool obscureText = false,
    String? Function(String?)? validator, // Added validator
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField( // Changed to TextFormField for validation
        controller: controller,
        obscureText: obscureText,
        cursorColor: AppColors.primaryColor, // Primary color cursor
        validator: validator, // Apply validator
        style: GoogleFonts.poppins(
          fontSize: size.customWidth(context) * 0.04,
          color: AppColors.blackColor,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: size.customWidth(context) * 0.04,
            color: AppColors.greyColor,
          ),
          prefixIcon: Icon(prefixIcon, color: AppColors.blackColor.withOpacity(0.7)), // Icon color to primary
          border: OutlineInputBorder( // Default border style
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: BorderSide.none, // No border needed due to container decoration
          ),
          enabledBorder: OutlineInputBorder( // Primary color border when enabled
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: BorderSide(color: AppColors.greyColor.withOpacity(0.5), width: 1.0), // Light primary border
          ),
          focusedBorder: OutlineInputBorder( // Stronger primary color border when focused
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
          ),
          errorBorder: OutlineInputBorder( // Red border for validation errors
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder( // Stronger red border when focused on error
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: size.customHeight(context) * 0.02,
            horizontal: size.customWidth(context) * 0.04,
          ),
        ),
      ),
    );
  }
}