// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:etech_cricket_app/controller/upload_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';
// import 'package:etech_cricket_app/controller/upload_controller.dart';
// import 'package:etech_cricket_app/components/drawer.dart';

// Widget _buildUploadedVideos(BuildContext context) {
//   final size = CustomSize();
//   final uploadController = Get.find<UploadController>();

//   return Obx(() {
//     if (uploadController.uploadedVideoPath.value.isEmpty) {
//       return Center(
//         child: Text(
//           "No video uploaded",
//           style: GoogleFonts.poppins(
//             fontSize: size.customWidth(context) * 0.045,
//             fontWeight: FontWeight.w500,
//             color: AppColors.greyColor,
//           ),
//         ),
//       );
//     } else {
//       return FutureBuilder(
//         future: Future.delayed(Duration(milliseconds: 100)), // ensure widget mount
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return VideoPlayerWidget(videoPath: uploadController.uploadedVideoPath.value);
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       );
//     }
//   });
// }

// class VideoPlayerWidget extends StatefulWidget {
//   final String videoPath;
//   const VideoPlayerWidget({super.key, required this.videoPath});

//   @override
//   State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
// }

// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.file(
//       File(widget.videoPath),
//     )..initialize().then((_) {
//         setState(() {});
//         _controller.play();
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _controller.value.isInitialized
//         ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//         : Center(child: CircularProgressIndicator());
//   }
// }


/// main code

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';
// import 'package:etech_cricket_app/controller/upload_controller.dart';

// class VideoPreviewScreen extends StatelessWidget {
//   const VideoPreviewScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();

//     final uploadController = Get.isRegistered<UploadController>()
//         ? Get.find<UploadController>()
//         : Get.put(UploadController());

//     return Scaffold(
//       backgroundColor: const Color(0xFF1C1C2D),
//       body: Column(
//         children: [
//           // Custom AppBar Container
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

//           // Video player body
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.all(size.customHeight(context) * 0.02),
//               child: Obx(() {
//                 final path = uploadController.uploadedVideoPath.value;

//                 if (path.isEmpty || !File(path).existsSync()) {
//                   return Center(
//                     child: Text(
//                       "No video uploaded",
//                       style: GoogleFonts.poppins(
//                         fontSize: size.customWidth(context) * 0.045,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.grey.shade400,
//                       ),
//                     ),
//                   );
//                 } else {
//                   return Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(16),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.4),
//                           blurRadius: 12,
//                           offset: const Offset(0, 6),
//                         ),
//                       ],
//                     ),
//                     child: ChewieVideoPlayer(videoPath: path),
//                   );
//                 }
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChewieVideoPlayer extends StatefulWidget {
//   final String videoPath;

//   const ChewieVideoPlayer({super.key, required this.videoPath});

//   @override
//   State<ChewieVideoPlayer> createState() => _ChewieVideoPlayerState();
// }

// class _ChewieVideoPlayerState extends State<ChewieVideoPlayer> {
//   late VideoPlayerController _videoPlayerController;
//   ChewieController? _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     _videoPlayerController = VideoPlayerController.file(File(widget.videoPath))
//       ..initialize().then((_) {
//         _chewieController = ChewieController(
//           videoPlayerController: _videoPlayerController,
//           autoPlay: true,
//           looping: false,
//           allowFullScreen: true,
//           allowMuting: true,
//           showControls: true,
//           materialProgressColors: ChewieProgressColors(
//             playedColor: Colors.blueAccent,
//             handleColor: Colors.blue,
//             backgroundColor: Colors.grey,
//             bufferedColor: Colors.lightBlueAccent,
//           ),
//         );
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     _chewieController?.dispose();
//     _videoPlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _chewieController != null &&
//             _chewieController!.videoPlayerController.value.isInitialized
//         ? AspectRatio(
//             aspectRatio: _videoPlayerController.value.aspectRatio,
//             child: Chewie(controller: _chewieController!),
//           )
//         : const Center(child: CircularProgressIndicator());
//   }
// }


//
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';

class FullVideoPlayerScreen extends StatelessWidget {
  final String videoPath;

  const FullVideoPlayerScreen({super.key, required this.videoPath});

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C2D),
      body: Column(
        children: [
          // Custom AppBar
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
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                SizedBox(width: size.customWidth(context) * 0.03),
                Text(
                  "Player Video",
                  style: GoogleFonts.poppins(
                    fontSize: size.customWidth(context) * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Body
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(size.customHeight(context) * 0.02),
              child: File(videoPath).existsSync()
                  ? Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ChewieVideoPlayer(videoPath: videoPath),
                    )
                  : Center(
                      child: Text(
                        "Video file not found",
                        style: GoogleFonts.poppins(
                          fontSize: size.customWidth(context) * 0.045,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChewieVideoPlayer extends StatefulWidget {
  final String videoPath;

  const ChewieVideoPlayer({super.key, required this.videoPath});

  @override
  State<ChewieVideoPlayer> createState() => _ChewieVideoPlayerState();
}

class _ChewieVideoPlayerState extends State<ChewieVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.videoPath));
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      allowFullScreen: true,
      allowMuting: true,
      showControls: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.blueAccent,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightBlueAccent,
      ),
    );
    setState(() {});
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _chewieController != null &&
            _videoPlayerController.value.isInitialized
        ? AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: Chewie(controller: _chewieController!),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
