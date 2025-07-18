// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';
// import 'package:etech_cricket_app/routes/app_routes.dart';
// import 'package:etech_cricket_app/view/player/home_screen/player_uploaded_video.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/utils.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SelectionScreen extends StatelessWidget {
//   const SelectionScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: SingleChildScrollView(
//         child: Padding(
//            padding: EdgeInsets.all(size.customHeight(context) * 0.02),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//                 Container(
//                   margin:EdgeInsets.only(top:size.customHeight(context) * 0.08),
//                   child: Text(
//                     'Tell us About You!',
//                     style: GoogleFonts.poppins(
//                       fontSize: size.customWidth(context) * 0.06,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.blackColor,
                  
//                     ),
//                   ),
//                 ), 
          
//                 SizedBox(height: size.customHeight(context) * 0.005),
//                 Text(
//                   'Please choose an option from below',
//                   style: GoogleFonts.poppins(
//                     fontSize: size.customWidth(context) * 0.04,
//                     // fontWeight: FontWeight.bold,
//                     color: AppColors.greyColor,
                
//                   ),
//                 ), 
//                 SizedBox(height: size.customHeight(context) * 0.05),
//                 GestureDetector(
//                     onTap: (){
//                      Get.to(PlayerHomeScreen());
//                   },
//                   child: Card(elevation: 5,
//                   child:Container(
//                     padding: EdgeInsets.all(size.customHeight(context) * 0.05),
//                      decoration: BoxDecoration(
//                       border: Border.all(
//                         width: size.customHeight(context) * 0.001,
//                         color: AppColors.primaryColor
//                       ),
//                       borderRadius: BorderRadius.circular(size.customHeight(context) * 0.01)
//                      ),
//                     child: Center(
//                       child: Column(
//                         children: [
//                             Text(
//                     "I'm a Player",
//                     style: GoogleFonts.poppins(
//                       fontSize: size.customWidth(context) * 0.04,
//                       // fontWeight: FontWeight.bold,
//                       color: AppColors.blackColor,
                  
//                     ),),
//                      Center(
//                   child: Image.asset(
//                     'assets/cricket-player.png',
//                     height: size.customHeight(context) * 0.15,
//                     width: size.customWidth(context) * 0.18,
//                     // color: AppColors.primaryColor,
//                   ),
//                                 ),
//                         ],
//                       ),
//                     ),
//                   ) ,
//                   ),
//                 ),
 
//                  SizedBox(height: size.customHeight(context) * 0.05),
//                  GestureDetector(
//                   onTap: (){
//                       Get.toNamed(AppRoutes.coach);
//                   },
//                    child: Card(elevation: 5,
//                                    child:Container(
//                     padding: EdgeInsets.all(size.customHeight(context) * 0.05),
//                      decoration: BoxDecoration(
//                       border: Border.all(
//                         width: size.customHeight(context) * 0.001,
//                         color: AppColors.primaryColor
//                       ),
//                       borderRadius: BorderRadius.circular(size.customHeight(context) * 0.01)
//                      ),
//                     child: Center(
//                       child: Column(
//                         children: [
//                             Text(
//                     "I'm a Coach",
//                     style: GoogleFonts.poppins(
//                       fontSize: size.customWidth(context) * 0.04,
//                       // fontWeight: FontWeight.bold,
//                       color: AppColors.blackColor,
                                   
//                     ),),
//                      Center(
//                                    child: Image.asset(
//                     'assets/coach.png',
//                     height: size.customHeight(context) * 0.18,
//                     width: size.customWidth(context) * 0.20,
//                     // color: AppColors.primaryColor,
//                                    ),
//                                  ),
//                         ],
//                       ),
//                     ),
//                                    ) ,
//                                    ),
//                  )

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';
// import 'package:etech_cricket_app/routes/app_routes.dart';
// import 'package:etech_cricket_app/view/player/home_screen/player_uploaded_video.dart';
// import 'package:etech_cricket_app/view/startScreen/player_personal_info.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SelectionScreen extends StatefulWidget {
//   const SelectionScreen({super.key});

//   @override
//   State<SelectionScreen> createState() => _SelectionScreenState();
// }

// class _SelectionScreenState extends State<SelectionScreen> {
//   String selectedOption = '';

//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();

//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(size.customHeight(context) * 0.02),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: size.customHeight(context) * 0.08),
//               Text(
//                 'Tell us About You!',
//                 style: GoogleFonts.poppins(
//                   fontSize: size.customWidth(context) * 0.06,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.blackColor,
//                 ),
//               ),
//               SizedBox(height: size.customHeight(context) * 0.005),
//               Text(
//                 'Please choose an option from below',
//                 style: GoogleFonts.poppins(
//                   fontSize: size.customWidth(context) * 0.04,
//                   color: AppColors.greyColor,
//                 ),
//               ),
//               SizedBox(height: size.customHeight(context) * 0.05),

//               /// Player Card
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedOption = 'player';
//                   });
//                 },
//                 child: Card(
//                   elevation: 5,
//                   child: Container(
//                     padding: EdgeInsets.all(size.customHeight(context) * 0.05),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         width: size.customHeight(context) * 0.0015,
//                         color: selectedOption == 'player'
//                             ? Colors.purple
//                             : AppColors.primaryColor,
//                       ),
//                       borderRadius:
//                           BorderRadius.circular(size.customHeight(context) * 0.01),
//                     ),
//                     child: Center(
//                       child: Column(
//                         children: [
//                           Text(
//                             "I'm a Player",
//                             style: GoogleFonts.poppins(
//                               fontSize: size.customWidth(context) * 0.04,
//                               color: AppColors.blackColor,
//                             ),
//                           ),
//                           Center(
//                             child: Image.asset(
//                               'assets/cricket-player.png',
//                               height: size.customHeight(context) * 0.15,
//                               width: size.customWidth(context) * 0.18,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               SizedBox(height: size.customHeight(context) * 0.05),

//               /// Coach Card
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedOption = 'coach';
//                   });
//                 },
//                 child: Card(
//                   elevation: 5,
//                   child: Container(
//                     padding: EdgeInsets.all(size.customHeight(context) * 0.05),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         width: size.customHeight(context) * 0.0015,
//                         color: selectedOption == 'coach'
//                             ? Colors.purple
//                             : AppColors.primaryColor,
//                       ),
//                       borderRadius:
//                           BorderRadius.circular(size.customHeight(context) * 0.01),
//                     ),
//                     child: Center(
//                       child: Column(
//                         children: [
//                           Text(
//                             "I'm a Coach",
//                             style: GoogleFonts.poppins(
//                               fontSize: size.customWidth(context) * 0.04,
//                               color: AppColors.blackColor,
//                             ),
//                           ),
//                           Center(
//                             child: Image.asset(
//                               'assets/coach.png',
//                               height: size.customHeight(context) * 0.18,
//                               width: size.customWidth(context) * 0.20,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               SizedBox(height: size.customHeight(context) * 0.05),

//               /// Continue Button - only if option selected
//               if (selectedOption.isNotEmpty)
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (selectedOption == 'player') {
//                         Get.to(PlayerPersonalInformationScreen());
//                       } else if (selectedOption == 'coach') {
//                         Get.toNamed(AppRoutes.coach);
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primaryColor,
//                       padding: EdgeInsets.symmetric(
//                         vertical: size.customHeight(context) * 0.02,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(
//                           size.customHeight(context) * 0.015,
//                         ),
//                       ),
//                     ),
//                     child: Text(
//                       'Continue',
//                       style: GoogleFonts.poppins(
//                         fontSize: size.customWidth(context) * 0.045,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:etech_cricket_app/routes/app_routes.dart';
import 'package:etech_cricket_app/view/player/home_screen/player_uploaded_video.dart'; // Keep if used
import 'package:etech_cricket_app/view/startScreen/player_personal_info.dart'; // Keep if used
import 'package:etech_cricket_app/view/startScreen/player_roles_dialogBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  String selectedOption = '';

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
            SizedBox(height: size.customHeight(context) * 0.025), // Adjust to lift content slightly
            LinearProgressIndicator(
              value: 1 / 5, // STEP 1/5
              backgroundColor: AppColors.primaryColor.withOpacity(0.4),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              minHeight: size.customHeight(context) * 0.01,
            ),
            SizedBox(height: size.customHeight(context) * 0.005), // Space between progress bar and text
            Text(
              'STEP 1/5',
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
          SizedBox(width: size.customWidth(context) * 0.08), // Balance the leading icon space
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.customWidth(context) * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.customHeight(context) * 0.03), // Space after AppBar content
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tell Us About Yourself!',
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.06,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.customHeight(context) * 0.005),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
       
                children: [
                  Text(
                    'Please choose an option from below',
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.04,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.customHeight(context) * 0.03),

              // Player Card
              _buildOptionCard(
                context,
                text: "I'm a player",
                imagePath: 'assets/new_player.png', // Corrected path to match image content
                size: size,
                option: 'player',
                selectedOption: selectedOption,
                onTap: () async{
                  setState(() {
                    selectedOption = 'player';
                  });
                   final selectedExpertise = await showDialog<String?>(
                    context: context,
                    builder: (BuildContext context) {
                      return const ExpertiseSelectionDialog();
                    },
                  );
                },
              ),
              SizedBox(height: size.customHeight(context) * 0.015), // Spacing between cards

              // Coach Card
              _buildOptionCard(
                context,
                text: "I'm a coach",
                imagePath: 'assets/new_coach.png',
                size: size,
                option: 'coach',
                selectedOption: selectedOption,
                onTap: () {
                  setState(() {
                    selectedOption = 'coach';
                  });
                },
              ),
              SizedBox(height: size.customHeight(context) * 0.015),

              // Nutritionist Card
              _buildOptionCard(
                context,
                text: "I'm a nutritionist",
                imagePath: 'assets/nutritionist.png', // Assuming you have this asset
                size: size,
                option: 'nutritionist',
                selectedOption: selectedOption,
                onTap: () {
                  setState(() {
                    selectedOption = 'nutritionist';
                  });
                },
              ),
              SizedBox(height: size.customHeight(context) * 0.015),

              // Physiotherapist Card
              _buildOptionCard(
                context,
                text: "I'm a physiotherapist",
                imagePath: 'assets/physiotherapist.png', // Assuming you have this asset
                size: size,
                option: 'physiotherapist',
                selectedOption: selectedOption,
                onTap: () {
                  setState(() {
                    selectedOption = 'physiotherapist';
                  });
                },
              ),
              SizedBox(height: size.customHeight(context) * 0.015),

              // Psychiatric Card
              _buildOptionCard(
                context,
                text: "I'm a psychiatric",
                imagePath: 'assets/psychiatric.png', // Assuming you have this asset
                size: size,
                option: 'psychiatric',
                selectedOption: selectedOption,
                onTap: () {
                  setState(() {
                    selectedOption = 'psychiatric';
                  });
                },
              ),
              SizedBox(height: size.customHeight(context) * 0.04), // Space before button

              /// Continue Button
              SizedBox(
                width: double.infinity,
                height: size.customHeight(context) * 0.07,
                child: ElevatedButton(
                  onPressed:(){
                    Get.to(() => PlayerPersonalInformationScreen()); 
                  },
                  // onPressed: selectedOption.isNotEmpty
                  //     ? () {
                  //         // Define navigation logic based on selectedOption
                  //         if (selectedOption == 'player') {
                  //           Get.to(() => PlayerPersonalInformationScreen()); // Example navigation
           
                  //                } else if (selectedOption == 'coach') {
                  //           // Get.toNamed(AppRoutes.coach); // Example navigation
                  //         }
                  //         // Add more navigation for other roles
                  //          Get.to(() => PlayerPersonalInformationScreen()); // Example navigation
                  //         print('Selected: $selectedOption');
                  //       }
                  //     : null, // Disable button if no option is selected
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
                    'Continue',
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.045,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.customHeight(context) * 0.02), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }

  // Reusable widget for building each option card
  Widget _buildOptionCard(
    BuildContext context, {
    required String text,
    required String imagePath,
    required CustomSize size,
    required String option,
    required String selectedOption,
    required VoidCallback onTap,
  }) {
    bool isSelected = selectedOption == option;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: size.customWidth(context) * 0.04,
          left: size.customWidth(context) * 0.04,
          // right: size.customWidth(context) * 0.04,
          // bottom:  size.customWidth(context) * 0.04,
        ),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(size.customHeight(context) * 0.015),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.greyColor.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom:  size.customWidth(context) * 0.04,
              ),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: size.customWidth(context) * 0.045,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            Image.asset(
              imagePath,
              height: size.customHeight(context) * 0.12, // Adjusted to match image scale
              width: size.customWidth(context) * 0.17,  // Adjusted to match image scale
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}