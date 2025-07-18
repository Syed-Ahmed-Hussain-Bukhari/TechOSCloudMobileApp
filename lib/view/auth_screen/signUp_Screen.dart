// import 'package:etech_cricket_app/components/customButton.dart';
// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';
// import 'package:etech_cricket_app/controller/passwordController.dart';
// import 'package:etech_cricket_app/routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';

// class RegistrationScreen extends StatelessWidget {
//   const RegistrationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final passwordController = Get.put(PasswordController());
//     final size = CustomSize();
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(size.customHeight(context) * 0.02),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Image.asset(
//                   'assets/logo.png',
//                   height: size.customHeight(context) * 0.12,
//                   width: size.customWidth(context) * 0.15,
//                   color: AppColors.primaryColor,
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   'TechOS Cloud',
//                   style: GoogleFonts.poppins(
//                     fontSize: size.customWidth(context) * 0.07,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.primaryColor,
//                     letterSpacing: 2,
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.customHeight(context) * 0.04),
//               Text(
//                 'create an Account',
//                 style: GoogleFonts.poppins(
//                   fontSize: size.customWidth(context) * 0.06,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.blackColor,
//                   letterSpacing: 1,
//                 ),
//               ),
//               SizedBox(height: size.customHeight(context) * 0.01),
//               Text(
//                 'Hello there, register to continue',
//                 style: GoogleFonts.poppins(
//                   fontSize: size.customWidth(context) * 0.04,
//                   color: AppColors.greyColor,
//                 ),
//               ),
//                SizedBox(height: size.customHeight(context) * 0.03),
//               TextFormField(
//                 style: const TextStyle(color: AppColors.blackColor),
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                         CustomSize().customWidth(context) / 15),
//                   ),
//                   hintText: "Syed Ahmed",
//                   prefixIcon: Icon(Icons.alternate_email,
//                       color: AppColors.blackColor),
//                   hintStyle: TextStyle(
//                       color: AppColors.blackColor,
//                       fontSize: CustomSize().customWidth(context) / 28),
//                   contentPadding: EdgeInsets.symmetric(
//                       vertical: CustomSize().customWidth(context) / 65,
//                       horizontal: CustomSize().customWidth(context) / 30),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                         CustomSize().customWidth(context) / 30),
//                     borderSide: const BorderSide(color: AppColors.greyColor),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                         CustomSize().customWidth(context) / 15),
//                     borderSide: const BorderSide(color: AppColors.greyColor),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.customHeight(context) * 0.03),
//               TextFormField(
//                 style: const TextStyle(color: AppColors.blackColor),
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                         CustomSize().customWidth(context) / 15),
//                   ),
//                   hintText: "ahmed@gmail.com",
//                   prefixIcon: Icon(Icons.email_outlined,
//                       color: AppColors.blackColor),
//                   hintStyle: TextStyle(
//                       color: AppColors.blackColor,
//                       fontSize: CustomSize().customWidth(context) / 28),
//                   contentPadding: EdgeInsets.symmetric(
//                       vertical: CustomSize().customWidth(context) / 65,
//                       horizontal: CustomSize().customWidth(context) / 30),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                         CustomSize().customWidth(context) / 30),
//                     borderSide: const BorderSide(color: AppColors.greyColor),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                         CustomSize().customWidth(context) / 15),
//                     borderSide: const BorderSide(color: AppColors.greyColor),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.customHeight(context) * 0.03),
//              Obx(()=> TextFormField(
//               obscureText: passwordController.isPasswordHidden.value,
//                 style: const TextStyle(color: AppColors.blackColor),
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                         CustomSize().customWidth(context) / 15),
//                   ),
//                   hintText: "•••••••••",
//                   prefixIcon: Icon(Icons.lock_outline,
//                       color: AppColors.blackColor),
//                    suffixIcon: IconButton(
//           icon: Icon(
//             passwordController.isPasswordHidden.value
//                 ? Icons.visibility_off_outlined
//                 : Icons.visibility_outlined,
//             color: Colors.black,
//           ),
//           onPressed: passwordController.togglePasswordVisibility,
//         ),
//                   hintStyle: TextStyle(
//                       color: AppColors.blackColor,
//                       fontSize: CustomSize().customWidth(context) / 28),
//                   contentPadding: EdgeInsets.symmetric(
//                       vertical: CustomSize().customWidth(context) / 65,
//                       horizontal: CustomSize().customWidth(context) / 30),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                         CustomSize().customWidth(context) / 30),
//                     borderSide: const BorderSide(color: AppColors.greyColor),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                         CustomSize().customWidth(context) / 15),
//                     borderSide: const BorderSide(color: AppColors.greyColor),
//                   ),
//                 ),
//               ),),
//                SizedBox(height: size.customHeight(context) * 0.03),
//               TextFormField(
//                 style: const TextStyle(color: AppColors.blackColor),
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                         CustomSize().customWidth(context) / 15),
//                   ),
//                   hintText: "+92 313 066 1234",
//                   prefixIcon: Icon(Icons.phone,
//                       color: AppColors.blackColor),
                 
//                   hintStyle: TextStyle(
//                       color: AppColors.blackColor,
//                       fontSize: CustomSize().customWidth(context) / 28),
//                   contentPadding: EdgeInsets.symmetric(
//                       vertical: CustomSize().customWidth(context) / 65,
//                       horizontal: CustomSize().customWidth(context) / 30),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                         CustomSize().customWidth(context) / 30),
//                     borderSide: const BorderSide(color: AppColors.greyColor),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                         CustomSize().customWidth(context) / 15),
//                     borderSide: const BorderSide(color: AppColors.greyColor),
//                   ),
//                 ),
//               ),
//                SizedBox(height: size.customHeight(context) * 0.03),
//               TextFormField(
//                 style: const TextStyle(color: AppColors.blackColor),
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                         CustomSize().customWidth(context) / 15),
//                   ),
//                   hintText: "Gulshan-e-Iqbal Block-2, Karachi",
//                   prefixIcon: Icon(Icons.location_on,
//                       color: AppColors.blackColor),
                 
//                   hintStyle: TextStyle(
//                       color: AppColors.blackColor,
//                       fontSize: CustomSize().customWidth(context) / 28),
//                   contentPadding: EdgeInsets.symmetric(
//                       vertical: CustomSize().customWidth(context) / 65,
//                       horizontal: CustomSize().customWidth(context) / 30),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                         CustomSize().customWidth(context) / 30),
//                     borderSide: const BorderSide(color: AppColors.greyColor),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                         CustomSize().customWidth(context) / 15),
//                     borderSide: const BorderSide(color: AppColors.greyColor),
//                   ),
//                 ),
//               ),
             
//               SizedBox(height: size.customHeight(context) * 0.03),
             
//               CustomButton(
//                 radius: CustomSize().customWidth(context) / 30,
//                 height: CustomSize().customHeight(context) / 14,
//                 width: double.infinity,
//                 title: "Register",
//                 onTap: () {
//                   Get.toNamed(AppRoutes.selectionScreen);

//                 },
//                 loading: false,
//                 color: AppColors.primaryColor,
//               ),
//               SizedBox(height: size.customHeight(context) * 0.03),
//               Center(
//                 child: Text(
//                   'Or Continue with social accounts',
//                   style: GoogleFonts.poppins(
//                     fontSize: size.customWidth(context) * 0.04,
                    
//                     color: AppColors.greyColor,
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.customHeight(context) * 0.03),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                    Center(
//                 child: Image.asset(
//                   'assets/google.png',
//                   height: size.customHeight(context) * 0.09,
//                   width: size.customWidth(context) * 0.1,
                  
//                 ),
//               ),
//                SizedBox(width: size.customWidth(context) * 0.03),
//                Center(
//                 child: Image.asset(
//                   'assets/facebook.png',
//                   height: size.customHeight(context) * 0.09,
//                   width: size.customWidth(context) * 0.1,
                  
//                 ),
//               ),

//                 ],
//               ),
//               SizedBox(height: size.customHeight(context) * 0.03),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Already have an account?",
//                     style: GoogleFonts.poppins(
//                       fontSize: size.customWidth(context) * 0.04,
//                       color: AppColors.blackColor,
//                     ),
//                   ),
//                   SizedBox(width: size.customWidth(context) * 0.01),
//                   GestureDetector(
//                     onTap: (){
//                       Get.toNamed(AppRoutes.login);
//                     },
//                     child: Text(
//                       'Log in',
//                       style: GoogleFonts.poppins(
//                         fontSize: size.customWidth(context) * 0.04,
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(height: size.customHeight(context) * 0.05),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:etech_cricket_app/components/customButton.dart';
// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';
// import 'package:etech_cricket_app/controller/passwordController.dart';
// import 'package:etech_cricket_app/routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class RegistrationScreen extends StatelessWidget {
//   const RegistrationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final passwordController = Get.put(PasswordController());
//     final size = CustomSize();

//     final formKey = GlobalKey<FormState>();
//     final emailController = TextEditingController();
//     final passwordTextController = TextEditingController();
//     final confirmPasswordController = TextEditingController();

//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(size.customHeight(context) * 0.02),
//           child: Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Image.asset(
//                     'assets/logo.png',
//                     height: size.customHeight(context) * 0.12,
//                     width: size.customWidth(context) * 0.15,
//                     color: AppColors.primaryColor,
//                   ),
//                 ),
//                 Center(
//                   child: Text(
//                     'TechOS Cloud',
//                     style: GoogleFonts.poppins(
//                       fontSize: size.customWidth(context) * 0.07,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.primaryColor,
//                       letterSpacing: 2,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: size.customHeight(context) * 0.04),
//                 Text(
//                   'Create an Account',
//                   style: GoogleFonts.poppins(
//                     fontSize: size.customWidth(context) * 0.06,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.blackColor,
//                     letterSpacing: 1,
//                   ),
//                 ),
//                 SizedBox(height: size.customHeight(context) * 0.01),
//                 Text(
//                   'Hello there, register to continue',
//                   style: GoogleFonts.poppins(
//                     fontSize: size.customWidth(context) * 0.04,
//                     color: AppColors.greyColor,
//                   ),
//                 ),
//                 SizedBox(height: size.customHeight(context) * 0.03),

//                 // Email
//                 TextFormField(
//                   controller: emailController,
//                   validator: (val) {
//                     if (val == null || val.trim().isEmpty) return "Email is required";
//                     if (!val.contains("@") || !val.contains(".")) return "Enter valid email";
//                     return null;
//                   },
//                   style: const TextStyle(color: AppColors.blackColor),
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(size.customWidth(context) / 15),
//                     ),
//                     hintText: "ahmed@gmail.com",
//                     prefixIcon: const Icon(Icons.email_outlined, color: AppColors.blackColor),
//                     hintStyle: TextStyle(
//                       color: AppColors.blackColor,
//                       fontSize: size.customWidth(context) / 28,
//                     ),
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: size.customWidth(context) / 65,
//                       horizontal: size.customWidth(context) / 30,
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(size.customWidth(context) / 30),
//                       borderSide: const BorderSide(color: AppColors.greyColor),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(size.customWidth(context) / 15),
//                       borderSide: const BorderSide(color: AppColors.greyColor),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: size.customHeight(context) * 0.03),

//                 // Password
//                 Obx(() => TextFormField(
//                       controller: passwordTextController,
//                       obscureText: passwordController.isPasswordHidden.value,
//                       validator: (val) =>
//                           val == null || val.isEmpty ? "Password is required" : null,
//                       style: const TextStyle(color: AppColors.blackColor),
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(size.customWidth(context) / 15),
//                         ),
//                         hintText: "•••••••••",
//                         prefixIcon:
//                             const Icon(Icons.lock_outline, color: AppColors.blackColor),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             passwordController.isPasswordHidden.value
//                                 ? Icons.visibility_off_outlined
//                                 : Icons.visibility_outlined,
//                             color: Colors.black,
//                           ),
//                           onPressed: passwordController.togglePasswordVisibility,
//                         ),
//                         hintStyle: TextStyle(
//                           color: AppColors.blackColor,
//                           fontSize: size.customWidth(context) / 28,
//                         ),
//                         contentPadding: EdgeInsets.symmetric(
//                           vertical: size.customWidth(context) / 65,
//                           horizontal: size.customWidth(context) / 30,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(size.customWidth(context) / 30),
//                           borderSide: const BorderSide(color: AppColors.greyColor),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(size.customWidth(context) / 15),
//                           borderSide: const BorderSide(color: AppColors.greyColor),
//                         ),
//                       ),
//                     )),
//                 SizedBox(height: size.customHeight(context) * 0.03),

//                 // Confirm Password - Fixed
//                 Obx(() => TextFormField(
//                       controller: confirmPasswordController,
//                       obscureText: passwordController.isConfirmPasswordHidden.value,
//                       validator: (val) {
//                         if (val == null || val.isEmpty) return "Confirm password is required";
//                         if (val != passwordTextController.text) return "Passwords do not match";
//                         return null;
//                       },
//                       style: const TextStyle(color: AppColors.blackColor),
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(size.customWidth(context) / 15),
//                         ),
//                         hintText: "Confirm Password",
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             passwordController.isConfirmPasswordHidden.value
//                                 ? Icons.visibility_off_outlined
//                                 : Icons.visibility_outlined,
//                             color: Colors.black,
//                           ),
//                           onPressed: passwordController.toggleConfirmPasswordVisibility,
//                         ),
//                         prefixIcon:
//                             const Icon(Icons.lock_outline, color: AppColors.blackColor),
//                         hintStyle: TextStyle(
//                           color: AppColors.blackColor,
//                           fontSize: size.customWidth(context) / 28,
//                         ),
//                         contentPadding: EdgeInsets.symmetric(
//                           vertical: size.customWidth(context) / 65,
//                           horizontal: size.customWidth(context) / 30,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(size.customWidth(context) / 30),
//                           borderSide: const BorderSide(color: AppColors.greyColor),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(size.customWidth(context) / 15),
//                           borderSide: const BorderSide(color: AppColors.greyColor),
//                         ),
//                       ),
//                     )),
//                 SizedBox(height: size.customHeight(context) * 0.03),

//                 // Register Button
//                 CustomButton(
//                   radius: size.customWidth(context) / 30,
//                   height: size.customHeight(context) / 14,
//                   width: double.infinity,
//                   title: "Register",
//                   onTap: () {
//                     if (formKey.currentState!.validate()) {
//                       print("Email: ${emailController.text}");
//                       print("Password: ${passwordTextController.text}");
//                       Get.toNamed(AppRoutes.selectionScreen);
//                     }
//                   },
//                   loading: false,
//                   color: AppColors.primaryColor,
//                 ),
//                 SizedBox(height: size.customHeight(context) * 0.03),

//                 Center(
//                   child: Text(
//                     'Or Continue with social accounts',
//                     style: GoogleFonts.poppins(
//                       fontSize: size.customWidth(context) * 0.04,
//                       color: AppColors.greyColor,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: size.customHeight(context) * 0.03),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       'assets/google.png',
//                       height: size.customHeight(context) * 0.09,
//                       width: size.customWidth(context) * 0.1,
//                     ),
//                     SizedBox(width: size.customWidth(context) * 0.03),
//                     Image.asset(
//                       'assets/facebook.png',
//                       height: size.customHeight(context) * 0.09,
//                       width: size.customWidth(context) * 0.1,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: size.customHeight(context) * 0.03),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Already have an account?",
//                       style: GoogleFonts.poppins(
//                         fontSize: size.customWidth(context) * 0.04,
//                         color: AppColors.blackColor,
//                       ),
//                     ),
//                     SizedBox(width: size.customWidth(context) * 0.01),
//                     GestureDetector(
//                       onTap: () => Get.toNamed(AppRoutes.login),
//                       child: Text(
//                         'Log in',
//                         style: GoogleFonts.poppins(
//                           fontSize: size.customWidth(context) * 0.04,
//                           fontWeight: FontWeight.w700,
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(height: size.customHeight(context) * 0.05),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:etech_cricket_app/components/customButton.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:etech_cricket_app/controller/passwordController.dart';
import 'package:etech_cricket_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';



class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the PasswordController
    final passwordController = Get.put(PasswordController());
    final size = CustomSize();

    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordTextController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    // Note: For StatelessWidget, text controllers are typically managed by a parent StatefulWidget
    // or a GetX controller that has a lifecycle. For this example, they are directly here.
    // Ensure proper disposal in a real app if this is not a GetX-managed state.

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.blackColor, size: size.customHeight(context) * 0.04),
          onPressed: () {
            Get.back(); // Navigate back to the previous screen (e.g., LoginScreen)
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the logo and text
          children: [
            Image.asset(
              'assets/techos_cloud_logo.png', // Your logo path
              height: size.customHeight(context) * 0.1, // Adjust as needed
                      ),
            
          
          ],
        ),
        centerTitle: true, // Center the title in AppBar
        actions: [
          SizedBox(width: size.customWidth(context) * 0.1), // Balance the leading icon space
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.customWidth(context) * 0.05),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.customHeight(context) * 0.04), // Space after AppBar
              Row(
                     mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    'Create an Account',
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.07, // Adjusted for larger heading
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.customHeight(context) * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello there, register to continue',
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.04,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.customHeight(context) * 0.03),

              // Email Input Field
              _buildTextField(
                context,
                controller: emailController,
                hintText: "ahmed@gmail.com",
                icon: Icons.mail_outline,
                size: size,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return "Email is required";
                  if (!val.contains("@") || !val.contains(".")) return "Enter valid email";
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: size.customHeight(context) * 0.025),

              // Password Input Field
              Obx(
                () => _buildPasswordField(
                  context,
                  controller: passwordTextController,
                  hintText: "•••••••••",
                  icon: Icons.lock_outline,
                  size: size,
                  obscureText: passwordController.isPasswordHidden.value,
                  onVisibilityToggle: passwordController.togglePasswordVisibility,
                  validator: (val) =>
                      val == null || val.isEmpty ? "Password is required" : null,
                ),
              ),
              SizedBox(height: size.customHeight(context) * 0.025),

              // Confirm Password Input Field
              Obx(
                () => _buildPasswordField(
                  context,
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  icon: Icons.lock_outline,
                  size: size,
                  obscureText: passwordController.isConfirmPasswordHidden.value,
                  onVisibilityToggle: passwordController.toggleConfirmPasswordVisibility,
                  validator: (val) {
                    if (val == null || val.isEmpty) return "Confirm password is required";
                    if (val != passwordTextController.text) return "Passwords do not match";
                    return null;
                  },
                ),
              ),
              SizedBox(height: size.customHeight(context) * 0.03),

              // Register Button
              _buildPrimaryButton(
                context,
                title: "Register",
                size: size,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    print("Email: ${emailController.text}");
                    print("Password: ${passwordTextController.text}");
                    Get.toNamed(AppRoutes.selectionScreen);            }
                },
              ),
              SizedBox(height: size.customHeight(context) * 0.03),

              // "Or Continue with social accounts" divider
              _buildDividerWithText(context, size, text: 'Or Continue with'),
               SizedBox(height: size.customHeight(context) * 0.03),
            _buildSocialLoginButton(
              context,
              text: 'Facebook',
              iconPath: 'assets/facebook.png', // Assuming you have a Facebook logo asset
              size: size,
              onTap: () {
                print('Login with Facebook');
              },
            ),
            SizedBox(height: size.customHeight(context) * 0.015),
            _buildSocialLoginButton(
              context,
              text: 'Google',
              iconPath: 'assets/google.png', // Assuming you have a Google logo asset
              size: size,
              onTap: () {
                print('Login with Google');
              },
            ),
              SizedBox(height: size.customHeight(context) * 0.05),

              // Already have an account? Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.038,
                      color: AppColors.blackColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.login),
                    child:Text(
                'Log in',
                style: GoogleFonts.poppins(
                  fontSize: size.customWidth(context) * 0.038,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primaryColor, // Sets underline color
                ),
              ),


                  ),
                ],
              ),
              SizedBox(height: size.customHeight(context) * 0.03), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }

  // Reusable TextField builder (for email, etc.)
  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required CustomSize size,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
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
      child: TextFormField(
        controller: controller,
        cursorColor:AppColors.primaryColor ,
        validator: validator,
        keyboardType: keyboardType,
        style: GoogleFonts.poppins(
          fontSize: size.customWidth(context) * 0.04,
          color: AppColors.blackColor,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColors.blackColor.withOpacity(0.7)),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: size.customWidth(context) * 0.04,
            color: AppColors.greyColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: BorderSide.none, // No border needed due to container decoration
          ),
          enabledBorder: OutlineInputBorder( // Ensure enabled border matches the container's rounded corners
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder( // Ensure focused border matches
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5), // Highlight on focus
          ),
          errorBorder: OutlineInputBorder( // Error border for validation
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder( // Focused error border
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: size.customHeight(context) * 0.02,
            horizontal: size.customWidth(context) * 0.04,
          ),
        ),
      ),
    );
  }

  // Reusable PasswordField builder
  Widget _buildPasswordField(
    BuildContext context, {
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required CustomSize size,
    required bool obscureText,
    required VoidCallback onVisibilityToggle,
    String? Function(String?)? validator,
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
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        cursorColor:AppColors.primaryColor ,
        validator: validator,
        style: GoogleFonts.poppins(
          fontSize: size.customWidth(context) * 0.04,
          color: AppColors.blackColor,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColors.blackColor.withOpacity(0.7)),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: size.customWidth(context) * 0.04,
            color: AppColors.greyColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: AppColors.greyColor,
            ),
            onPressed: onVisibilityToggle,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder( // Ensure enabled border matches the container's rounded corners
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder( // Ensure focused border matches
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5), // Highlight on focus
          ),
          errorBorder: OutlineInputBorder( // Error border for validation
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder( // Focused error border
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: size.customHeight(context) * 0.02,
            horizontal: size.customWidth(context) * 0.04,
          ),
        ),
      ),
    );
  }

  // Reusable Primary Button builder (replaces CustomButton)
  Widget _buildPrimaryButton(
    BuildContext context, {
    required String title,
    required CustomSize size,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: size.customHeight(context) * 0.07, // Consistent height with login button
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
          ),
          elevation: 5,
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: size.customWidth(context) * 0.042,
            fontWeight: FontWeight.w800,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }

  // Reusable Social Icon button
  Widget _buildSocialLoginButton(
    BuildContext context, {
    required String text,
    required String iconPath,
    required CustomSize size,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: size.customHeight(context) * 0.07,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.greyColor.withOpacity(0.55), width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: size.customHeight(context) * 0.06,
              width: size.customWidth(context) * 0.06,
            ),
            SizedBox(width: size.customWidth(context) * 0.03),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: size.customWidth(context) * 0.04,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for the "or continue with" divider
  Widget _buildDividerWithText(BuildContext context, CustomSize size, {required String text}) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.greyColor.withOpacity(0.5),
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.customWidth(context) * 0.04),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: AppColors.greyColor,
              fontSize: size.customWidth(context) * 0.038,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.greyColor.withOpacity(0.5),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}