// import 'dart:async';

// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';
// import 'package:etech_cricket_app/routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {

//   @override
//   void initState() {
//     // // TODO: implement initState
//     Timer(Duration(seconds: 3), (){
//           Get.toNamed(AppRoutes.login);

//     });
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();

//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
          
//             Image.asset(
//               'assets/logo.png',
//               height: size.customHeight(context) * 0.22,
//               width: size.customWidth(context) * 0.3,
//               color: AppColors.whiteColor,
//             ),
//             SizedBox(height: size.customHeight(context) * 0.01),          
//             Text(
//               'TechOS Cloud',
//               style: GoogleFonts.poppins(
//                 fontSize: size.customWidth(context) * 0.1,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.whiteColor,
//                 letterSpacing: 2,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:etech_cricket_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _imageAnimation;
  late Animation<Offset> _textAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _imageAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _textAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      Get.toNamed(AppRoutes.login);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.customWidth(context) * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: SlideTransition(
                  position: _imageAnimation,
                  child: Image.asset(
                    'assets/logo.png',
                    height: size.customHeight(context) * 0.22,
                    color: AppColors.whiteColor,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(width: size.customWidth(context) * 0.02),
              Flexible(
                flex: 2,
                child: SlideTransition(
                  position: _textAnimation,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'TechOS Cloud',
                      style: GoogleFonts.poppins(
                        fontSize: size.customWidth(context) * 0.1,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                        letterSpacing: 2,
                      ),
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
