import 'package:etech_cricket_app/components/playerDrawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();

    return Scaffold(
      endDrawer: const PlayerDrawerMenu(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        
        elevation: 0,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: AppColors.primaryColor),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: size.customHeight(context) * 0.05,
              width: size.customWidth(context) * 0.1,
              color: AppColors.primaryColor,
            ),
            SizedBox(width: size.customWidth(context) * 0.01),
            Text(
              'TechOS Cloud',
              style: GoogleFonts.poppins(
                fontSize: size.customWidth(context) * 0.06,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(size.customHeight(context) * 0.02),
        child: Column(
          children: [
              SizedBox(height: size.customHeight(context) * 0.05),
                GestureDetector(
  onTap: () {
    // Get.toNamed(AppRoutes.home);
  },
  child: Card(
    elevation: 5,
    child: Container(
       padding: EdgeInsets.only(left:size.customHeight(context) * 0.02,top:size.customHeight(context) * 0.05),      
      decoration: BoxDecoration(
        border: Border.all(
          width: size.customHeight(context) * 0.001,
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(
          size.customHeight(context) * 0.01,
        ),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image on the left
              Container(
               
                margin: EdgeInsets.only(
                  bottom: size.customHeight(context) * 0.05,
                ),
                padding: EdgeInsets.only(left: size.customHeight(context) * 0.01,right: size.customHeight(context) * 0.01,top: size.customHeight(context) * 0.03,bottom: size.customHeight(context) * 0.03),
                decoration: BoxDecoration(
                  color: AppColors.yellowColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(
                    size.customHeight(context) * 0.02,
                  ),
                ),
                child: Image.asset(
                  'assets/recording.png',
                  height: size.customHeight(context) * 0.12,
                  width: size.customWidth(context) * 0.20,
                ),
              ),
              SizedBox(width: size.customWidth(context) * 0.04),
              
              // Texts on the right
              Expanded(
                child: Container(
                   margin: EdgeInsets.only(
                  bottom: size.customHeight(context) * 0.05,
                ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Live Stats & Video Recording",
                        style: GoogleFonts.poppins(
                          fontSize: size.customWidth(context) * 0.05,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: size.customHeight(context) * 0.005),
                      Text(
                        "See your swing stats in real time",
                        style: GoogleFonts.poppins(
                          fontSize: size.customWidth(context) * 0.037,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Bottom right press-hand icon
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(left: size.customHeight(context) * 0.015,right: size.customHeight(context) * 0.015,top: size.customHeight(context) * 0.02,bottom: size.customHeight(context) * 0.02),
                decoration: BoxDecoration(
                  color: AppColors.yellowColor.withOpacity(0.7),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(size.customHeight(context) * 0.01,))
                
                ),
              child: Icon(
                Icons.pan_tool_alt_outlined,
                size: size.customWidth(context) * 0.06,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

//                    SizedBox(height: size.customHeight(context) * 0.05),
//                   GestureDetector(
//   onTap: () {
//     // Get.toNamed(AppRoutes.home);
//   },
//   child: Card(
//     elevation: 5,
//     child: Container(
//       padding: EdgeInsets.only(
//         left: size.customHeight(context) * 0.02,
//         top: size.customHeight(context) * 0.05,
//       ),
//       decoration: BoxDecoration(
//         border: Border.all(
//           width: size.customHeight(context) * 0.001,
//           color: AppColors.primaryColor,
//         ),
//         borderRadius: BorderRadius.circular(
//           size.customHeight(context) * 0.01,
//         ),
//       ),
//       child: Stack(
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Rounded rectangle image container
//               Container(
//                 margin: EdgeInsets.only(
//                   bottom: size.customHeight(context) * 0.05,
//                 ),
//                 padding: EdgeInsets.only(left: size.customHeight(context) * 0.015,right: size.customHeight(context) * 0.015,top: size.customHeight(context) * 0.04,bottom: size.customHeight(context) * 0.04),
//                 decoration: BoxDecoration(
//                   color: AppColors.yellowColor.withOpacity(0.7),
//                   borderRadius: BorderRadius.circular(
//                     size.customHeight(context) * 0.02,
//                   ),
//                 ),
//                 child: Image.asset(
//                   'assets/recording.png',
//                   height: size.customHeight(context) * 0.10,
//                   width: size.customWidth(context) * 0.18,
//                 ),
//               ),
//               SizedBox(width: size.customWidth(context) * 0.04),

//               // Text column
//               Expanded(
//                 child: Container(
//                    margin: EdgeInsets.only(
//                   bottom: size.customHeight(context) * 0.02,
//                 ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Video Recording",
//                         style: GoogleFonts.poppins(
//                           fontSize: size.customWidth(context) * 0.05,
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.blackColor,
//                         ),
//                       ),
//                       SizedBox(height: size.customHeight(context) * 0.005),
//                       Text(
//                         "Record your game manually",
//                         style: GoogleFonts.poppins(
//                           fontSize: size.customWidth(context) * 0.037,
//                           color: AppColors.greyColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           // Bottom-right hand press icon
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: Container(
//               padding: EdgeInsets.only(left: size.customHeight(context) * 0.015,right: size.customHeight(context) * 0.015,top: size.customHeight(context) * 0.02,bottom: size.customHeight(context) * 0.02),
//                 decoration: BoxDecoration(
//                   color: AppColors.yellowColor.withOpacity(0.7),
//                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(size.customHeight(context) * 0.01,))
                
//                 ),
//               child: Icon(
//                 Icons.pan_tool_alt_outlined,
//                 size: size.customWidth(context) * 0.06,
//                 color: AppColors.primaryColor,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// ),

                
          ],
        ),
      ),
    );
  }
}
