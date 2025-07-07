import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    AdminDashboard(),
    Center(child: Text("Players")),
    Center(child: Text("Coaches")),
    Center(child: Text("Settings")),
  ];

  final List<String> menuTitles = [
    "Dashboard",
    "Players",
    "Coaches",
    "Settings",
  ];

  final List<IconData> menuIcons = [
    Icons.dashboard,
    Icons.people,
    Icons.school,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 220,
            color: AppColors.primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 40),
                // Icon(Icons.sports_cricket, color: Colors.white, size: 40),
                const SizedBox(height: 10),
                ListTile(
                  // leading: Icon(Icons.sports_cricket, color: Colors.white, size: 40), 
                  title: Text(
                  "Welcome Admin!",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: ListView.builder(
                    itemCount: menuTitles.length,
                    itemBuilder: (context, index) {
                      bool isSelected = index == selectedIndex;
                      return ListTile(
                        leading: Icon(
                          menuIcons[index],
                          color: isSelected ? Colors.white : Colors.white70,
                        ),
                        title: Text(
                          menuTitles[index],
                          style: GoogleFonts.poppins(
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected ? Colors.white : Colors.white70,
                          ),
                        ),
                        tileColor: isSelected ? Colors.white.withOpacity(0.1) : Colors.transparent,
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      );
                    },
                  ),
                ),
                const Divider(color: Colors.white54),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: Text(
                    "Logout",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  onTap: () {
                    // Handle logout
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // Main content
          Expanded(
            child: Container(
              color: Colors.grey.shade100,
              child: pages[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}



class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  String selectedAcademy = 'Academy';
  String selectedCoach = 'Coach';
  String selectedNet = 'Nets';
  String selectedDate = 'Date';

  List<Map<String, String>> playerData = [
    {
      "name": "John Khan",
      "academy": "ABC Academy",
      "coach": "Coach Ali",
      "net": "Net A",
      "power": "83%",
      "impact": "91%",
      "fitness": "Fit",
      "battingHand": "Left",
      "swing": "72%",
      "date": "06 Jul 2025",
      "videoUrl": "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    },
    {
      "name": "David Patel",
      "academy": "Elite Cricket",
      "coach": "Coach Brown",
      "net": "Net B",
      "power": "88%",
      "impact": "91%",
      "fitness": "Moderate",
      "battingHand": "Right",
      "swing": "80%",
      "date": "06 Jul 2025",
      "videoUrl": "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    },
    {
      "name": "Alex Singh",
      "academy": "Greenfield",
      "coach": "Coach Gupta",
      "net": "Net A",
      "power": "81%",
      "impact": "69%",
      "fitness": "Injury Prone",
      "battingHand": "Left",
      "swing": "65%",
      "date": "06 Jul 2025",
      "videoUrl": "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    },
    {
      "name": "Rahim Gupta",
      "academy": "Alex Academy",
      "coach": "Coach Ali",
      "net": "Net B",
      "power": "86%",
      "impact": "88%",
      "fitness": "Fit",
      "battingHand": "Right",
      "swing": "78%",
      "date": "07 Jul 2025",
      "videoUrl": "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    },
    {
      "name": "Mike Sharma",
      "academy": "Elite Cricket",
      "coach": "Coach Borka",
      "net": "Net A",
      "power": "71%",
      "impact": "94%",
      "fitness": "Moderate",
      "battingHand": "Left",
      "swing": "69%",
      "date": "08 Jul 2025",
      "videoUrl": "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    },
  ];

  List<Map<String, String>> filteredData = [];

  @override
  void initState() {
    super.initState();
    applyFilters();
  }

  void applyFilters() {
    setState(() {
      filteredData = playerData.where((player) {
        final matchAcademy = selectedAcademy == 'Academy' || player['academy']?.trim() == selectedAcademy.trim();
        final matchCoach = selectedCoach == 'Coach' || player['coach']?.trim() == selectedCoach.trim();
        final matchNet = selectedNet == 'Nets' || player['net']?.trim() == selectedNet.trim();
        final matchDate = selectedDate == 'Date' || player['date']?.trim() == selectedDate.trim();

        return matchAcademy && matchCoach && matchNet && matchDate;
      }).toList();
    });
  }

  void _playVideo(String url, String playerName) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => FullScreenVideoPlayer(videoUrl: url, playerName: playerName),
    ));
  }

  int _getMaxValue(String key) {
    return playerData
        .map((e) => int.tryParse(e[key]!.replaceAll('%', '')) ?? 0)
        .fold<int>(0, (prev, next) => next > prev ? next : prev);
  }

  DataCell _buildHighlightedCell(String? value, String key, double width) {
    final intValue = int.tryParse((value ?? '').replaceAll('%', '')) ?? 0;
    final maxValue = _getMaxValue(key);

    return DataCell(
      SizedBox(
        width: width,
        child: Text(
          value ?? '',
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: intValue == maxValue ? Colors.green : Colors.black,
          ),
        ),
      ),
    );
  }

  DataCell _buildFitnessCell(String? value, double width) {
    return DataCell(SizedBox(
      width: width,
      child: Text(
        value ?? '',
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: value?.toLowerCase() == 'fit' ? Colors.green : Colors.black,
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();

    List<String> academyOptions = ['Academy'] + playerData.map((p) => p['academy']!).toSet().toList();
    List<String> netOptions = ['Nets'] + playerData.map((p) => p['net']!).toSet().toList();
    List<String> coachOptions = ['Coach'] + playerData.map((p) => p['coach']!).toSet().toList();
    List<String> dateOptions = ['Date'] + playerData.map((p) => p['date']!).toSet().toList();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(size.customHeight(context) * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("DASHBOARD",
                      style: GoogleFonts.poppins(
                        fontSize: size.customWidth(context) * 0.02,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      )),
                  Row(
                    children: [
                      Text("Admin",
                          style: GoogleFonts.poppins(
                            fontSize: size.customWidth(context) * 0.015,
                            // fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          )),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        radius: size.customWidth(context) * 0.015,
                        backgroundColor: AppColors.blackColor,
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: size.customHeight(context) * 0.03),
              Row(
                children: [
                  Expanded(
                    child: _buildDropdown(academyOptions, selectedAcademy, (val) {
                      setState(() {
                        selectedAcademy = val;
                        applyFilters();
                      });
                    }),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildDropdown(netOptions, selectedNet, (val) {
                      setState(() {
                        selectedNet = val;
                        applyFilters();
                      });
                    }),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildDropdown(coachOptions, selectedCoach, (val) {
                      setState(() {
                        selectedCoach = val;
                        applyFilters();
                      });
                    }),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildDropdown(dateOptions, selectedDate, (val) {
                      setState(() {
                        selectedDate = val;
                        applyFilters();
                      });
                    }),
                  ),
                ],
              ),
              SizedBox(height: size.customHeight(context) * 0.03),
              Expanded(
                child: filteredData.isEmpty
                    ? Center(
                        child: Text(
                          "No data found for selected filters.",
                          style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          child: DataTable(
                            border: TableBorder.all(color: Colors.grey, width: 1),
                            headingRowColor: MaterialStateProperty.all(AppColors.greyColor.withOpacity(0.6)),
                            headingTextStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor,
                            ),
                            columns: const [
                              DataColumn(label: Text("Player Name")),
                              DataColumn(label: Text("Academy")),
                              DataColumn(label: Text("Coach")),
                              DataColumn(label: Text("Nets")),
                              DataColumn(label: Text("Power")),
                              DataColumn(label: Text("Impact")),
                              DataColumn(label: Text("Fitness")),
                              DataColumn(label: Text("Batting Hand")),
                              DataColumn(label: Text("Swing")),
                              DataColumn(label: Text("Session Date")),
                              DataColumn(label: Text("Model Video")),
                            ],
                            rows: filteredData.map((player) {
                              return DataRow(
                                cells: [
                                  _buildCell(player['name'], width: 120),
                                  _buildCell(player['academy'], width: 120),
                                  _buildCell(player['coach'], width: 120),
                                  _buildCell(player['net'], width: 80),
                                  _buildHighlightedCell(player['power'], 'power', 80),
                                  _buildHighlightedCell(player['impact'], 'impact', 100),
                                  _buildFitnessCell(player['fitness'], 120),
                                  _buildCell(player['battingHand'], width: 100),
                                  _buildHighlightedCell(player['swing'], 'swing', 80),
                                  _buildCell(player['date'], width: 120),
                                  DataCell(
                                    InkWell(
                                      onTap: () => _playVideo(player['videoUrl']!, player['name']!),
                                      child: SizedBox(
                                        width: 110,
                                        child: Row(
                                          children: [
                                            Icon(Icons.play_circle_fill, color: AppColors.primaryColor),
                                            const SizedBox(width: 8),
                                            Flexible(
                                              child: Text(
                                                "View",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
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
                              );
                            }).toList(),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    List<String> items,
    String value,
    void Function(String) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          items: items
              .map((val) => DropdownMenuItem<String>(
                    value: val,
                    child: Text(val, style: GoogleFonts.poppins(fontSize: 14)),
                  ))
              .toList(),
          onChanged: (val) => onChanged(val!),
        ),
      ),
    );
  }

  DataCell _buildCell(String? value, {required double width}) {
    return DataCell(SizedBox(
      width: width,
      child: Text(
        value ?? '',
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.poppins(),
      ),
    ));
  }
}

class FullScreenVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final String playerName;

  const FullScreenVideoPlayer({
    Key? key,
    required this.videoUrl,
    required this.playerName,
  }) : super(key: key);

  @override
  State<FullScreenVideoPlayer> createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _chewieController = ChewieController(
          videoPlayerController: _controller,
          autoPlay: true,
          looping: false,
        );
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("${widget.playerName}'s Video", style: GoogleFonts.poppins(
          color: AppColors.whiteColor,
        )),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: _chewieController != null && _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(controller: _chewieController!)
            : const CircularProgressIndicator(),
      ),
    );
  }
}
