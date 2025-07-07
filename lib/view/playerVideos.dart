// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';
// import 'package:etech_cricket_app/constants/app_colors.dart';

// class PlayerVideosScreenController extends GetxController {
//   var selectedTabIndex = 0.obs;

//   void changeTab(int index) {
//     selectedTabIndex.value = index;
//   }
// }

// class PlayerVideosScreen extends StatelessWidget {
//   const PlayerVideosScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();
//     final controller = Get.put(PlayerVideosScreenController());

//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Top colored header bar
//           Container(
//             padding: EdgeInsets.only(left: size.customWidth(context) * 0.03),
//             height: size.customHeight(context) * 0.13,
//             width: double.infinity,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: AppColors.primaryColor,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(size.customWidth(context) * 0.02),
//                 bottomRight: Radius.circular(size.customWidth(context) * 0.03),
//               ),
//             ),
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: (){
//                     Get.back();
//                   },
//                   child: Icon(Icons.arrow_back,color: Colors.white,)),
//                 SizedBox(width: size.customWidth(context) * 0.03,),
//                 Text(
//                   "Player Video",
//                   style: GoogleFonts.poppins(
//                     fontSize: size.customWidth(context) * 0.06,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           SizedBox(height: size.customHeight(context) * 0.03),

//           // Tabs: Uploaded | Live Stats
//           Obx(() => Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   GestureDetector(
//                     onTap: () => controller.changeTab(0),
//                     child: Text(
//                       'Uploaded',
//                       style: GoogleFonts.poppins(
//                         fontSize: size.customWidth(context) * 0.045,
//                         fontWeight: FontWeight.w700,
//                         color: controller.selectedTabIndex.value == 0
//                             ? AppColors.primaryColor
//                             : AppColors.blackColor,
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () => controller.changeTab(1),
//                     child: Text(
//                       'Live Stats',
//                       style: GoogleFonts.poppins(
//                         fontSize: size.customWidth(context) * 0.045,
//                         fontWeight: FontWeight.w700,
//                         color: controller.selectedTabIndex.value == 1
//                             ? AppColors.primaryColor
//                             : AppColors.blackColor,
//                       ),
//                     ),
//                   ),
//                 ],
//               )),

//           SizedBox(height: size.customHeight(context) * 0.015),

//           // Underline indicator
//           Obx(() => Container(
//                 margin:
//                     EdgeInsets.symmetric(horizontal: size.customWidth(context) * 0.05),
//                 height: 3.5,
//                 width: double.infinity,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         color: controller.selectedTabIndex.value == 0
//                             ? AppColors.primaryColor
//                             : Colors.grey.shade300,
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         color: controller.selectedTabIndex.value == 1
//                             ? AppColors.primaryColor
//                             : Colors.grey.shade300,
//                       ),
//                     ),
//                   ],
//                 ),
//               )),

//           SizedBox(height: size.customHeight(context) * 0.02),

//           // Tab body
//           Expanded(
//             child: Obx(() => controller.selectedTabIndex.value == 0
//                 ? _buildUploadedVideos(context)
//                 : _buildLiveStats(context)),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildUploadedVideos(BuildContext context) {
//     final size = CustomSize();
//     return Center(
//       child: Text(
//         "Uploaded Recorded Videos",
//         style: GoogleFonts.poppins(
//           fontSize: size.customWidth(context) * 0.045,
//           fontWeight: FontWeight.w500,
//           color: AppColors.blackColor,
//         ),
//       ),
//     );
//   }

//   Widget _buildLiveStats(BuildContext context) {
//     final size = CustomSize();
//     return Center(
//       child: Text(
//         "Live Stats Videos",
//         style: GoogleFonts.poppins(
//           fontSize: size.customWidth(context) * 0.045,
//           fontWeight: FontWeight.w500,
//           color: AppColors.blackColor,
//         ),
//       ),
//     );
//   }
// }


// // lib/view/home_screen/uploaded_dashboard.dart

// import 'dart:io';
// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';
// import 'package:etech_cricket_app/controller/upload_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:video_player/video_player.dart';

// class PlayerVideosScreenController extends GetxController {
//   var selectedTabIndex = 0.obs;

//   void changeTab(int index) {
//     selectedTabIndex.value = index;
//   }
// }

// class PlayerVideosScreen extends StatelessWidget {
//   const PlayerVideosScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();
//     final controller = Get.put(PlayerVideosScreenController());
//     final uploadController = Get.find<UploadController>();

//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: EdgeInsets.only(left: size.customWidth(context) * 0.03),
//             height: size.customHeight(context) * 0.13,
//             width: double.infinity,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: AppColors.primaryColor,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(size.customWidth(context) * 0.02),
//                 bottomRight: Radius.circular(size.customWidth(context) * 0.03),
//               ),
//             ),
//             child: Row(
//               children: [
//                 GestureDetector(
//                     onTap: () {
//                       Get.back();
//                     },
//                     child: const Icon(Icons.arrow_back, color: Colors.white)),
//                 SizedBox(width: size.customWidth(context) * 0.03),
//                 Text(
//                   "Player Video",
//                   style: GoogleFonts.poppins(
//                     fontSize: size.customWidth(context) * 0.06,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: size.customHeight(context) * 0.03),
//           Obx(() => Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   GestureDetector(
//                     onTap: () => controller.changeTab(0),
//                     child: Text(
//                       'Uploaded',
//                       style: GoogleFonts.poppins(
//                         fontSize: size.customWidth(context) * 0.045,
//                         fontWeight: FontWeight.w700,
//                         color: controller.selectedTabIndex.value == 0
//                             ? AppColors.primaryColor
//                             : AppColors.blackColor,
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () => controller.changeTab(1),
//                     child: Text(
//                       'Live Stats',
//                       style: GoogleFonts.poppins(
//                         fontSize: size.customWidth(context) * 0.045,
//                         fontWeight: FontWeight.w700,
//                         color: controller.selectedTabIndex.value == 1
//                             ? AppColors.primaryColor
//                             : AppColors.blackColor,
//                       ),
//                     ),
//                   ),
//                 ],
//               )),
//           SizedBox(height: size.customHeight(context) * 0.015),
//           Obx(() => Container(
//                 margin: EdgeInsets.symmetric(
//                     horizontal: size.customWidth(context) * 0.05),
//                 height: 3.5,
//                 width: double.infinity,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         color: controller.selectedTabIndex.value == 0
//                             ? AppColors.primaryColor
//                             : Colors.grey.shade300,
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         color: controller.selectedTabIndex.value == 1
//                             ? AppColors.primaryColor
//                             : Colors.grey.shade300,
//                       ),
//                     ),
//                   ],
//                 ),
//               )),
//           SizedBox(height: size.customHeight(context) * 0.02),
//           Expanded(
//             child: Obx(() => controller.selectedTabIndex.value == 0
//                 ? _buildUploadedVideos(context, uploadController)
//                 : _buildLiveStats(context)),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildUploadedVideos(
//       BuildContext context, UploadController uploadController) {
//     final size = CustomSize();

//     final videos = uploadController.uploadedVideos.values.toList();
//     if (videos.isEmpty) {
//       return Center(
//         child: Text(
//           "No uploaded recorded videos",
//           style: GoogleFonts.poppins(
//             fontSize: size.customWidth(context) * 0.045,
//             fontWeight: FontWeight.w500,
//             color: AppColors.blackColor,
//           ),
//         ),
//       );
//     }

//     return ListView.separated(
//       padding: EdgeInsets.symmetric(
//         vertical: size.customHeight(context) * 0.02,
//         horizontal: size.customWidth(context) * 0.04,
//       ),
//       itemCount: videos.length,
//       separatorBuilder: (_, __) => SizedBox(
//         height: size.customHeight(context) * 0.02,
//       ),
//       itemBuilder: (context, index) {
//         final entry = uploadController.uploadedVideos.entries.toList()[index];
//         return _VideoCard(
//           videoName: entry.key,
//           videoPath: entry.value,
//         );
//       },
//     );
//   }

//   Widget _buildLiveStats(BuildContext context) {
//     final size = CustomSize();
//     return Center(
//       child: Text(
//         "Live Stats Videos",
//         style: GoogleFonts.poppins(
//           fontSize: size.customWidth(context) * 0.045,
//           fontWeight: FontWeight.w500,
//           color: AppColors.blackColor,
//         ),
//       ),
//     );
//   }
// }

// class _VideoCard extends StatefulWidget {
//   final String videoName;
//   final String videoPath;

//   const _VideoCard({required this.videoName, required this.videoPath});

//   @override
//   State<_VideoCard> createState() => _VideoCardState();
// }

// class _VideoCardState extends State<_VideoCard> {
//   late VideoPlayerController _controller;
//   bool _initialized = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.file(File(widget.videoPath))
//       ..initialize().then((_) {
//         setState(() {
//           _initialized = true;
//         });
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();

//     return Card(
//       elevation: 3,
//       child: Padding(
//         padding: EdgeInsets.all(size.customHeight(context) * 0.015),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.videoName,
//               style: GoogleFonts.poppins(
//                 fontSize: size.customWidth(context) * 0.042,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(height: size.customHeight(context) * 0.01),
//             _initialized
//                 ? AspectRatio(
//                     aspectRatio: _controller.value.aspectRatio,
//                     child: VideoPlayer(_controller),
//                   )
//                 : const Center(child: CircularProgressIndicator()),
//             SizedBox(height: size.customHeight(context) * 0.01),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: Icon(
//                     _controller.value.isPlaying
//                         ? Icons.pause
//                         : Icons.play_arrow,
//                     color: AppColors.primaryColor,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _controller.value.isPlaying
//                           ? _controller.pause()
//                           : _controller.play();
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:etech_cricket_app/controller/upload_controller.dart';
import 'package:etech_cricket_app/view/home_screen/uploaded_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class PlayerVideosScreenController extends GetxController {
  var selectedTabIndex = 0.obs;

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }
}

class PlayerVideosScreen extends StatelessWidget {
  const PlayerVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();
    final controller = Get.put(PlayerVideosScreenController());
    final uploadController = Get.find<UploadController>();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: size.customWidth(context) * 0.03),
            height: size.customHeight(context) * 0.13,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(size.customWidth(context) * 0.02),
                bottomRight: Radius.circular(size.customWidth(context) * 0.03),
              ),
            ),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back, color: Colors.white)),
                SizedBox(width: size.customWidth(context) * 0.03),
                Text(
                  "Player Video's",
                  style: GoogleFonts.poppins(
                    fontSize: size.customWidth(context) * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.customHeight(context) * 0.03),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => controller.changeTab(0),
                    child: Text(
                      'Uploaded',
                      style: GoogleFonts.poppins(
                        fontSize: size.customWidth(context) * 0.045,
                        fontWeight: FontWeight.w700,
                        color: controller.selectedTabIndex.value == 0
                            ? AppColors.primaryColor
                            : AppColors.blackColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.changeTab(1),
                    child: Text(
                      'Live Stats',
                      style: GoogleFonts.poppins(
                        fontSize: size.customWidth(context) * 0.045,
                        fontWeight: FontWeight.w700,
                        color: controller.selectedTabIndex.value == 1
                            ? AppColors.primaryColor
                            : AppColors.blackColor,
                      ),
                    ),
                  ),
                ],
              )),
          SizedBox(height: size.customHeight(context) * 0.015),
          Obx(() => Container(
                margin: EdgeInsets.symmetric(
                    horizontal: size.customWidth(context) * 0.05),
                height: 3.5,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: controller.selectedTabIndex.value == 0
                            ? AppColors.primaryColor
                            : Colors.grey.shade300,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: controller.selectedTabIndex.value == 1
                            ? AppColors.primaryColor
                            : Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(height: size.customHeight(context) * 0.02),
          Expanded(
            child: Obx(() => controller.selectedTabIndex.value == 0
                ? _buildUploadedVideos(context, uploadController)
                : _buildLiveStats(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadedVideos(
      BuildContext context, UploadController uploadController) {
    final size = CustomSize();
    final videos = uploadController.videoMap;
    if (videos.isEmpty) {
      return Center(
        child: Text(
          "No uploaded recorded videos",
          style: GoogleFonts.poppins(
            fontSize: size.customWidth(context) * 0.045,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
        ),
      );
    }

    final entries = videos.entries.toList();

    return GridView.builder(
      padding: EdgeInsets.all(size.customHeight(context) * 0.02),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        return GestureDetector(
          onTap: () {
            // Get.to(() => FullVideoPlayerScreen(videoPath: entry.value));
                Get.to(() => FullVideoPlayerScreen(videoPath: entry.value));


          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.play_circle_fill,
                      color: AppColors.primaryColor, size: 40),
                  Positioned(
                    bottom: 6,
                    left: 4,
                    right: 4,
                    child: Text(
                      entry.key,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLiveStats(BuildContext context) {
    final size = CustomSize();
    return Center(
      child: Text(
        "Live Stats Videos",
        style: GoogleFonts.poppins(
          fontSize: size.customWidth(context) * 0.045,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}


