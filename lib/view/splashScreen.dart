// // import 'dart:async';

// // import 'package:etech_cricket_app/constants/app_colors.dart';
// // import 'package:etech_cricket_app/constants/custom_size.dart';
// // import 'package:etech_cricket_app/routes/app_routes.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // import 'package:google_fonts/google_fonts.dart';

// // class SplashScreen extends StatefulWidget {
// //   const SplashScreen({super.key});

// //   @override
// //   State<SplashScreen> createState() => _SplashScreenState();
// // }

// // class _SplashScreenState extends State<SplashScreen> {

// //   @override
// //   void initState() {
// //     // // TODO: implement initState
// //     Timer(Duration(seconds: 3), (){
// //           Get.toNamed(AppRoutes.login);

// //     });
// //     super.initState();
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     final size = CustomSize();

// //     return Scaffold(
// //       backgroundColor: AppColors.primaryColor,
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
          
// //             Image.asset(
// //               'assets/logo.png',
// //               height: size.customHeight(context) * 0.22,
// //               width: size.customWidth(context) * 0.3,
// //               color: AppColors.whiteColor,
// //             ),
// //             SizedBox(height: size.customHeight(context) * 0.01),          
// //             Text(
// //               'TechOS Cloud',
// //               style: GoogleFonts.poppins(
// //                 fontSize: size.customWidth(context) * 0.1,
// //                 fontWeight: FontWeight.bold,
// //                 color: AppColors.whiteColor,
// //                 letterSpacing: 2,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:async';
// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';
// import 'package:etech_cricket_app/routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _imageAnimation;
//   late Animation<Offset> _textAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 1500),
//       vsync: this,
//     );

//     _imageAnimation = Tween<Offset>(
//       begin: const Offset(-1.5, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

//     _textAnimation = Tween<Offset>(
//       begin: const Offset(1.5, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

//     _controller.forward();

//     Timer(const Duration(seconds: 3), () {
//       Get.toNamed(AppRoutes.login);
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();

//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: size.customWidth(context) * 0.05),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Flexible(
//                 flex: 1,
//                 child: SlideTransition(
//                   position: _imageAnimation,
//                   child: Image.asset(
//                     'assets/logo.png',
//                     height: size.customHeight(context) * 0.22,
//                     color: AppColors.whiteColor,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               SizedBox(width: size.customWidth(context) * 0.02),
//               Flexible(
//                 flex: 2,
//                 child: SlideTransition(
//                   position: _textAnimation,
//                   child: FittedBox(
//                     fit: BoxFit.scaleDown,
//                     child: Text(
//                       'TechOS Cloud',
//                       style: GoogleFonts.poppins(
//                         fontSize: size.customWidth(context) * 0.1,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.whiteColor,
//                         letterSpacing: 2,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';
// import 'package:etech_cricket_app/routes/app_routes.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   final String title = 'TechOS Cloud';
//   late List<bool> _charVisible;
//   bool _logoVisible = false;

//   late AnimationController _logoController;
//   late Animation<double> _logoScale;
//   late Animation<double> _logoOpacity;

//   @override
//   void initState() {
//     super.initState();

//     _charVisible = List.generate(title.length, (_) => false);

//     _logoController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );

//     _logoScale = Tween<double>(begin: 0.7, end: 1.0).animate(
//       CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
//     );

//     _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _logoController, curve: Curves.easeIn),
//     );

//     _startMagic();

//     Timer(const Duration(seconds: 10), () {
//       Get.toNamed(AppRoutes.login);
//     });
//   }

//   void _startMagic() async {
//     for (int i = 0; i < title.length; i++) {
//       await Future.delayed(const Duration(milliseconds: 100));
//       setState(() {
//         _charVisible[i] = true;
//       });
//     }

//     await Future.delayed(const Duration(milliseconds: 300));
//     setState(() {
//       _logoVisible = true;
//     });
//     _logoController.forward();
//   }

//   @override
//   void dispose() {
//     _logoController.dispose();
//     super.dispose();
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
             
//             // Logo Magic
//            if (_logoVisible)
//   AnimatedBuilder(
//     animation: _logoController,
//     builder: (context, child) {
//       return Opacity(
//         opacity: _logoOpacity.value,
//         child: Transform.scale(
//           scale: _logoScale.value,
//           child: child,
//         ),
//       );
//     },
//     child: Image.asset(
//       'assets/logo.png',
//       height: size.customHeight(context) * 0.22,
//       width: size.customWidth(context) * 0.3,
//       color: AppColors.whiteColor,
//     ),
//   ),
//             // Text Reveal
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(title.length, (index) {
//                 final char = title[index];
//                 return AnimatedOpacity(
//                   opacity: _charVisible[index] ? 1.0 : 0.0,
//                   duration: const Duration(milliseconds: 300),
//                   child: AnimatedSlide(
//                     offset: _charVisible[index]
//                         ? Offset.zero
//                         : const Offset(0, 0.5),
//                     duration: const Duration(milliseconds: 300),
//                     child: Text(
//                       char,
//                       style: GoogleFonts.poppins(
//                         fontSize: size.customWidth(context) * 0.1,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.whiteColor,
//                         letterSpacing: 2,
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),
          

//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:etech_cricket_app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final String title = 'TechOS Cloud';
  late List<bool> _charVisible;
  bool _logoVisible = false;
  bool _sprayVisible = false;

  late AnimationController _logoController;
  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;

  late AnimationController _sprayController;

  @override
  void initState() {
    super.initState();

    _charVisible = List.generate(title.length, (_) => false);

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _logoScale = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );

    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeIn),
    );

    _sprayController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _startMagic();
                                                                                              
    Timer(const Duration(seconds: 6), () {
      Get.toNamed(AppRoutes.login);
    });
  }

  void _startMagic() async {
    for (int i = 0; i < title.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        _charVisible[i] = true;
      });
    }

    // Spray Effect
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      _sprayVisible = true;
    });
    _sprayController.forward();

    // Logo appears during spray
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _logoVisible = true;
    });
    _logoController.forward();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _sprayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

             // Logo Magic
                if (_logoVisible)
                  AnimatedBuilder(
                    animation: _logoController,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _logoOpacity.value,
                        child: Transform.scale(
                          scale: _logoScale.value,
                          child: child,
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/logo.png',
                      height: size.customHeight(context) * 0.22,
                      width: size.customWidth(context) * 0.3,
                      color: AppColors.whiteColor,
                    ),
                  ),
                // Text Reveal
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(title.length, (index) {
                    final char = title[index];
                    return AnimatedOpacity(
                      opacity: _charVisible[index] ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: AnimatedSlide(
                        offset: _charVisible[index]
                            ? Offset.zero
                            : const Offset(0, 0.5),
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          char,
                          style: GoogleFonts.poppins(
                            fontSize: size.customWidth(context) * 0.1,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
               
              ],
            ),

            // Spray Magic
            if (_sprayVisible)
              AnimatedBuilder(
                animation: _sprayController,
                builder: (context, _) {
                  return CustomPaint(
                    size: Size(size.customWidth(context), 200),
                    painter: SprayPainter(_sprayController.value),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}


class SprayPainter extends CustomPainter {
  final double progress;

  SprayPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1 * (1 - progress))
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < 100; i++) {
      final angle = 2 * pi * i / 100;
      final radius = progress * 100 + Random().nextDouble() * 30;
      final offset = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      canvas.drawCircle(offset, 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant SprayPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
