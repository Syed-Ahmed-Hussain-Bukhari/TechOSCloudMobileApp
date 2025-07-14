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


import 'package:etech_cricket_app/components/customButton.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:etech_cricket_app/controller/passwordController.dart';
import 'package:etech_cricket_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    final size = CustomSize();

    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordTextController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.customHeight(context) * 0.02),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/logo.png',
                    height: size.customHeight(context) * 0.12,
                    width: size.customWidth(context) * 0.15,
                    color: AppColors.primaryColor,
                  ),
                ),
                Center(
                  child: Text(
                    'TechOS Cloud',
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.07,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                SizedBox(height: size.customHeight(context) * 0.04),
                Text(
                  'Create an Account',
                  style: GoogleFonts.poppins(
                    fontSize: size.customWidth(context) * 0.06,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: size.customHeight(context) * 0.01),
                Text(
                  'Hello there, register to continue',
                  style: GoogleFonts.poppins(
                    fontSize: size.customWidth(context) * 0.04,
                    color: AppColors.greyColor,
                  ),
                ),
                SizedBox(height: size.customHeight(context) * 0.03),

                // Email
                TextFormField(
                  controller: emailController,
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) return "Email is required";
                    if (!val.contains("@") || !val.contains(".")) return "Enter valid email";
                    return null;
                  },
                  style: const TextStyle(color: AppColors.blackColor),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(size.customWidth(context) / 15),
                    ),
                    hintText: "ahmed@gmail.com",
                    prefixIcon: const Icon(Icons.email_outlined, color: AppColors.blackColor),
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
                      borderSide: const BorderSide(color: AppColors.greyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(size.customWidth(context) / 15),
                      borderSide: const BorderSide(color: AppColors.greyColor),
                    ),
                  ),
                ),
                SizedBox(height: size.customHeight(context) * 0.03),

                // Password
                Obx(() => TextFormField(
                      controller: passwordTextController,
                      obscureText: passwordController.isPasswordHidden.value,
                      validator: (val) =>
                          val == null || val.isEmpty ? "Password is required" : null,
                      style: const TextStyle(color: AppColors.blackColor),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(size.customWidth(context) / 15),
                        ),
                        hintText: "•••••••••",
                        prefixIcon:
                            const Icon(Icons.lock_outline, color: AppColors.blackColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordController.isPasswordHidden.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.black,
                          ),
                          onPressed: passwordController.togglePasswordVisibility,
                        ),
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
                          borderSide: const BorderSide(color: AppColors.greyColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(size.customWidth(context) / 15),
                          borderSide: const BorderSide(color: AppColors.greyColor),
                        ),
                      ),
                    )),
                SizedBox(height: size.customHeight(context) * 0.03),

                // Confirm Password - Fixed
                Obx(() => TextFormField(
                      controller: confirmPasswordController,
                      obscureText: passwordController.isConfirmPasswordHidden.value,
                      validator: (val) {
                        if (val == null || val.isEmpty) return "Confirm password is required";
                        if (val != passwordTextController.text) return "Passwords do not match";
                        return null;
                      },
                      style: const TextStyle(color: AppColors.blackColor),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(size.customWidth(context) / 15),
                        ),
                        hintText: "Confirm Password",
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordController.isConfirmPasswordHidden.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.black,
                          ),
                          onPressed: passwordController.toggleConfirmPasswordVisibility,
                        ),
                        prefixIcon:
                            const Icon(Icons.lock_outline, color: AppColors.blackColor),
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
                          borderSide: const BorderSide(color: AppColors.greyColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(size.customWidth(context) / 15),
                          borderSide: const BorderSide(color: AppColors.greyColor),
                        ),
                      ),
                    )),
                SizedBox(height: size.customHeight(context) * 0.03),

                // Register Button
                CustomButton(
                  radius: size.customWidth(context) / 30,
                  height: size.customHeight(context) / 14,
                  width: double.infinity,
                  title: "Register",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      print("Email: ${emailController.text}");
                      print("Password: ${passwordTextController.text}");
                      Get.toNamed(AppRoutes.selectionScreen);
                    }
                  },
                  loading: false,
                  color: AppColors.primaryColor,
                ),
                SizedBox(height: size.customHeight(context) * 0.03),

                Center(
                  child: Text(
                    'Or Continue with social accounts',
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.04,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
                SizedBox(height: size.customHeight(context) * 0.03),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/google.png',
                      height: size.customHeight(context) * 0.09,
                      width: size.customWidth(context) * 0.1,
                    ),
                    SizedBox(width: size.customWidth(context) * 0.03),
                    Image.asset(
                      'assets/facebook.png',
                      height: size.customHeight(context) * 0.09,
                      width: size.customWidth(context) * 0.1,
                    ),
                  ],
                ),
                SizedBox(height: size.customHeight(context) * 0.03),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.poppins(
                        fontSize: size.customWidth(context) * 0.04,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(width: size.customWidth(context) * 0.01),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.login),
                      child: Text(
                        'Log in',
                        style: GoogleFonts.poppins(
                          fontSize: size.customWidth(context) * 0.04,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.customHeight(context) * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
