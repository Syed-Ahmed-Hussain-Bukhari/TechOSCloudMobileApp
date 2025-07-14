// // import 'package:etech_cricket_app/view/home_screen/uploaded_dashboard.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:file_picker/file_picker.dart';
// // import 'package:etech_cricket_app/constants/app_colors.dart';
// // import 'package:etech_cricket_app/constants/custom_size.dart';
// // import 'package:etech_cricket_app/controller/upload_controller.dart';
// // import 'package:etech_cricket_app/components/drawer.dart';

// // class PlayerHomeScreen extends StatelessWidget {
// //   const PlayerHomeScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final size = CustomSize();
// //     final uploadController = Get.put(UploadController());

// //     return Scaffold(
// //       endDrawer: const DrawerMenu(),
// //       appBar: AppBar(
// //         automaticallyImplyLeading: false,
// //         backgroundColor: AppColors.whiteColor,
// //         elevation: 0,
// //         actions: [
// //           Builder(
// //             builder: (context) => IconButton(
// //               icon: const Icon(Icons.menu, color: AppColors.primaryColor),
// //               onPressed: () {
// //                 Scaffold.of(context).openEndDrawer();
// //               },
// //             ),
// //           ),
// //         ],
// //         title: Row(
// //           children: [
// //             Image.asset(
// //               'assets/logo.png',
// //               height: size.customHeight(context) * 0.05,
// //               width: size.customWidth(context) * 0.1,
// //               color: AppColors.primaryColor,
// //             ),
// //             SizedBox(width: size.customWidth(context) * 0.01),
// //             Text(
// //               'TechOS Cloud',
// //               style: GoogleFonts.poppins(
// //                 fontSize: size.customWidth(context) * 0.06,
// //                 fontWeight: FontWeight.bold,
// //                 color: AppColors.primaryColor,
// //                 letterSpacing: 2,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //       body: Padding(
// //         padding: EdgeInsets.all(size.customHeight(context) * 0.02),
// //         child: Column(
// //           children: [
// //             SizedBox(height: size.customHeight(context) * 0.05),
// //             GestureDetector(
// //              onTap: () async {
// //   FilePickerResult? result = await FilePicker.platform.pickFiles(
// //     type: FileType.video,
// //   );
// //           if (result != null && result.files.single.path != null) {
// //             uploadController.setVideoPath(result.files.single.path!);
// //             Get.snackbar("Upload Successful", "Video ready to preview!",
// //                 snackPosition: SnackPosition.BOTTOM);

// //             // Get.to(() => const VideoPreviewScreen());
// //           }
// // },

// //               child: Card(
// //                 elevation: 5,
// //                 child: Container(
// //                   padding: EdgeInsets.only(
// //                       left: size.customHeight(context) * 0.02,
// //                       top: size.customHeight(context) * 0.05),
// //                   decoration: BoxDecoration(
// //                     border: Border.all(
// //                         width: size.customHeight(context) * 0.001,
// //                         color: AppColors.primaryColor),
// //                     borderRadius: BorderRadius.circular(
// //                         size.customHeight(context) * 0.01),
// //                   ),
// //                   child: Stack(
// //                     children: [
// //                       Row(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Container(
// //                             margin: EdgeInsets.only(
// //                                 bottom: size.customHeight(context) * 0.05),
// //                             padding: EdgeInsets.all(
// //                                 size.customHeight(context) * 0.03),
// //                             decoration: BoxDecoration(
// //                               color: AppColors.yellowColor.withOpacity(0.7),
// //                               borderRadius: BorderRadius.circular(
// //                                   size.customHeight(context) * 0.02),
// //                             ),
// //                             child: Image.asset(
// //                               'assets/recording.png',
// //                               height: size.customHeight(context) * 0.12,
// //                               width: size.customWidth(context) * 0.20,
// //                             ),
// //                           ),
// //                           SizedBox(width: size.customWidth(context) * 0.04),
// //                           Expanded(
// //                             child: Container(
// //                               margin: EdgeInsets.only(
// //                                   bottom: size.customHeight(context) * 0.05),
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Text(
// //                                     "Live Stats & Video Recording",
// //                                     style: GoogleFonts.poppins(
// //                                       fontSize:
// //                                           size.customWidth(context) * 0.05,
// //                                       fontWeight: FontWeight.bold,
// //                                       color: AppColors.blackColor,
// //                                     ),
// //                                   ),
// //                                   SizedBox(
// //                                       height:
// //                                           size.customHeight(context) * 0.005),
// //                                   Text(
// //                                     "See your swing stats in real time",
// //                                     style: GoogleFonts.poppins(
// //                                       fontSize:
// //                                           size.customWidth(context) * 0.037,
// //                                       color: AppColors.greyColor,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       Positioned(
// //                         bottom: 0,
// //                         right: 0,
// //                         child: Container(
// //                           padding: EdgeInsets.all(
// //                               size.customHeight(context) * 0.02),
// //                           decoration: BoxDecoration(
// //                               color: AppColors.yellowColor.withOpacity(0.7),
// //                               borderRadius: BorderRadius.only(
// //                                   bottomRight: Radius.circular(
// //                                       size.customHeight(context) * 0.01))),
// //                           child: Icon(
// //                             Icons.pan_tool_alt_outlined,
// //                             size: size.customWidth(context) * 0.06,
// //                             color: AppColors.primaryColor,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // lib/view/home_screen/player_home_screen.dart

// import 'package:etech_cricket_app/view/player/home_screen/uploaded_dashboard%20(1).dart';
// import 'package:etech_cricket_app/view/player/home_screen/uploaded_dashboard%20(2).dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';
// import 'package:etech_cricket_app/controller/upload_controller.dart';
// import 'package:etech_cricket_app/components/playerDrawer.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';

// class MyNewPlayerHomeScreen extends StatefulWidget {
//   const MyNewPlayerHomeScreen({super.key});

//   @override
//   State<MyNewPlayerHomeScreen> createState() => _MyNewPlayerHomeScreenState();
// }

// class _MyNewPlayerHomeScreenState extends State<MyNewPlayerHomeScreen> {
//   bool _isUploading = false;

//   Future<void> _pickAndUploadVideo() async {
//     // 1. Pick the video file
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.video,
//     );

//     if (result == null || result.files.single.path == null) {
//       Get.snackbar("Cancelled", "No video was selected.");
//       return;
//     }

//     final path = result.files.single.path!;
//     final name = result.files.single.name;
//     final uploadController = Get.find<UploadController>();

//     setState(() {
//       _isUploading = true;
//     });

//     Get.dialog(
//       const Center(
//         child: CircularProgressIndicator(),
//       ),
//       barrierDismissible: false,
//     );

//     try {
//       // 2. Prepare the multipart request
//       final request = http.MultipartRequest(
//         'POST',
//         // TODO: Replace with your production API URL
//         Uri.parse('https://pleasing-energy-production-687e.up.railway.app/analyze'),
//       );
//       request.files.add(await http.MultipartFile.fromPath('video', path));

//       // 3. Send the request
//       final response = await request.send();
//       final responseBody = await response.stream.bytesToString();

//       if (response.statusCode == 202) {
//         final data = jsonDecode(responseBody);
//         final String jobId = data['job_id'];
//         final String statusUrl = data['status_url'];

//         // 4. Poll for results
//         await _pollForResults(statusUrl, name, path, uploadController);
//       } else {
//         if (Get.isDialogOpen!) Get.back();
//         Get.snackbar(
//           "Upload Failed",
//           "Error: ${response.statusCode} - $responseBody",
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//       }
//     } catch (e) {
//       if (Get.isDialogOpen!) Get.back();
//       Get.snackbar(
//         "An Error Occurred",
//         "Could not connect to the server: $e",
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } finally {
//       setState(() {
//         _isUploading = false;
//       });
//     }
//   }

//   Future<void> _pollForResults(String statusUrl, String name, String path, UploadController uploadController) async {
//     const pollInterval = Duration(seconds: 15);
//     bool done = false;
//     while (!done) {
//       try {
//         final pollResponse = await http.get(Uri.parse(statusUrl));
//         if (pollResponse.statusCode == 200) {
//           final resultData = jsonDecode(pollResponse.body);
//           final status = resultData['status'];
//           if (status == 'complete') {
//             if (Get.isDialogOpen!) Get.back();
//             uploadController.addVideo(name, path);
//             Get.to(() => UploadedDashboard(
//               analysisData: resultData['analysis_data'],
//               videoUrl: resultData['processed_video_url'],
//             ));
//             done = true;
//           } else if (status == 'failed') {
//             if (Get.isDialogOpen!) Get.back();
//             Get.snackbar(
//               "Analysis Failed",
//               resultData['error'] ?? 'Unknown error',
//               backgroundColor: Colors.red,
//               colorText: Colors.white,
//             );
//             done = true;
//           } else {
//             // Still processing
//             await Future.delayed(pollInterval);
//           }
//         } else {
//           // Server error or job not found
//           if (Get.isDialogOpen!) Get.back();
//           Get.snackbar(
//             "Polling Error",
//             "Status: ${pollResponse.statusCode} - ${pollResponse.body}",
//             backgroundColor: Colors.red,
//             colorText: Colors.white,
//           );
//           done = true;
//         }
//       } catch (e) {
//         if (Get.isDialogOpen!) Get.back();
//         Get.snackbar(
//           "Polling Error",
//           "Could not poll for results: $e",
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//         done = true;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();
//     Get.put(UploadController(), permanent: true);

//     return Scaffold(
//       endDrawer: const PlayerDrawerMenu(),
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
//               onTap: _isUploading ? null : _pickAndUploadVideo,
//               child: Card(
//                 elevation: 5,
//                 child: Container(
//                   padding: EdgeInsets.only(
//                     left: size.customHeight(context) * 0.02,
//                     top: size.customHeight(context) * 0.05,
//                   ),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       width: size.customHeight(context) * 0.001,
//                       color: AppColors.primaryColor,
//                     ),
//                     borderRadius: BorderRadius.circular(
//                       size.customHeight(context) * 0.01,
//                     ),
//                   ),
//                   child: Stack(
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(
//                               bottom: size.customHeight(context) * 0.05,
//                             ),
//                             padding: EdgeInsets.all(
//                               size.customHeight(context) * 0.03,
//                             ),
//                             decoration: BoxDecoration(
//                               color: AppColors.yellowColor.withOpacity(0.7),
//                               borderRadius: BorderRadius.circular(
//                                 size.customHeight(context) * 0.02,
//                               ),
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
//                                 bottom: size.customHeight(context) * 0.05,
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Live Stats & Video Recording",
//                                     style: GoogleFonts.poppins(
//                                       fontSize: size.customWidth(context) * 0.05,
//                                       fontWeight: FontWeight.bold,
//                                       color: AppColors.blackColor,
//                                     ),
//                                   ),
//                                   SizedBox(height: size.customHeight(context) * 0.005),
//                                   Text(
//                                     "See your swing stats in real time",
//                                     style: GoogleFonts.poppins(
//                                       fontSize: size.customWidth(context) * 0.037,
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
//                             size.customHeight(context) * 0.02,
//                           ),
//                           decoration: BoxDecoration(
//                             color: AppColors.yellowColor.withOpacity(0.7),
//                             borderRadius: BorderRadius.only(
//                               bottomRight: Radius.circular(
//                                 size.customHeight(context) * 0.01,
//                               ),
//                             ),
//                           ),
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
//             if (_isUploading) ...[
//               const SizedBox(height: 20),
//               const CircularProgressIndicator(),
//               const SizedBox(height: 10),
//               const Text("Analyzing video, please wait..."),
//             ]
//           ],
//         ),
//       ),
//     );
//   }
// }





// import 'dart:convert';
// import 'dart:io';
// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';
// import 'package:etech_cricket_app/controller/live_stats_controller.dart';
// import 'package:etech_cricket_app/controller/player_video_controller.dart';
// import 'package:etech_cricket_app/controller/upload_controller.dart';
// import 'package:etech_cricket_app/view/player/home_screen/playerVideos.dart';
// import 'package:etech_cricket_app/components/playerDrawer.dart';
// import 'package:etech_cricket_app/view/player/home_screen/uploaded_dashboard%20(1).dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;

// class MyNewPlayerHomeScreen extends StatefulWidget {
//   const MyNewPlayerHomeScreen({super.key});

//   @override
//   State<MyNewPlayerHomeScreen> createState() => _MyNewPlayerHomeScreenState();
// }

// class _MyNewPlayerHomeScreenState extends State<MyNewPlayerHomeScreen> {
//   bool _isUploading = false;

//   final uploadController = Get.put(UploadController(), permanent: true);
//   final liveStatsController = Get.put(LiveStatsController(), permanent: true);
//   final tabController = Get.put(PlayerVideosScreenController(), permanent: true);

//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();

//     return Scaffold(
//       endDrawer: const PlayerDrawerMenu(),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: AppColors.whiteColor,
//         elevation: 0,
//         actions: [
//           Builder(
//             builder: (context) => IconButton(
//               icon: const Icon(Icons.menu, color: AppColors.primaryColor),
//               onPressed: () => Scaffold.of(context).openEndDrawer(),
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
//               onTap: () => _showUploadDialog(context, size),
//               child: Card(
//                 elevation: 5,
//                 child: Container(
//                   padding: EdgeInsets.only(
//                     left: size.customHeight(context) * 0.02,
//                     top: size.customHeight(context) * 0.05,
//                   ),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       width: size.customHeight(context) * 0.001,
//                       color: AppColors.primaryColor,
//                     ),
//                     borderRadius: BorderRadius.circular(size.customHeight(context) * 0.01),
//                   ),
//                   child: Stack(
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(bottom: size.customHeight(context) * 0.05),
//                             padding: EdgeInsets.all(size.customHeight(context) * 0.03),
//                             decoration: BoxDecoration(
//                               color: AppColors.yellowColor.withOpacity(0.7),
//                               borderRadius: BorderRadius.circular(size.customHeight(context) * 0.02),
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
//                               margin: EdgeInsets.only(bottom: size.customHeight(context) * 0.05),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Live Stats & Video Recording",
//                                     style: GoogleFonts.poppins(
//                                       fontSize: size.customWidth(context) * 0.05,
//                                       fontWeight: FontWeight.bold,
//                                       color: AppColors.blackColor,
//                                     ),
//                                   ),
//                                   SizedBox(height: size.customHeight(context) * 0.005),
//                                   Text(
//                                     "See your swing stats in real time",
//                                     style: GoogleFonts.poppins(
//                                       fontSize: size.customWidth(context) * 0.037,
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
//                           padding: EdgeInsets.all(size.customHeight(context) * 0.02),
//                           decoration: BoxDecoration(
//                             color: AppColors.yellowColor.withOpacity(0.7),
//                             borderRadius: BorderRadius.only(
//                               bottomRight: Radius.circular(size.customHeight(context) * 0.01),
//                             ),
//                           ),
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
//              if (_isUploading) ...[
//               const SizedBox(height: 20),
//               const CircularProgressIndicator(),
//               const SizedBox(height: 10),
//               const Text("Analyzing video, please wait..."),
//             ]
//           ],
//         ),
//       ),
//     );
//   }

//   void _showUploadDialog(BuildContext context, CustomSize size) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: AppColors.whiteColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(size.customHeight(context) * 0.02),
//         ),
//         title: Center(
//           child: Text(
//             'Choose an Option',
//             style: GoogleFonts.poppins(
//               fontWeight: FontWeight.bold,
//               fontSize: size.customWidth(context) * 0.05,
//               color: AppColors.primaryColor,
//             ),
//           ),
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             _dialogOption(
//               context,
//               icon: Icons.upload_file,
//               text: 'Upload Existing Video',
//               onTap: () {
//                 Navigator.pop(context);
//                 _pickAndUploadVideo();
//               },
//               size: size,
//             ),
//             SizedBox(height: size.customHeight(context) * 0.015),
//             _dialogOption(
//               context,
//               icon: Icons.videocam,
//               text: 'Record Video (Live Stats)',
//               onTap: () async {
//                 Navigator.pop(context);
//                 final picker = ImagePicker();
//                 final XFile? video = await picker.pickVideo(source: ImageSource.camera);
//                 if (video != null) {
//                   final path = video.path;
//                   final name = video.name;
//                   liveStatsController.addLiveStatsVideo(name, path);
//                   tabController.changeTab(1);
//                   Get.to(() => const PlayerVideosScreen());
//                 }
//               },
//               size: size,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _dialogOption(
//     BuildContext context, {
//     required IconData icon,
//     required String text,
//     required VoidCallback onTap,
//     required CustomSize size,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(size.customHeight(context) * 0.015),
//       child: Container(
//         padding: EdgeInsets.symmetric(
//           vertical: size.customHeight(context) * 0.015,
//           horizontal: size.customWidth(context) * 0.04,
//         ),
//         decoration: BoxDecoration(
//           color: AppColors.primaryColor.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(size.customHeight(context) * 0.015),
//         ),
//         child: Row(
//           children: [
//             Icon(icon, color: AppColors.primaryColor),
//             SizedBox(width: size.customWidth(context) * 0.03),
//             Expanded(
//               child: Text(
//                 text,
//                 style: GoogleFonts.poppins(
//                   fontSize: size.customWidth(context) * 0.04,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.blackColor,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _pickAndUploadVideo() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.video);

//     if (result == null || result.files.single.path == null) {
//       Get.snackbar("Cancelled", "No video was selected.");
//       return;
//     }

//     final path = result.files.single.path!;
//     final name = result.files.single.name;

//     setState(() => _isUploading = true);

//     Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);

//     try {
//       final request = http.MultipartRequest(
//         'POST',
//         Uri.parse('https://pleasing-energy-production-687e.up.railway.app/analyze'),
//       );
//       request.files.add(await http.MultipartFile.fromPath('video', path));

//       final response = await request.send();
//       final responseBody = await response.stream.bytesToString();

//       if (response.statusCode == 202) {
//         final data = jsonDecode(responseBody);
//         final String jobId = data['job_id'];
//         final String statusUrl = data['status_url'];

//         await _pollForResults(statusUrl, name, path);
//       } else {
//         if (Get.isDialogOpen!) Get.back();
//         Get.snackbar("Upload Failed", "Error: ${response.statusCode} - $responseBody",
//             backgroundColor: Colors.red, colorText: Colors.white);
//       }
//     } catch (e) {
//       if (Get.isDialogOpen!) Get.back();
//       Get.snackbar("Error", "Upload failed: $e", backgroundColor: Colors.red, colorText: Colors.white);
//     } finally {
//       setState(() => _isUploading = false);
//     }
//   }

//   Future<void> _pollForResults(String statusUrl, String name, String path) async {
//     const pollInterval = Duration(seconds: 15);
//     bool done = false;

//     while (!done) {
//       try {
//         final response = await http.get(Uri.parse(statusUrl));
//         if (response.statusCode == 200) {
//           final result = jsonDecode(response.body);
//           if (result['status'] == 'complete') {
//             if (Get.isDialogOpen!) Get.back();
           
//             Get.to(() => UploadedDashboard(
//                   analysisData: result['analysis_data'],
//                   videoUrl: result['processed_video_url'],
//                 ));
//             done = true;
//           } else if (result['status'] == 'failed') {
//             if (Get.isDialogOpen!) Get.back();
//             Get.snackbar("Analysis Failed", result['error'] ?? 'Unknown error',
//                 backgroundColor: Colors.red, colorText: Colors.white);
//             done = true;
//           } else {
//             await Future.delayed(pollInterval);
//           }
//         } else {
//           if (Get.isDialogOpen!) Get.back();
//           Get.snackbar("Polling Error", "Error: ${response.statusCode}", backgroundColor: Colors.red);
//           done = true;
//         }
//       } catch (e) {
//         if (Get.isDialogOpen!) Get.back();
//         Get.snackbar("Error", "Polling failed: $e", backgroundColor: Colors.red, colorText: Colors.white);
//         done = true;
//       }
//     }
//   }
// }


import 'dart:convert';
import 'dart:io';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:etech_cricket_app/controller/live_stats_controller.dart';
import 'package:etech_cricket_app/controller/player_video_controller.dart';
import 'package:etech_cricket_app/controller/upload_controller.dart';
import 'package:etech_cricket_app/view/player/home_screen/playerVideos.dart';
import 'package:etech_cricket_app/components/playerDrawer.dart';
import 'package:etech_cricket_app/view/player/home_screen/uploaded_dashboard%20(1).dart'; // Ensure this path is correct
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class MyNewPlayerHomeScreen extends StatefulWidget {
  const MyNewPlayerHomeScreen({super.key});

  @override
  State<MyNewPlayerHomeScreen> createState() => _MyNewPlayerHomeScreenState();
}

class _MyNewPlayerHomeScreenState extends State<MyNewPlayerHomeScreen> {
  bool _isUploading = false;

  final uploadController = Get.put(UploadController(), permanent: true);
  final liveStatsController = Get.put(LiveStatsController(), permanent: true);
  final tabController = Get.put(PlayerVideosScreenController(), permanent: true);

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
              onPressed: () => Scaffold.of(context).openEndDrawer(),
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
              onTap: () => _showUploadDialog(context, size),
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
                    borderRadius: BorderRadius.circular(size.customHeight(context) * 0.01),
                  ),
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: size.customHeight(context) * 0.05),
                            padding: EdgeInsets.all(size.customHeight(context) * 0.03),
                            decoration: BoxDecoration(
                              color: AppColors.yellowColor.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(size.customHeight(context) * 0.02),
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
                              margin: EdgeInsets.only(bottom: size.customHeight(context) * 0.05),
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
                          padding: EdgeInsets.all(size.customHeight(context) * 0.02),
                          decoration: BoxDecoration(
                            color: AppColors.yellowColor.withOpacity(0.7),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(size.customHeight(context) * 0.01),
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
             if (_isUploading) ...[
              const SizedBox(height: 20),
              const CircularProgressIndicator(),
              const SizedBox(height: 10),
              const Text("Analyzing video, please wait..."),
            ]
          ],
        ),
      ),
    );
  }

  void _showUploadDialog(BuildContext context, CustomSize size) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.customHeight(context) * 0.02),
        ),
        title: Center(
          child: Text(
            'Choose an Option',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: size.customWidth(context) * 0.05,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _dialogOption(
              context,
              icon: Icons.upload_file,
              text: 'Upload Existing Video',
              onTap: () {
                Navigator.pop(context);
                _pickAndUploadVideo();
              },
              size: size,
            ),
            SizedBox(height: size.customHeight(context) * 0.015),
            _dialogOption(
              context,
              icon: Icons.videocam,
              text: 'Record Video (Live Stats)',
              onTap: () async {
                Navigator.pop(context);
                final picker = ImagePicker();
                final XFile? video = await picker.pickVideo(source: ImageSource.camera);
                if (video != null) {
                  final path = video.path;
                  final name = video.name;
                  liveStatsController.addLiveStatsVideo(name, path);
                  tabController.changeTab(1);
                  Get.to(() => const PlayerVideosScreen());
                }
              },
              size: size,
            ),
          ],
        ),
      ),
    );
  }

  Widget _dialogOption(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    required CustomSize size,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size.customHeight(context) * 0.015),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.customHeight(context) * 0.015,
          horizontal: size.customWidth(context) * 0.04,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(size.customHeight(context) * 0.015),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primaryColor),
            SizedBox(width: size.customWidth(context) * 0.03),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: size.customWidth(context) * 0.04,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickAndUploadVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.video);

    if (result == null || result.files.single.path == null) {
      Get.snackbar("Cancelled", "No video was selected.");
      return;
    }

    final path = result.files.single.path!;
    final name = result.files.single.name;

    setState(() => _isUploading = true);

    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);

    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('https://pleasing-energy-production-687e.up.railway.app/analyze'),
      );
      request.files.add(await http.MultipartFile.fromPath('video', path));

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 202) {
        final data = jsonDecode(responseBody);
        final String jobId = data['job_id'];
        final String statusUrl = data['status_url'];

        // Start polling for results
        await _pollForResults(statusUrl, name, path);
      } else {
        if (Get.isDialogOpen!) Get.back();
        Get.snackbar("Upload Failed", "Error: ${response.statusCode} - $responseBody",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      if (Get.isDialogOpen!) Get.back();
      Get.snackbar("Error", "Upload failed: $e", backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      setState(() => _isUploading = false);
    }
  }

  Future<void> _pollForResults(String statusUrl, String name, String path) async {
    const pollInterval = Duration(seconds: 15); // How often to check the status
    bool done = false;

    while (!done) {
      try {
        final response = await http.get(Uri.parse(statusUrl));
        if (response.statusCode == 200) {
          final result = jsonDecode(response.body);
          
          // Check the status of the analysis job
          if (result['status'] == 'complete') {
            if (Get.isDialogOpen!) Get.back(); // Dismiss the loading dialog
           
         try {
      // Step 1: Fetch the video bytes from the provided URL.
      // This is where the actual download happens.
      final response = await http.get(Uri.parse(result['processed_video_url']));

      if (response.statusCode == 200) {
        // Step 2: Get a temporary directory to store the downloaded video.
        final tempDir = await getTemporaryDirectory();
        // Create a unique file name for the downloaded video to avoid conflicts.
        final file = File('${tempDir.path}/downloaded_video_${DateTime.now().millisecondsSinceEpoch}.mp4');
        
        // Step 3: Write the downloaded bytes to the temporary file.
        await file.writeAsBytes(response.bodyBytes);

        // Add the video to the uploadController if needed for other parts of the app.
        // This assumes uploadController.addVideo expects a name and a local file path.
        final name = 'uploaded_video_${DateTime.now().millisecondsSinceEpoch}.mp4';
        uploadController.addVideo(name, file.path); 

        // Step 4: Initialize VideoPlayerController with the local file path.
        // The video player will now play from the locally saved file.
          Get.to(() => UploadedDashboard(
                  analysisData: result['analysis_data'],
                  videoUrl: file.path,
                ));
        // Update the UI to show the video player once it's initialized.
        setState(() {});
      } else {
        // Handle cases where video download fails (e.g., 404, 500 status codes).
        Get.snackbar("Download Failed", "Failed to download the video. Status code: ${response.statusCode}");
      }
    } catch (error) {
      // Catch any errors during the download or video initialization process.
      print("Error downloading or playing video: $error"); // For detailed debugging
      Get.snackbar("Video Error", "Could not download and play the video: $error");
    }

            // Navigate to UploadedDashboard, passing the analysis data and the processed video URL.
            // The UploadedDashboard will then handle downloading and playing this video.
        
            done = true; // Stop polling
          } else if (result['status'] == 'failed') {
            if (Get.isDialogOpen!) Get.back(); // Dismiss the loading dialog
            Get.snackbar("Analysis Failed", result['error'] ?? 'Unknown error',
                backgroundColor: Colors.red, colorText: Colors.white);
            done = true; // Stop polling
          } else {
            // If not complete or failed, wait and poll again
            await Future.delayed(pollInterval);
          }
        } else {
          // Handle HTTP errors during polling (e.g., server down, invalid status URL)
          if (Get.isDialogOpen!) Get.back();
          Get.snackbar("Polling Error", "Error: ${response.statusCode}", backgroundColor: Colors.red);
          done = true; // Stop polling on error
        }
      } catch (e) {
        // Handle any other exceptions during polling (e.g., network issues)
        if (Get.isDialogOpen!) Get.back();
        Get.snackbar("Error", "Polling failed: $e", backgroundColor: Colors.red, colorText: Colors.white);
        done = true; // Stop polling on error
      }
    }
  }
}