// import 'package:etech_cricket_app/components/customButton.dart';
// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';
// import 'package:etech_cricket_app/controller/passwordController.dart';
// import 'package:etech_cricket_app/routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

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
//                 'Log In Your Account',
//                 style: GoogleFonts.poppins(
//                   fontSize: size.customWidth(context) * 0.06,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.blackColor,
//                   letterSpacing: 1,
//                 ),
//               ),
//               SizedBox(height: size.customHeight(context) * 0.01),
//               Text(
//                 'Hello there, login to continue',
//                 style: GoogleFonts.poppins(
//                   fontSize: size.customWidth(context) * 0.04,
//                   color: AppColors.greyColor,
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
//               Obx(()=>TextFormField(
//                  obscureText: passwordController.isPasswordHidden.value,
//                 style: const TextStyle(color: AppColors.blackColor),
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(
//                         CustomSize().customWidth(context) / 15),
//                   ),
//                   hintText: "•••••••••",
//                   prefixIcon: Icon(Icons.lock_outline,
//                       color: AppColors.blackColor),
//                  suffixIcon: IconButton(
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
//               SizedBox(height: size.customHeight(context) * 0.01),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     'Forgot Password?',
//                     style: GoogleFonts.poppins(
//                       fontSize: size.customWidth(context) * 0.04,
//                       color: AppColors.primaryColor,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: size.customHeight(context) * 0.03),
//               /// ✅ FIXED THIS: moved outside Row
//               CustomButton(
//                 radius: CustomSize().customWidth(context) / 30,
//                 height: CustomSize().customHeight(context) / 14,
//                 width: double.infinity,
//                 title: "Login",
//                 onTap: () {
//                     Get.toNamed(AppRoutes.selectionScreen);

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
//                     "Don't have an account?",
//                     style: GoogleFonts.poppins(
//                       fontSize: size.customWidth(context) * 0.04,
//                       color: AppColors.blackColor,
//                     ),
//                   ),
//                   SizedBox(width: size.customWidth(context) * 0.01),
//                   GestureDetector(
//                     onTap: (){
//                         Get.toNamed(AppRoutes.registration);

//                     },
//                     child: Text(
//                       'Register',
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

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final passwordController = Get.put(PasswordController());
//     final size = CustomSize();
//     final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//     final TextEditingController emailController = TextEditingController();
//     final TextEditingController pwdController = TextEditingController();

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
//                   'Log In Your Account',
//                   style: GoogleFonts.poppins(
//                     fontSize: size.customWidth(context) * 0.06,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.blackColor,
//                   ),
//                 ),
//                 SizedBox(height: size.customHeight(context) * 0.01),
//                 Text(
//                   'Hello there, login to continue',
//                   style: GoogleFonts.poppins(
//                     fontSize: size.customWidth(context) * 0.04,
//                     color: AppColors.greyColor,
//                   ),
//                 ),
//                 SizedBox(height: size.customHeight(context) * 0.03),

//                 // Email Field
//                 TextFormField(
//                   controller: emailController,
//                   style: const TextStyle(color: AppColors.blackColor),
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return 'Email is required';
//                     }
//                     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
//                     if (!emailRegex.hasMatch(value.trim())) {
//                       return 'Enter a valid email';
//                     }
//                     return null;
//                   },
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

//                 // Password Field
//                 Obx(() => TextFormField(
//                       controller: pwdController,
//                       obscureText: passwordController.isPasswordHidden.value,
//                       style: const TextStyle(color: AppColors.blackColor),
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Password is required';
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(size.customWidth(context) / 15),
//                         ),
//                         hintText: "•••••••••",
//                         prefixIcon: const Icon(Icons.lock_outline, color: AppColors.blackColor),
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
//                 SizedBox(height: size.customHeight(context) * 0.01),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       'Forgot Password?',
//                       style: GoogleFonts.poppins(
//                         fontSize: size.customWidth(context) * 0.04,
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: size.customHeight(context) * 0.03),

//                 /// Login Button
//                 CustomButton(
//                   radius: size.customWidth(context) / 30,
//                   height: size.customHeight(context) / 14,
//                   width: double.infinity,
//                   title: "Login",
//                   onTap: () {
//                     Get.toNamed(AppRoutes.selectionScreen);
//                     // if (formKey.currentState!.validate()) {
//                     //   Get.toNamed(AppRoutes.selectionScreen);
//                     // }
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
//                       "Don't have an account?",
//                       style: GoogleFonts.poppins(
//                         fontSize: size.customWidth(context) * 0.04,
//                         color: AppColors.blackColor,
//                       ),
//                     ),
//                     SizedBox(width: size.customWidth(context) * 0.01),
//                     GestureDetector(
//                       onTap: () => Get.toNamed(AppRoutes.registration),
//                       child: Text(
//                         'Register',
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




class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Using GetX controller for password visibility for consistency with RegistrationScreen
  late final PasswordController _passwordControllerGetX;

  // A GlobalKey for the FormState, if you want to add form validation later
  final _formKey = GlobalKey<FormState>(); // Added form key for potential validation

  @override
  void initState() {
    super.initState();
    _passwordControllerGetX = Get.put(PasswordController());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // Get.delete<PasswordController>(); // Uncomment if you want to dispose the GetX controller when this screen is popped
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
            Get.back(); // Or Navigator.pop(context);
          },
        ),
        title: Center( // Centering the logo in the app bar as per RegistrationScreen design
          child: Image.asset(
            'assets/techos_cloud_logo.png', // Your logo path (ensure this path is correct)
            height: size.customHeight(context) * 0.1, // Adjusted for visual balance in app bar
                     ),
        ),
        centerTitle: true,
        actions: [
          SizedBox(width: size.customWidth(context) * 0.1), // Balance the leading icon space
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.customWidth(context) * 0.05),
        child: Form( // Wrapped with Form for potential validation, consistent with RegistrationScreen
          key: _formKey, // Assign the form key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Center the main content column
            children: [
              SizedBox(height: size.customHeight(context) * 0.05),
              Text(
                'Login Your Account',
                style: GoogleFonts.poppins(
                  fontSize: size.customWidth(context) * 0.07,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: size.customHeight(context) * 0.01),
              Text(
                'Hello there, login to continue',
                style: GoogleFonts.poppins(
                  fontSize: size.customWidth(context) * 0.04,
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(height: size.customHeight(context) * 0.04),

              // Email Input Field (reused from RegistrationScreen style)
              _buildTextField(
                context,
                controller: _emailController,
                hintText: 'Muhammad Ahmed', // Placeholder for username/email
                icon: Icons.mail_outline,
                size: size,
                keyboardType: TextInputType.emailAddress,
                validator: (val) { // Added basic validation for consistency
                  if (val == null || val.trim().isEmpty) return "Email is required";
                  if (!val.contains("@") || !val.contains(".")) return "Enter valid email";
                  return null;
                },
              ),
              SizedBox(height: size.customHeight(context) * 0.025),

              // Password Input Field (reused from RegistrationScreen style, using GetX controller)
              Obx(
                () => _buildPasswordField(
                  context,
                  controller: _passwordController,
                  hintText: '• • • • • • • •',
                  icon: Icons.lock_outline,
                  size: size,
                  obscureText: _passwordControllerGetX.isPasswordHidden.value,
                  onVisibilityToggle: _passwordControllerGetX.togglePasswordVisibility,
                  validator: (val) { // Added basic validation for consistency
                    if (val == null || val.isEmpty) return "Password is required";
                    return null;
                  },
                ),
              ),
              SizedBox(height: size.customHeight(context) * 0.015),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Handle Forgot Password
                    print('Forgot Password tapped!');
                  },
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.poppins(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: size.customWidth(context) * 0.038,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.customHeight(context) * 0.03),

              // Login Button (reused from RegistrationScreen style)
              _buildPrimaryButton(
                context,
                title: "Login",
                size: size,
                onTap: () {
                  if (_formKey.currentState!.validate()) { // Validate form on button press
                    print('Login button pressed!');
                    print('Email: ${_emailController.text}');
                    print('Password: ${_passwordController.text}');
                    Get.toNamed(AppRoutes.selectionScreen);
                  }
                },

              ),
              SizedBox(height: size.customHeight(context) * 0.03),

              // "Or Continue with social accounts" divider (reused from RegistrationScreen)
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

              // Don't have an account? Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.038,
                      color: AppColors.blackColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.registration); // Navigate to Registration Screen
                      print('Register tapped!');
                    },
                    child: Text(
                      'Register',
                      style: GoogleFonts.poppins(
                        fontSize: size.customWidth(context) * 0.038,
                        fontWeight: FontWeight.w700, // Matched RegistrationScreen's weight
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline, // Added underline
                        decorationColor: AppColors.primaryColor, // Underline color
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

  // Reusable TextField builder (from RegistrationScreen)
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
        cursorColor: AppColors.primaryColor,
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
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
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

  // Reusable PasswordField builder (from RegistrationScreen)
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
        cursorColor: AppColors.primaryColor,
        validator: validator,
        style: GoogleFonts.poppins(
          fontSize: size.customWidth(context) * 0.04,
          color: AppColors.blackColor,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color:AppColors.blackColor.withOpacity(0.7) ,),
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
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
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

  // Reusable Primary Button builder (from RegistrationScreen)
  Widget _buildPrimaryButton(
    BuildContext context, {
    required String title,
    required CustomSize size,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: size.customHeight(context) * 0.07,
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

  // Reusable Social Icon button (circular, from RegistrationScreen)
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