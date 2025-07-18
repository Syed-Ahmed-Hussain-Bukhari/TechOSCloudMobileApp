// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';
// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';

// class UploadedDashboard extends StatefulWidget {
//   final Map<String, dynamic> analysisData;
//   final String videoUrl;

//   const UploadedDashboard({
//     super.key,
//     required this.analysisData,
//     required this.videoUrl,
//   });

//   @override
//   State<UploadedDashboard> createState() => _UploadedDashboardState();
// }

// class _UploadedDashboardState extends State<UploadedDashboard> {
//   late VideoPlayerController _videoPlayerController;
//   ChewieController? _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the video player with the network URL
//     _videoPlayerController =
//         VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//     _videoPlayerController.initialize().then((_) {
//       _chewieController = ChewieController(
//         videoPlayerController: _videoPlayerController,
//         autoPlay: true,
//         looping: false,
//         allowFullScreen: true,
//         materialProgressColors: ChewieProgressColors(
//           playedColor: AppColors.primaryColor,
//           handleColor: AppColors.yellowColor,
//           backgroundColor: Colors.grey,
//           bufferedColor: AppColors.primaryColor.withOpacity(0.5),
//         ),
//       );
//       setState(() {});
//     }).catchError((error) {
//       print("Error initializing video player: $error");
//       Get.snackbar("Video Error", "Could not load the processed video.");
//     });
//   }

//   @override
//   void dispose() {
//     _chewieController?.dispose();
//     _videoPlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();
//     final impacts = List<Map<String, dynamic>>.from(
//         widget.analysisData['impacts'] ?? []);

//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryColor,
//         title: Text(
//           "Analysis Dashboard",
//           style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: AppColors.whiteColor),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Get.back(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(size.customHeight(context) * 0.02),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Video Player
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: AppColors.primaryColor, width: 2),
//                 ),
//                 child: _chewieController != null &&
//                         _chewieController!
//                             .videoPlayerController.value.isInitialized
//                     ? AspectRatio(
//                         aspectRatio:
//                             _videoPlayerController.value.aspectRatio,
//                         child: Chewie(controller: _chewieController!),
//                       )
//                     : const SizedBox(
//                         height: 200,
//                         child: Center(
//                           child: CircularProgressIndicator(
//                             valueColor: AlwaysStoppedAnimation<Color>(
//                                 AppColors.primaryColor),
//                           ),
//                         ),
//                       ),
//               ),
//               SizedBox(height: size.customHeight(context) * 0.03),

//               // Summary Stats
//               _buildSummaryStats(size),
//               SizedBox(height: size.customHeight(context) * 0.03),

//               // Impact Details
//               Text(
//                 "Shot Details",
//                 style: GoogleFonts.poppins(
//                   fontSize: size.customWidth(context) * 0.05,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: size.customHeight(context) * 0.01),
//               impacts.isEmpty
//                   ? const Text("No impacts were detected in this video.")
//                   : _buildImpactList(impacts, size),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSummaryStats(CustomSize size) {
//     return GridView.count(
//       crossAxisCount: 2,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       crossAxisSpacing: size.customWidth(context) * 0.04,
//       mainAxisSpacing: size.customHeight(context) * 0.02,
//       childAspectRatio: 2.5,
//       children: [
//         _StatCard(
//           title: "Total Shots",
//           value: widget.analysisData['total_shots']?.toString() ?? '0',
//           color: Colors.orange,
//         ),
//         _StatCard(
//           title: "Max Speed",
//           value:
//               "${widget.analysisData['max_speed_kmh']?.toStringAsFixed(1) ?? '0.0'} km/h",
//           color: Colors.red,
//         ),
//         _StatCard(
//           title: "Avg. Speed",
//           value:
//               "${widget.analysisData['average_speed_kmh']?.toStringAsFixed(1) ?? '0.0'} km/h",
//           color: Colors.blue,
//         ),
//         _StatCard(
//           title: "Top Power Category",
//           value: widget.analysisData['power_hit_category'] ?? 'N/A',
//           color: Colors.green,
//         ),
//       ],
//     );
//   }

//   Widget _buildImpactList(List<Map<String, dynamic>> impacts, CustomSize size) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: impacts.length,
//       itemBuilder: (context, index) {
//         final impact = impacts[index];
//         return Card(
//           elevation: 2,
//           margin: EdgeInsets.only(bottom: size.customHeight(context) * 0.015),
//           child: ListTile(
//             leading: CircleAvatar(
//               backgroundColor: AppColors.primaryColor,
//               child: Text(
//                 "${index + 1}",
//                 style: const TextStyle(
//                     fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//             ),
//             title: Text(
//               "Speed: ${impact['speed_kmh']} km/h",
//               style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
//             ),
//             subtitle: Text(
//               "Category: ${impact['category']}",
//               style: GoogleFonts.poppins(),
//             ),
//             trailing: const Icon(Icons.show_chart, color: Colors.green),
//           ),
//         );
//       },
//     );
//   }
// }

// class _StatCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final Color color;

//   const _StatCard(
//       {required this.title, required this.value, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.15),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: color, width: 1.5),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               fontWeight: FontWeight.w600,
//               color: color,
//               fontSize: 14,
//             ),
//           ),
//           const SizedBox(height: 4),
//           FittedBox(
//             fit: BoxFit.scaleDown,
//             child: Text(
//               value,
//               style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';

// class UploadedDashboard extends StatefulWidget {
//   final Map<String, dynamic> analysisData;
//   final String videoUrl;

//   const UploadedDashboard({
//     super.key,
//     required this.analysisData,
//     required this.videoUrl,
//   });

//   @override
//   State<UploadedDashboard> createState() => _UploadedDashboardState();
// }

// class _UploadedDashboardState extends State<UploadedDashboard> {
//   late VideoPlayerController _videoPlayerController;
//   ChewieController? _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     _downloadAndPlayVideo(widget.videoUrl);
//   }

//   Future<void> _downloadAndPlayVideo(String videoUrl) async {
//     try {
//       final response = await http.get(Uri.parse(videoUrl));

//       if (response.statusCode == 200) {
//         final tempDir = await getTemporaryDirectory();
//         final file = File('${tempDir.path}/downloaded_video.mp4');
//         await file.writeAsBytes(response.bodyBytes);

//         _videoPlayerController = VideoPlayerController.file(file);
//         await _videoPlayerController.initialize();

//         _chewieController = ChewieController(
//           videoPlayerController: _videoPlayerController,
//           autoPlay: true,
//           looping: false,
//           allowFullScreen: true,
//           materialProgressColors: ChewieProgressColors(
//             playedColor: AppColors.primaryColor,
//             handleColor: AppColors.yellowColor,
//             backgroundColor: Colors.grey,
//             bufferedColor: AppColors.primaryColor.withOpacity(0.5),
//           ),
//         );

//         setState(() {});
//       } else {
//         Get.snackbar("Download Failed", "Failed to download the video.");
//       }
//     } catch (error) {
//       print("Error downloading video: $error");
//       Get.snackbar("Video Error", "Could not download and play the video.");
//     }
//   }

//   @override
//   void dispose() {
//     _chewieController?.dispose();
//     _videoPlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();
//     final impacts = List<Map<String, dynamic>>.from(
//         widget.analysisData['impacts'] ?? []);

//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryColor,
//         title: Text(
//           "Analysis Dashboard",
//           style: GoogleFonts.poppins(
//               fontWeight: FontWeight.bold, color: AppColors.whiteColor),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Get.back(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(size.customHeight(context) * 0.02),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Video Player
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: AppColors.primaryColor, width: 2),
//                 ),
//                 child: _chewieController != null &&
//                         _chewieController!
//                             .videoPlayerController.value.isInitialized
//                     ? AspectRatio(
//                         aspectRatio:
//                             _videoPlayerController.value.aspectRatio,
//                         child: Chewie(controller: _chewieController!),
//                       )
//                     : const SizedBox(
//                         height: 200,
//                         child: Center(
//                           child: CircularProgressIndicator(
//                             valueColor: AlwaysStoppedAnimation<Color>(
//                                 AppColors.primaryColor),
//                           ),
//                         ),
//                       ),
//               ),
//               SizedBox(height: size.customHeight(context) * 0.03),

//               // Summary Stats
//               _buildSummaryStats(size),
//               SizedBox(height: size.customHeight(context) * 0.03),

//               // Impact Details
//               Text(
//                 "Shot Details",
//                 style: GoogleFonts.poppins(
//                   fontSize: size.customWidth(context) * 0.05,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: size.customHeight(context) * 0.01),
//               impacts.isEmpty
//                   ? const Text("No impacts were detected in this video.")
//                   : _buildImpactList(impacts, size),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSummaryStats(CustomSize size) {
//     return GridView.count(
//       crossAxisCount: 2,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       crossAxisSpacing: size.customWidth(context) * 0.04,
//       mainAxisSpacing: size.customHeight(context) * 0.02,
//       childAspectRatio: 2.5,
//       children: [
//         _StatCard(
//           title: "Total Shots",
//           value: widget.analysisData['total_shots']?.toString() ?? '0',
//           color: Colors.orange,
//         ),
//         _StatCard(
//           title: "Max Speed",
//           value:
//               "${widget.analysisData['max_speed_kmh']?.toStringAsFixed(1) ?? '0.0'} km/h",
//           color: Colors.red,
//         ),
//         _StatCard(
//           title: "Avg. Speed",
//           value:
//               "${widget.analysisData['average_speed_kmh']?.toStringAsFixed(1) ?? '0.0'} km/h",
//           color: Colors.blue,
//         ),
//         _StatCard(
//           title: "Top Power Category",
//           value: widget.analysisData['power_hit_category'] ?? 'N/A',
//           color: Colors.green,
//         ),
//       ],
//     );
//   }

//   Widget _buildImpactList(List<Map<String, dynamic>> impacts, CustomSize size) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: impacts.length,
//       itemBuilder: (context, index) {
//         final impact = impacts[index];
//         return Card(
//           elevation: 2,
//           margin: EdgeInsets.only(bottom: size.customHeight(context) * 0.015),
//           child: ListTile(
//             leading: CircleAvatar(
//               backgroundColor: AppColors.primaryColor,
//               child: Text(
//                 "${index + 1}",
//                 style: const TextStyle(
//                     fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//             ),
//             title: Text(
//               "Speed: ${impact['speed_kmh']} km/h",
//               style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
//             ),
//             subtitle: Text(
//               "Category: ${impact['category']}",
//               style: GoogleFonts.poppins(),
//             ),
//             trailing: const Icon(Icons.show_chart, color: Colors.green),
//           ),
//         );
//       },
//     );
//   }
// }

// class _StatCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final Color color;

//   const _StatCard(
//       {required this.title, required this.value, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.15),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: color, width: 1.5),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               fontWeight: FontWeight.w600,
//               color: color,
//               fontSize: 14,
//             ),
//           ),
//           const SizedBox(height: 4),
//           FittedBox(
//             fit: BoxFit.scaleDown,
//             child: Text(
//               value,
//               style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'dart:io';
import 'package:etech_cricket_app/controller/player_video_controller.dart';
import 'package:etech_cricket_app/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';

class UploadedDashboard extends StatefulWidget {
  final Map<String, dynamic> analysisData;
  final String videoUrl;

  const UploadedDashboard({
    super.key,
    required this.analysisData,
    required this.videoUrl,
  });

  @override
  State<UploadedDashboard> createState() => _UploadedDashboardState();
}

class _UploadedDashboardState extends State<UploadedDashboard> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
   final uploadController = Get.put(UploadController(), permanent: true);   

  @override
  void initState() {
    super.initState();
    _downloadAndPlayVideo(widget.videoUrl);
  }

  Future<void> _downloadAndPlayVideo(String videoUrl) async {
    try {
      final response = await http.get(Uri.parse(videoUrl));

      if (response.statusCode == 200) {
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/downloaded_video.mp4');
        await file.writeAsBytes(response.bodyBytes);

          /// ✅ Step 1: Add video to the uploadController
      final name = 'uploaded_video_${DateTime.now().millisecondsSinceEpoch}.mp4';
       uploadController.addVideo(name, file.path);
        _videoPlayerController = VideoPlayerController.file(file);
        await _videoPlayerController.initialize();

        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          autoPlay: true,
          looping: false,
          allowFullScreen: true,
          materialProgressColors: ChewieProgressColors(
            playedColor: AppColors.primaryColor,
            handleColor: AppColors.yellowColor,
            backgroundColor: Colors.grey,
            bufferedColor: AppColors.primaryColor.withOpacity(0.5),
          ),
        );

        setState(() {});
      } else {
        Get.snackbar("Download Failed", "Failed to download the video.");
      }
    } catch (error) {
      print("Error downloading video: $error");
      Get.snackbar("Video Error", "Could not download and play the video.");
    }
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();
    final impacts = List<Map<String, dynamic>>.from(
        widget.analysisData['impacts'] ?? []);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Analysis Dashboard",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
            fontSize: size.customHeight(context) * 0.025,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
          color: AppColors.whiteColor,
              size: size.customHeight(context) * 0.03),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.customHeight(context) * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.circular(size.customHeight(context) * 0.015),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: size.customHeight(context) * 0.003,
                  ),
                ),
                child: _chewieController != null &&
                        _chewieController!
                            .videoPlayerController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio:
                            _videoPlayerController.value.aspectRatio,
                        child: Chewie(controller: _chewieController!),
                      )
                    : SizedBox(
                        height: size.customHeight(context) * 0.25,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.primaryColor),
                          ),
                        ),
                      ),
              ),
              SizedBox(height: size.customHeight(context) * 0.03),
              _buildSummaryStats(size),
              SizedBox(height: size.customHeight(context) * 0.03),
              Text(
                "Shot Details",
                style: GoogleFonts.poppins(
                  fontSize: size.customWidth(context) * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.customHeight(context) * 0.01),
              impacts.isEmpty
                  ? Text(
                      "No impacts were detected in this video.",
                      style: GoogleFonts.poppins(
                        fontSize: size.customHeight(context) * 0.018,
                      ),
                    )
                  : _buildImpactList(impacts, size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryStats(CustomSize size) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: size.customWidth(context) * 0.04,
      mainAxisSpacing: size.customHeight(context) * 0.02,
      childAspectRatio: 2.5,
      children: [
        _StatCard(
          title: "Total Shots",
          value: widget.analysisData['total_shots']?.toString() ?? '0',
          color: Colors.orange,
          size: size,
        ),
        _StatCard(
          title: "Max Speed",
          value:
              "${widget.analysisData['max_speed_kmh']?.toStringAsFixed(1) ?? '0.0'} km/h",
          color: Colors.red,
          size: size,
        ),
        _StatCard(
          title: "Avg. Speed",
          value:
              "${widget.analysisData['average_speed_kmh']?.toStringAsFixed(1) ?? '0.0'} km/h",
          color: Colors.blue,
          size: size,
        ),
        _StatCard(
          title: "Top Power Category",
          value: widget.analysisData['power_hit_category'] ?? 'N/A',
          color: Colors.green,
          size: size,
        ),
      ],
    );
  }

  Widget _buildImpactList(List<Map<String, dynamic>> impacts, CustomSize size) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: impacts.length,
      itemBuilder: (context, index) {
        final impact = impacts[index];
        return Card(
          elevation: 2,
          margin: EdgeInsets.only(bottom: size.customHeight(context) * 0.015),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: size.customHeight(context) * 0.025,
              child: Text(
                "${index + 1}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: size.customHeight(context) * 0.02,
                ),
              ),
            ),
            title: Text(
              "Speed: ${impact['speed_kmh']} km/h",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: size.customHeight(context) * 0.02,
              ),
            ),
            subtitle: Text(
              "Category: ${impact['category']}",
              style: GoogleFonts.poppins(
                fontSize: size.customHeight(context) * 0.018,
              ),
            ),
            trailing: Icon(
              Icons.show_chart,
              color: Colors.green,
              size: size.customHeight(context) * 0.03,
            ),
          ),
        );
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final CustomSize size;

  const _StatCard({
    required this.title,
    required this.value,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size.customHeight(context) * 0.015),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(size.customHeight(context) * 0.015),
        border: Border.all(color: color, width: 1.5),
      ),
      child: FittedBox( // ✅ This prevents overflow while preserving layout
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: color,
                fontSize: size.customHeight(context) * 0.018,
              ),
            ),
            SizedBox(height: size.customHeight(context) * 0.005),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: size.customHeight(context) * 0.022,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
