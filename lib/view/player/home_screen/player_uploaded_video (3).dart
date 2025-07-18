

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';

// --- IMPORTANT ---
// Replace this with your actual backend URL.
// const String backendUrl = 'http://192.168.0.113:5000';
const String backendUrl = 'https://pleasing-energy-production-687e.up.railway.app';

class MyNewHomeNewScreen extends StatefulWidget {
  const MyNewHomeNewScreen({super.key});

  @override
  State<MyNewHomeNewScreen> createState() => _MyNewHomeNewScreenState();
}

enum UploadStatus { idle, picking, uploading, processing, downloading, complete, failed }

class _MyNewHomeNewScreenState extends State<MyNewHomeNewScreen> {
  String? jobId;
  UploadStatus status = UploadStatus.idle;
  Map<String, dynamic>? analysisData;
  String? processedVideoPath;
  VideoPlayerController? _videoController;

  void _resetState() {
    setState(() {
      status = UploadStatus.idle;
      analysisData = null;
      processedVideoPath = null;
      jobId = null;
      _videoController?.dispose();
      _videoController = null;
    });
  }

  Future<void> _pickAndUploadVideo() async {
    _resetState();
    
    setState(() => status = UploadStatus.picking);

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.video,
      );

      if (result == null || result.files.single.path == null) {
        setState(() => status = UploadStatus.idle);
        return;
      }
      
      setState(() => status = UploadStatus.uploading);
      
      final videoFile = result.files.single;
      var request = http.MultipartRequest('POST', Uri.parse('$backendUrl/analyze'));
      request.files.add(await http.MultipartFile.fromPath('video', videoFile.path!));

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      final responseData = jsonDecode(response.body);

      if (response.statusCode != 202) {
        throw Exception(responseData['error'] ?? 'Upload failed');
      }

      setState(() {
        jobId = responseData['job_id'];
        status = UploadStatus.processing;
      });

      _pollJobStatus(responseData['status_url']);

    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      setState(() => status = UploadStatus.failed);
    }
  }

  Future<void> _pollJobStatus(String statusUrl) async {
    Timer.periodic(const Duration(seconds: 15), (timer) async {
      if (status != UploadStatus.processing) {
        timer.cancel();
        return;
      }

      try {
        final pollResponse = await http.get(Uri.parse(statusUrl));
        final data = jsonDecode(pollResponse.body);

        if (data['status'] == 'complete') {
          timer.cancel();
          setState(() {
            analysisData = data['analysis_data'];
            status = UploadStatus.downloading;
          });
          await _downloadProcessedVideo(data['processed_video_url']);
        } else if (data['status'] == 'failed') {
          timer.cancel();
          Get.snackbar('Analysis Failed', data['error'] ?? 'An unknown error occurred.');
          setState(() => status = UploadStatus.failed);
        }
      } catch (e) {
        timer.cancel();
        Get.snackbar('Polling Error', 'Could not get results: $e');
        setState(() => status = UploadStatus.failed);
      }
    });
  }

  Future<void> _downloadProcessedVideo(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/processed_$jobId.mp4';
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      
      _videoController = VideoPlayerController.file(file)
        ..initialize().then((_) {
          setState(() {
            processedVideoPath = filePath;
            status = UploadStatus.complete;
          });
          _videoController?.play();
          _videoController?.setLooping(true);
        });
    } catch (e) {
      Get.snackbar('Download Failed', 'Could not download the processed video.');
      setState(() => status = UploadStatus.failed);
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (status == UploadStatus.complete && processedVideoPath != null && analysisData != null) {
      return _buildDashboard();
    }
    return _buildUploadScreen();
  }

  Widget _buildUploadScreen() {
    bool isProcessing = status == UploadStatus.uploading || 
                        status == UploadStatus.processing || 
                        status == UploadStatus.downloading;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isProcessing) ...[
              const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6C63FF))),
              const SizedBox(height: 20),
              Text(
                status == UploadStatus.uploading ? 'Uploading video...' :
                status == UploadStatus.processing ? 'Analyzing video, please wait...' :
                'Finalizing results...',
                style: const TextStyle(fontSize: 18, color: Color(0xFF333333), fontWeight: FontWeight.w500),
              ),
            ] else ...[
              ElevatedButton(
                onPressed: _pickAndUploadVideo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 8,
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.videocam_outlined, size: 50, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      'Upload Video from Gallery',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
            if (status == UploadStatus.failed) ...[
              const SizedBox(height: 40),
              const Text('An error occurred. Please try again.', style: TextStyle(color: Colors.red, fontSize: 16)),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickAndUploadVideo,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                child: const Text('Try Again', style: TextStyle(color: Colors.white)),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDashboard() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF6C63FF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: _resetState,
        ),
        title: const Text('Analysis Dashboard', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            if (_videoController != null && _videoController!.value.isInitialized)
              AspectRatio(
                aspectRatio: _videoController!.value.aspectRatio,
                child: VideoPlayer(_videoController!),
              )
            else
              Container(
                height: 250,
                color: Colors.black,
                child: const Center(child: CircularProgressIndicator()),
              ),
            
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  StatCard(title: "Total Shots", value: analysisData?['total_shots']?.toString() ?? '0', color: const Color(0xFFFFF3CD)),
                  StatCard(title: "Max Speed", value: analysisData?['max_speed_kmh']?.toStringAsFixed(1) ?? 'N/A', unit: "km/h", color: const Color(0xFFF8D7DA)),
                  StatCard(title: "Avg. Speed", value: analysisData?['average_speed_kmh']?.toStringAsFixed(1) ?? 'N/A', unit: "km/h", color: const Color(0xFFD1ECF1)),
                  StatCard(title: "Top Power Category", value: analysisData?['power_hit_category'] ?? 'N/A', color: const Color(0xFFD4EDDA)),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Shot Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  if (analysisData?['impacts'] != null && (analysisData?['impacts'] as List).isNotEmpty)
                    ...(analysisData!['impacts'] as List).asMap().entries.map((entry) {
                       int idx = entry.key;
                       var shot = entry.value;
                       return ShotDetailCard(shot: shot, index: idx);
                    })
                  else
                    const Center(child: Text('No impact shots detected.', style: TextStyle(color: Colors.grey))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final Color color;

  const StatCard({required this.title, required this.value, this.unit = '', required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 15,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF555555))),
          const SizedBox(height: 5),
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF222222)),
              children: [
                TextSpan(text: value),
                if (unit.isNotEmpty)
                  TextSpan(text: ' $unit', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShotDetailCard extends StatelessWidget {
  final Map<String, dynamic> shot;
  final int index;
  
  const ShotDetailCard({required this.shot, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF6C63FF),
                shape: BoxShape.circle,
              ),
              child: Center(child: Text((index + 1).toString(), style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Speed: ${shot['speed_kmh']?.toStringAsFixed(2) ?? 'N/A'} km/h', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Category: ${shot['category'] ?? 'N/A'}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
            const Icon(Icons.analytics_outlined, color: Color(0xFF6C63FF)),
          ],
        ),
      ),
    );
  }
}
//  verified code

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';
// import 'package:path_provider/path_provider.dart';
// import 'package:get/get.dart';
// import 'package:better_player/better_player.dart';

// const String backendUrl = 'https://pleasing-energy-production-687e.up.railway.app';

// class MyNewHomeNewScreen extends StatefulWidget {
//   const MyNewHomeNewScreen({super.key});

//   @override
//   State<MyNewHomeNewScreen> createState() => _MyNewHomeNewScreenState();
// }

// enum UploadStatus { idle, picking, uploading, processing, downloading, complete, failed }

// class _MyNewHomeNewScreenState extends State<MyNewHomeNewScreen> {
//   String? jobId;
//   UploadStatus status = UploadStatus.idle;
//   Map<String, dynamic>? analysisData;
//   String? processedVideoPath;
//   BetterPlayerController? _betterPlayerController;

//   void _resetState() {
//     setState(() {
//       status = UploadStatus.idle;
//       analysisData = null;
//       processedVideoPath = null;
//       jobId = null;
//       _betterPlayerController?.dispose();
//       _betterPlayerController = null;
//     });
//   }

//   Future<void> _pickAndUploadVideo() async {
//     _resetState();
//     setState(() => status = UploadStatus.picking);

//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.video,
//       );

//       if (result == null || result.files.single.path == null) {
//         setState(() => status = UploadStatus.idle);
//         return;
//       }

//       setState(() => status = UploadStatus.uploading);

//       final videoFile = result.files.single;
//       var request = http.MultipartRequest('POST', Uri.parse('$backendUrl/analyze'));
//       request.files.add(await http.MultipartFile.fromPath('video', videoFile.path!));

//       final streamedResponse = await request.send();
//       final response = await http.Response.fromStream(streamedResponse);
//       final responseData = jsonDecode(response.body);

//       if (response.statusCode != 202) {
//         throw Exception(responseData['error'] ?? 'Upload failed');
//       }

//       setState(() {
//         jobId = responseData['job_id'];
//         status = UploadStatus.processing;
//       });

//       _pollJobStatus(responseData['status_url']);

//     } catch (e) {
//       Get.snackbar('Error', 'An error occurred: $e');
//       setState(() => status = UploadStatus.failed);
//     }
//   }

//   Future<void> _pollJobStatus(String statusUrl) async {
//     Timer.periodic(const Duration(seconds: 15), (timer) async {
//       if (status != UploadStatus.processing) {
//         timer.cancel();
//         return;
//       }

//       try {
//         final pollResponse = await http.get(Uri.parse(statusUrl));
//         final data = jsonDecode(pollResponse.body);

//         if (data['status'] == 'complete') {
//           timer.cancel();
//           setState(() {
//             analysisData = data['analysis_data'];
//             status = UploadStatus.downloading;
//           });
//           await _downloadProcessedVideo(data['processed_video_url']);
//         } else if (data['status'] == 'failed') {
//           timer.cancel();
//           Get.snackbar('Analysis Failed', data['error'] ?? 'An unknown error occurred.');
//           setState(() => status = UploadStatus.failed);
//         }
//       } catch (e) {
//         timer.cancel();
//         Get.snackbar('Polling Error', 'Could not get results: $e');
//         setState(() => status = UploadStatus.failed);
//       }
//     });
//   }

//   Future<void> _downloadProcessedVideo(String url) async {
//     try {
//       final response = await http.get(Uri.parse(url));
//       final directory = await getApplicationDocumentsDirectory();
//       final filePath = '${directory.path}/processed_$jobId.mp4';
//       final file = File(filePath);
//       await file.writeAsBytes(response.bodyBytes);

//       BetterPlayerDataSource dataSource = BetterPlayerDataSource(
//         BetterPlayerDataSourceType.file,
//         file.path,
//       );

//       _betterPlayerController = BetterPlayerController(
//         const BetterPlayerConfiguration(
//           autoPlay: true,
//           looping: true,
//           aspectRatio: 16 / 9,
//           fit: BoxFit.contain,
//         ),
//         betterPlayerDataSource: dataSource,
//       );

//       setState(() {
//         processedVideoPath = filePath;
//         status = UploadStatus.complete;
//       });
//     } catch (e) {
//       Get.snackbar('Download Failed', 'Could not download the processed video.');
//       setState(() => status = UploadStatus.failed);
//     }
//   }

//   @override
//   void dispose() {
//     _betterPlayerController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (status == UploadStatus.complete && processedVideoPath != null && analysisData != null) {
//       return _buildDashboard();
//     }
//     return _buildUploadScreen();
//   }

//   Widget _buildUploadScreen() {
//     bool isProcessing = status == UploadStatus.uploading || 
//                         status == UploadStatus.processing || 
//                         status == UploadStatus.downloading;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF0F2F5),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (isProcessing) ...[
//               const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6C63FF))),
//               const SizedBox(height: 20),
//               Text(
//                 status == UploadStatus.uploading ? 'Uploading video...' :
//                 status == UploadStatus.processing ? 'Analyzing video, please wait...' :
//                 'Finalizing results...',
//                 style: const TextStyle(fontSize: 18, color: Color(0xFF333333), fontWeight: FontWeight.w500),
//               ),
//             ] else ...[
//               ElevatedButton(
//                 onPressed: _pickAndUploadVideo,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF6C63FF),
//                   padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                   elevation: 8,
//                 ),
//                 child: const Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.videocam_outlined, size: 50, color: Colors.white),
//                     SizedBox(height: 10),
//                     Text(
//                       'Upload Video from Gallery',
//                       style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//             if (status == UploadStatus.failed) ...[
//               const SizedBox(height: 40),
//               const Text('An error occurred. Please try again.', style: TextStyle(color: Colors.red, fontSize: 16)),
//               const SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: _pickAndUploadVideo,
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
//                 child: const Text('Try Again', style: TextStyle(color: Colors.white)),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDashboard() {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF6C63FF),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: _resetState,
//         ),
//         title: const Text('Analysis Dashboard', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(bottom: 40),
//         child: Column(
//           children: [
//             if (_betterPlayerController != null)
//               AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: BetterPlayer(controller: _betterPlayerController!),
//               )
//             else
//               Container(
//                 height: 250,
//                 color: Colors.black,
//                 child: const Center(child: CircularProgressIndicator()),
//               ),

//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Wrap(
//                 spacing: 10,
//                 runSpacing: 10,
//                 children: [
//                   StatCard(title: "Total Shots", value: analysisData?['total_shots']?.toString() ?? '0', color: const Color(0xFFFFF3CD)),
//                   StatCard(title: "Max Speed", value: analysisData?['max_speed_kmh']?.toStringAsFixed(1) ?? 'N/A', unit: "km/h", color: const Color(0xFFF8D7DA)),
//                   StatCard(title: "Avg. Speed", value: analysisData?['average_speed_kmh']?.toStringAsFixed(1) ?? 'N/A', unit: "km/h", color: const Color(0xFFD1ECF1)),
//                   StatCard(title: "Top Power Category", value: analysisData?['power_hit_category'] ?? 'N/A', color: const Color(0xFFD4EDDA)),
//                 ],
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text('Shot Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 10),
//                   if (analysisData?['impacts'] != null && (analysisData?['impacts'] as List).isNotEmpty)
//                     ...(analysisData!['impacts'] as List).asMap().entries.map((entry) {
//                        int idx = entry.key;
//                        var shot = entry.value;
//                        return ShotDetailCard(shot: shot, index: idx);
//                     })
//                   else
//                     const Center(child: Text('No impact shots detected.', style: TextStyle(color: Colors.grey))),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class StatCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final String unit;
//   final Color color;

//   const StatCard({required this.title, required this.value, this.unit = '', required this.color, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: (MediaQuery.of(context).size.width / 2) - 15,
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: [
//           Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF555555))),
//           const SizedBox(height: 5),
//           RichText(
//             text: TextSpan(
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF222222)),
//               children: [
//                 TextSpan(text: value),
//                 if (unit.isNotEmpty)
//                   TextSpan(text: ' $unit', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class ShotDetailCard extends StatelessWidget {
//   final Map<String, dynamic> shot;
//   final int index;

//   const ShotDetailCard({required this.shot, required this.index, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       margin: const EdgeInsets.only(bottom: 10),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Row(
//           children: [
//             Container(
//               width: 40,
//               height: 40,
//               decoration: const BoxDecoration(
//                 color: Color(0xFF6C63FF),
//                 shape: BoxShape.circle,
//               ),
//               child: Center(child: Text((index + 1).toString(), style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
//             ),
//             const SizedBox(width: 15),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Speed: ${shot['speed_kmh']?.toStringAsFixed(2) ?? 'N/A'} km/h', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                   Text('Category: ${shot['category'] ?? 'N/A'}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
//                 ],
//               ),
//             ),
//             const Icon(Icons.analytics_outlined, color: Color(0xFF6C63FF)),
//           ],
//         ),
//       ),
//     );
//   }
// }
