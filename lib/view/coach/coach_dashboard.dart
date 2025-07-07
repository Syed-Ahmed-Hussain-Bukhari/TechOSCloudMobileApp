import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:etech_cricket_app/view/coach/video_screen.dart';

class CoachDashboardScreen extends StatelessWidget {
  const CoachDashboardScreen({super.key});

  final List<Map<String, dynamic>> playerData = const [
    {
      'name': 'Player 1',
      'efficiency': '85%',
      'power': '85%',
      'fitness': '78%',
      'accuracy': '82%',
      'videoUrl': 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
    },
    {
      'name': 'Player 2',
      'efficiency': '80%',
      'power': '68%',
      'fitness': '75%',
      'accuracy': '79%',
      'videoUrl': 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
    },
    {
      'name': 'Player 3',
      'efficiency': '88%',
      'power': '72%',
      'fitness': '88%',
      'accuracy': '85%',
      'videoUrl': 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
    },
    {
      'name': 'Player 4',
      'efficiency': '90%',
      'power': '74%',
      'fitness': '82%',
      'accuracy': '90%',
      'videoUrl': 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
    },
    {
      'name': 'Player 5',
      'efficiency': '92%',
      'power': '76%',
      'fitness': '85%',
      'accuracy': '89%',
      'videoUrl': 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();

    // Extract max values from the list
    int getMax(String key) {
      return playerData
          .map((e) => int.parse(e[key].toString().replaceAll('%', '')))
          .reduce((a, b) => a > b ? a : b);
    }

    final maxEfficiency = getMax('efficiency');
    final maxPower = getMax('power');
    final maxFitness = getMax('fitness');
    final maxAccuracy = getMax('accuracy');

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
             Container(
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
              child: Text(
                "Coach Dashboard",
                style: GoogleFonts.poppins(
                  fontSize: size.customWidth(context) * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
        
            SizedBox(height: size.customHeight(context) * 0.03),
        
            // Scrollable Table
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.customWidth(context) * 0.03),
                    child: Table(
                      border: TableBorder.all(color: Colors.black54, width: 1),
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      columnWidths: const {
                        0: FixedColumnWidth(100),
                        1: FixedColumnWidth(100),
                        2: FixedColumnWidth(70),
                        3: FixedColumnWidth(100),
                        4: FixedColumnWidth(100),
                        5: FixedColumnWidth(75),
                      },
                      children: [
                        // Header Row
                        TableRow(
                          decoration: const BoxDecoration(color: Color(0xFFEFEFEF)),
                          children: [
                            TableCell(child: tableHeader("Player")),
                            TableCell(child: tableHeader("Efficiency")),
                            TableCell(child: tableHeader("Power")),
                            TableCell(child: tableHeader("Fitness")),
                            TableCell(child: tableHeader("Accuracy")),
                            TableCell(child: tableHeader("Video")),
                          ],
                        ),
                        // Data Rows
                        for (var player in playerData)
                          TableRow(
                            children: [
                              TableCell(child: tableCell(player['name'])),
                              TableCell(
                                child: tableCell(
                                  player['efficiency'],
                                  highlight: _isMax(player['efficiency'], maxEfficiency),
                                ),
                              ),
                              TableCell(
                                child: tableCell(
                                  player['power'],
                                  highlight: _isMax(player['power'], maxPower),
                                ),
                              ),
                              TableCell(
                                child: tableCell(
                                  player['fitness'],
                                  highlight: _isMax(player['fitness'], maxFitness),
                                ),
                              ),
                              TableCell(
                                child: tableCell(
                                  player['accuracy'],
                                  highlight: _isMax(player['accuracy'], maxAccuracy),
                                ),
                              ),
                              TableCell(
                                child: IconButton(
                                  icon: Icon(Icons.play_circle_fill, color: AppColors.primaryColor),
                                  onPressed: () {
                                    Get.to(() => VideoPlayerScreen(videoUrl: player['videoUrl']));
                                  },
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isMax(String value, int max) {
    return int.parse(value.replaceAll('%', '')) == max;
  }

  Widget tableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget tableCell(String text, {bool highlight = false}) {
    return Container(
      color: highlight ? AppColors.primaryColor.withOpacity(0.15) : Colors.transparent,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
