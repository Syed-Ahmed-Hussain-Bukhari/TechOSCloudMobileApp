import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';

class NewUploadedDashboard extends StatelessWidget {
  final Map<String, dynamic> analysisData;
  final String videoUrl;

  const NewUploadedDashboard({
    Key? key,
    required this.analysisData,
    required this.videoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use analysisData and videoUrl as before
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Processed Video:', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            // Video player widget here, using videoUrl
            Expanded(
              child: SingleChildScrollView(
                child: Text(videoUrl.toString()),
              ),
            ),
            // ...
            const SizedBox(height: 20),
            Text('Analysis Data:', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(analysisData.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _StatCard(
      {required this.title, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: color,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
