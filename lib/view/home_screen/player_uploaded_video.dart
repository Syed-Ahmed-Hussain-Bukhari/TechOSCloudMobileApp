// import 'package:etech_cricket_app/view/home_screen/uploaded_dashboard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';
// import 'package:etech_cricket_app/controller/upload_controller.dart';
// import 'package:etech_cricket_app/components/drawer.dart';

// class PlayerHomeScreen extends StatelessWidget {
//   const PlayerHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();
//     final uploadController = Get.put(UploadController());

//     return Scaffold(
//       endDrawer: const DrawerMenu(),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: AppColors.whiteColor,
//         elevation: 0,
//         actions: [
//           Builder(
//             builder: (context) => IconButton(
//               icon: const Icon(Icons.menu, color: AppColors.primaryColor),
//               onPressed: () {
//                 Scaffold.of(context).openEndDrawer();
//               },
//             ),
//           ),
//         ],
//         title: Row(
//           children: [
//             Image.asset(
//               'assets/logo.png',
//               height: size.customHeight(context) * 0.05,
//               width: size.customWidth(context) * 0.1,
//               color: AppColors.primaryColor,
//             ),
//             SizedBox(width: size.customWidth(context) * 0.01),
//             Text(
//               'TechOS Cloud',
//               style: GoogleFonts.poppins(
//                 fontSize: size.customWidth(context) * 0.06,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.primaryColor,
//                 letterSpacing: 2,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(size.customHeight(context) * 0.02),
//         child: Column(
//           children: [
//             SizedBox(height: size.customHeight(context) * 0.05),
//             GestureDetector(
//              onTap: () async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//     type: FileType.video,
//   );
//           if (result != null && result.files.single.path != null) {
//             uploadController.setVideoPath(result.files.single.path!);
//             Get.snackbar("Upload Successful", "Video ready to preview!",
//                 snackPosition: SnackPosition.BOTTOM);

//             // Get.to(() => const VideoPreviewScreen());
//           }
// },

//               child: Card(
//                 elevation: 5,
//                 child: Container(
//                   padding: EdgeInsets.only(
//                       left: size.customHeight(context) * 0.02,
//                       top: size.customHeight(context) * 0.05),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                         width: size.customHeight(context) * 0.001,
//                         color: AppColors.primaryColor),
//                     borderRadius: BorderRadius.circular(
//                         size.customHeight(context) * 0.01),
//                   ),
//                   child: Stack(
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(
//                                 bottom: size.customHeight(context) * 0.05),
//                             padding: EdgeInsets.all(
//                                 size.customHeight(context) * 0.03),
//                             decoration: BoxDecoration(
//                               color: AppColors.yellowColor.withOpacity(0.7),
//                               borderRadius: BorderRadius.circular(
//                                   size.customHeight(context) * 0.02),
//                             ),
//                             child: Image.asset(
//                               'assets/recording.png',
//                               height: size.customHeight(context) * 0.12,
//                               width: size.customWidth(context) * 0.20,
//                             ),
//                           ),
//                           SizedBox(width: size.customWidth(context) * 0.04),
//                           Expanded(
//                             child: Container(
//                               margin: EdgeInsets.only(
//                                   bottom: size.customHeight(context) * 0.05),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Live Stats & Video Recording",
//                                     style: GoogleFonts.poppins(
//                                       fontSize:
//                                           size.customWidth(context) * 0.05,
//                                       fontWeight: FontWeight.bold,
//                                       color: AppColors.blackColor,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                       height:
//                                           size.customHeight(context) * 0.005),
//                                   Text(
//                                     "See your swing stats in real time",
//                                     style: GoogleFonts.poppins(
//                                       fontSize:
//                                           size.customWidth(context) * 0.037,
//                                       color: AppColors.greyColor,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: Container(
//                           padding: EdgeInsets.all(
//                               size.customHeight(context) * 0.02),
//                           decoration: BoxDecoration(
//                               color: AppColors.yellowColor.withOpacity(0.7),
//                               borderRadius: BorderRadius.only(
//                                   bottomRight: Radius.circular(
//                                       size.customHeight(context) * 0.01))),
//                           child: Icon(
//                             Icons.pan_tool_alt_outlined,
//                             size: size.customWidth(context) * 0.06,
//                             color: AppColors.primaryColor,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/view/home_screen/player_home_screen.dart

import 'package:etech_cricket_app/view/home_screen/uploaded_dashboard.dart';
import 'package:etech_cricket_app/view/playerVideos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:etech_cricket_app/controller/upload_controller.dart';
import 'package:etech_cricket_app/components/playerDrawer.dart';

class PlayerHomeScreen extends StatelessWidget {
  const PlayerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();
    final uploadController = Get.put(UploadController(), permanent: true);

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
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.video,
                );

                if (result != null && result.files.single.path != null) {
                  final path = result.files.single.path!;
                  final name = result.files.single.name;

                  uploadController.addVideo(name, path);

                  Get.snackbar(
                    "Upload Successful",
                    "Video ready to preview!",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
                // Get.to(PlayerVideosScreen());
              },
              child: Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.only(
                    left: size.customHeight(context) * 0.02,
                    top: size.customHeight(context) * 0.05,
                  ),
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
                          Container(
                            margin: EdgeInsets.only(
                              bottom: size.customHeight(context) * 0.05,
                            ),
                            padding: EdgeInsets.all(
                              size.customHeight(context) * 0.03,
                            ),
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
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(
                            size.customHeight(context) * 0.02,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.yellowColor.withOpacity(0.7),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(
                                size.customHeight(context) * 0.01,
                              ),
                            ),
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
          ],
        ),
      ),
    );
  }
}
