// import 'package:etech_cricket_app/view/startScreen/player_infromation_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';

// class HeightController extends GetxController {
//   var isCm = true.obs;
//   var height = 175.0.obs;
// }

// class HeightScreen extends StatelessWidget {
//   const HeightScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();
//     final controller = Get.put(HeightController());

//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       appBar: AppBar(
//         toolbarHeight: size.customHeight(context) / 10,
//         backgroundColor: AppColors.whiteColor,
//         leading: Icon(Icons.arrow_back, color: AppColors.primaryColor),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: size.customWidth(context) * 0.05),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "What Is Your Height?",
//               style: GoogleFonts.poppins(
//                 fontSize: size.customWidth(context) / 15,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.blackColor,
//               ),
//             ),
//             SizedBox(height: size.customHeight(context) * 0.01),
//             Text(
//               "Please select your height using the scale below.",
//               textAlign: TextAlign.start,
//               style: GoogleFonts.poppins(
//                 fontSize: size.customWidth(context) / 26,
//                 color: AppColors.greyColor,
//               ),
//             ),
//             SizedBox(height: size.customHeight(context) * 0.04),
//             Obx(() => Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _unitToggle(context, 'CM', controller.isCm.value, () {
//                   if (!controller.isCm.value) {
//                     controller.height.value = (controller.height.value * 2.54).clamp(100.0, 220.0);
//                     controller.isCm.value = true;
//                   }
//                 }),
//                 SizedBox(width: size.customWidth(context) * 0.03),
//                 _unitToggle(context, 'IN', !controller.isCm.value, () {
//                   if (controller.isCm.value) {
//                     controller.height.value = (controller.height.value / 2.54).clamp(39.0, 86.0);
//                     controller.isCm.value = false;
//                   }
//                 }),
//               ],
//             )),
//             SizedBox(height: size.customHeight(context) * 0.04),
//             _heightSlider(context, controller),
//             SizedBox(height: size.customHeight(context) * 0.03),
//             Obx(() => Center(
//               child: Text(
//                 _getFormattedHeight(controller.height.value, controller.isCm.value),
//                 style: GoogleFonts.poppins(
//                   fontSize: size.customWidth(context) / 12,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.blackColor,
//                 ),
//               ),
//             )),
//             SizedBox(height: size.customHeight(context) * 0.06),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                     final height = controller.height.value;
//                     final unit = controller.isCm.value ? "CM" : "IN";
//                     print("Selected Height: ${height.toStringAsFixed(1)} $unit");
//                     Get.to(PlayerInformationScreen());
//                  },

//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primaryColor,
//                   padding: EdgeInsets.symmetric(
//                     horizontal: size.customWidth(context) * 0.2,
//                     vertical: size.customHeight(context) * 0.02,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                 ),
//                 child: Text(
//                   'Continue',
//                   style: GoogleFonts.poppins(
//                     fontSize: size.customWidth(context) / 22,
//                     color: AppColors.whiteColor,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _unitToggle(BuildContext context, String label, bool isSelected, VoidCallback onTap) {
//     final size = CustomSize();
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: size.customWidth(context) * 0.07,
//           vertical: size.customHeight(context) * 0.01,
//         ),
//         decoration: BoxDecoration(
//           color: isSelected ? AppColors.primaryColor : Colors.grey[800],
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Text(
//           label,
//           style: GoogleFonts.poppins(
//             fontSize: size.customWidth(context) / 25,
//             fontWeight: FontWeight.bold,
//             color: AppColors.whiteColor,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _heightSlider(BuildContext context, HeightController controller) {
//     return Obx(() => SliderTheme(
//           data: SliderTheme.of(context).copyWith(
//             thumbColor: AppColors.primaryColor,
//             activeTrackColor: AppColors.primaryColor,
//             inactiveTrackColor: Colors.grey,
//             trackHeight: 2,
//             thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
//           ),
//           child: Slider(
//             min: controller.isCm.value ? 100 : 39,
//             max: controller.isCm.value ? 220 : 86,
//             divisions: controller.isCm.value ? 120 : 47,
//             value: controller.height.value,
//             onChanged: (value) {
//               controller.height.value = value;
//             },
//           ),
//         ));
//   }

//   String _getFormattedHeight(double heightValue, bool isCm) {
//     if (!isCm) {
//       return "${heightValue.toStringAsFixed(0)} IN";
//     }

//     double totalInches = heightValue / 2.54;
//     int feet = totalInches ~/ 12;
//     int inches = (totalInches % 12).round();
//     return "$feet'${inches}\" (${heightValue.toStringAsFixed(0)} cm)";
//   }
// }


import 'package:etech_cricket_app/view/startScreen/player_infromation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:etech_cricket_app/constants/app_colors.dart'; // Assuming you have this file for colors
import 'package:etech_cricket_app/constants/custom_size.dart'; // Assuming you have this file for responsive sizing

class HeightController extends GetxController {
  // Use isCm for easier logic (true for cm, false for inches/feet)
  // Default to inches/feet based on the screenshot, so isCm = false initially
  var isCm = false.obs; // Changed to false for inches by default as per screenshot
  // Store height internally as cm for easier universal calculation and conversion
  var heightCm = 175.0.obs; // Default to 175 cm (approx 5'9") as per screenshot

  // Helper getter for formatted height display
  String get formattedHeight {
    if (isCm.value) {
      return "${heightCm.value.toStringAsFixed(0)} cm"; // Display in CM
    } else {
      return _cmToFeetInches(heightCm.value); // Display in Feet/Inches
    }
  }

  // Helper getter for secondary height display (the one in parentheses)
  String get secondaryFormattedHeight {
    if (isCm.value) {
      return _cmToFeetInches(heightCm.value); // If CM is primary, show Ft/In secondary
    } else {
      return "${heightCm.value.toStringAsFixed(0)} cm"; // If Ft/In is primary, show CM secondary
    }
  }

  // Method to toggle units and ensure height is within new unit's range
  void toggleUnit(bool toCm) {
    if (isCm.value != toCm) {
      isCm.value = toCm;
      // Clamp the heightCm to the appropriate range for the new unit
      heightCm.value = heightCm.value.clamp(minHeightCm, maxHeightCm);
    }
  }

  // Define min/max ranges for the slider in CM (internal representation)
  // These ranges are broad enough to cover typical heights in both systems
  double get minHeightCm {
    // If showing in feet/inches, range might be from 3'0" (91.44cm) to 7'6" (228.6cm)
    // If showing in cm, range might be from 100cm to 250cm
    return 100.0; // Starting from 100 cm (approx 3'3")
  }

  double get maxHeightCm {
    return 220.0; // Up to 220 cm (approx 7'2")
  }

  // Helper to convert CM to Feet and Inches string (e.g., "5'9\"")
  String _cmToFeetInches(double cm) {
    final double inchesTotal = cm / 2.54;
    final int feet = (inchesTotal / 12).floor();
    final double remainingInches = inchesTotal % 12;
    return "${feet}'${remainingInches.toStringAsFixed(0)}\"";
  }

  // Calculate divisions for the slider based on the CM range
  int get divisions => (maxHeightCm - minHeightCm).round();
}

class HeightScreen extends StatelessWidget {
  const HeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();
    final controller = Get.put(HeightController());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        toolbarHeight: size.customHeight(context) * 0.12,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.blackColor, size: size.customHeight(context) * 0.04),
          onPressed: () {
            Get.back();
          },
        ),
        title: Column(
          children: [
            SizedBox(height: size.customHeight(context) * 0.025),
            LinearProgressIndicator(
              value: 4 / 5, // STEP 4/5
              backgroundColor: AppColors.greyColor.withOpacity(0.4),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              minHeight: size.customHeight(context) * 0.01,
            ),
            SizedBox(height: size.customHeight(context) * 0.005),
            Text(
              'STEP 4/5',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.customWidth(context) * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.customHeight(context) * 0.03),
            Center(
              child: Text(
                "What Is Your Height?",
                style: GoogleFonts.poppins(
                  fontSize: size.customWidth(context) * 0.06,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            SizedBox(height: size.customHeight(context) * 0.005),
            Center(
              child: Text(
                "Please select your height using the scale below.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: size.customWidth(context) * 0.04,
                  color: AppColors.greyColor,
                ),
              ),
            ),
            SizedBox(height: size.customHeight(context) * 0.04),

            // CM / FT Toggle Buttons
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _unitToggleButton(context, 'ft', !controller.isCm.value, () => controller.toggleUnit(false)), // ft is selected by default
                    SizedBox(width: size.customWidth(context) * 0.03),
                    _unitToggleButton(context, 'cm', controller.isCm.value, () => controller.toggleUnit(true)),
                  ],
                )),
            SizedBox(height: size.customHeight(context) * 0.04),

            // Current Height Display
            Obx(() => Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic, // Align text baselines
                    children: [
                      Text(
                        controller.formattedHeight,
                        style: GoogleFonts.poppins(
                          fontSize: size.customWidth(context) * 0.12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(width: size.customWidth(context) * 0.02),
                      Text(
                        '(${controller.secondaryFormattedHeight})',
                        style: GoogleFonts.poppins(
                          fontSize: size.customWidth(context) * 0.05, // Smaller font for secondary value
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: size.customHeight(context) * 0.03),

            // Custom Height Ruler Slider
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Obx(() => SizedBox(
                      height: size.customHeight(context) * 0.15, // Height for the ruler visual area
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Custom Painter for Ruler Marks and Numbers (background visual)
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return CustomPaint(
                                size: Size(constraints.maxWidth, constraints.maxHeight),
                                painter: HeightRulerPainter(
                                  minValueCm: controller.minHeightCm,
                                  maxValueCm: controller.maxHeightCm,
                                  currentValueCm: controller.heightCm.value,
                                  isCm: controller.isCm.value, // Pass the current unit state
                                  primaryColor: AppColors.primaryColor,
                                  greyColor: AppColors.greyColor,
                                  size: size,
                                  canvasWidth: constraints.maxWidth,
                                ),
                              );
                            },
                          ),
                          // Transparent Slider for Interaction (on top)
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 1.0, // Minimal track height
                              activeTrackColor: Colors.transparent, // Hide default track
                              inactiveTrackColor: Colors.transparent, // Hide default track
                              thumbColor: Colors.transparent, // Hide default thumb
                              overlayColor: Colors.transparent, // Hide overlay
                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0.0), // No visible default thumb
                              trackShape: const RectangularSliderTrackShape(),
                            ),
                            child: Slider(
                              min: controller.minHeightCm,
                              max: controller.maxHeightCm,
                              divisions: controller.divisions, // Divisions based on CM range
                              value: controller.heightCm.value.clamp(controller.minHeightCm, controller.maxHeightCm),
                              onChanged: (value) {
                                controller.heightCm.value = value.roundToDouble(); // Round to nearest CM
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
            ),

            SizedBox(height: size.customHeight(context) * 0.06),

            // Continue Button
            Center(
              child: SizedBox(
                width: double.infinity,
                height: size.customHeight(context) * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    print("Selected Height: ${controller.formattedHeight}");
                   Get.to(PlayerInformationScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.045,
                      fontWeight: FontWeight.w600,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.customHeight(context) * 0.02), // Bottom padding
          ],
        ),
      ),
    );
  }

  // Custom Toggle Button (reused for consistency)
  Widget _unitToggleButton(BuildContext context, String label, bool isSelected, VoidCallback onTap) {
    final size = CustomSize();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.customWidth(context) * 0.08,
          vertical: size.customHeight(context) * 0.02,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(size.customHeight(context) * 0.02),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.greyColor.withOpacity(0.5),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: size.customWidth(context) * 0.05,
            fontWeight: FontWeight.w600,
            color: isSelected ? AppColors.whiteColor : AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}

// Custom Painter for the Height Ruler Scale and Indicator
class HeightRulerPainter extends CustomPainter {
  final double minValueCm;
  final double maxValueCm;
  final double currentValueCm;
  final bool isCm; // Indicates if the primary unit displayed on ruler is CM or Ft/In
  final Color primaryColor;
  final Color greyColor;
  final CustomSize size;
  final double canvasWidth;

  HeightRulerPainter({
    required this.minValueCm,
    required this.maxValueCm,
    required this.currentValueCm,
    required this.isCm,
    required this.primaryColor,
    required this.greyColor,
    required this.size,
    required this.canvasWidth,
  });

  // Helper to convert CM to Feet and Inches string for ruler marks
  String _cmToFeetInchesString(double cm) {
    final double inchesTotal = cm / 2.54;
    final int feet = (inchesTotal / 12).floor();
    final double remainingInches = inchesTotal % 12;
    // Format to "5'7\"" or "6'1\"" as seen in screenshot
    return "${feet}'${remainingInches.toStringAsFixed(0)}\"";
  }

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final Paint linePaint = Paint()
      ..color = greyColor.withOpacity(0.5)
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;

    final double range = maxValueCm - minValueCm;
    if (range == 0) return;

    final double pixelsPerCm = canvasWidth / range;

    // Y-position for the top of the ruler lines (relative to canvas top)
    final double rulerLineTopY = canvasSize.height * 0.2; // Start lines slightly down from top

    // Determine interval for major and minor ticks based on unit
    // If displaying in Ft/In, we want ticks at feet and inches intervals.
    // If displaying in CM, we want ticks at 10cm and 5cm intervals.
    int majorTickCmInterval; // Interval in CM for major marks (with numbers)
    int minorTickCmInterval; // Interval in CM for minor marks (lines only)

    if (isCm) { // When CM is selected
      majorTickCmInterval = 10; // Every 10 cm
      minorTickCmInterval = 1; // Every 1 cm
    } else { // When Feet/Inches is selected
      majorTickCmInterval = (30.48).round(); // ~1 foot = 30.48 cm, round to 30 for cleaner ticks
      minorTickCmInterval = (2.54).round(); // ~1 inch = 2.54 cm, round to 3 for cleaner ticks (or 5 for half foot)
      // For accurate 1-inch marks, you might want to iterate by 2.54cm
    }

    // Iterate through the CM range to draw ticks
    for (double i = minValueCm; i <= maxValueCm; i++) {
      // Use integer `i` for CM steps to avoid floating point inaccuracies for tick placement
      double currentCm = i.toDouble();
      final double x = (currentCm - minValueCm) * pixelsPerCm;
      double lineHeight = 0;
      double textOffset = 0;
      bool isMajorTick = false;

      // Adjust tick length based on major/minor marks
      if ((currentCm % majorTickCmInterval).round() == 0) { // Check if it's a major tick
        lineHeight = size.customHeight(Get.context!) * 0.03; // Longer line
        isMajorTick = true;
        textOffset = size.customHeight(Get.context!) * 0.01;
      } else if ((currentCm % minorTickCmInterval).round() == 0) { // Check if it's a minor tick
        lineHeight = size.customHeight(Get.context!) * 0.02; // Medium line
      } else {
        lineHeight = size.customHeight(Get.context!) * 0.01; // Shorter line for very fine divisions
      }

      // Draw the tick line
      canvas.drawLine(
        Offset(x, rulerLineTopY),
        Offset(x, rulerLineTopY + lineHeight),
        linePaint,
      );

      // Draw the number for major ticks
      if (isMajorTick) {
        String tickText;
        if (isCm) {
          tickText = currentCm.toStringAsFixed(0); // Show CM value
        } else {
          tickText = _cmToFeetInchesString(currentCm); // Show Ft/In value
        }

        final textSpan = TextSpan(
          text: tickText,
          style: GoogleFonts.poppins(
            color: AppColors.blackColor,
            fontSize: size.customWidth(Get.context!) * 0.035,
            fontWeight: FontWeight.w500,
          ),
        );
        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        textPainter.paint(canvas, Offset(x - textPainter.width / 2, rulerLineTopY + lineHeight + textOffset));
      }
    }

    // Draw the central red indicator (triangle)
    final double indicatorX = (currentValueCm - minValueCm) * pixelsPerCm;
    final Paint indicatorPaint = Paint()..color = primaryColor;
    final Path trianglePath = Path();

    final double triangleBaseY = rulerLineTopY + (size.customHeight(Get.context!) * 0.03); // Aligned with bottom of longest tick
    final double triangleHeight = size.customHeight(Get.context!) * 0.015;
    final double triangleWidth = size.customWidth(Get.context!) * 0.015;

    trianglePath.moveTo(indicatorX, triangleBaseY + triangleHeight); // Base center point (bottom point of triangle)
    trianglePath.lineTo(indicatorX - triangleWidth, triangleBaseY); // Top left point
    trianglePath.lineTo(indicatorX + triangleWidth, triangleBaseY); // Top right point
    trianglePath.close();
    canvas.drawPath(trianglePath, indicatorPaint);
  }

  @override
  bool shouldRepaint(covariant HeightRulerPainter oldDelegate) {
    // Repaint only if relevant properties change to optimize performance
    return oldDelegate.minValueCm != minValueCm ||
           oldDelegate.maxValueCm != maxValueCm ||
           oldDelegate.currentValueCm != currentValueCm ||
           oldDelegate.isCm != isCm ||
           oldDelegate.canvasWidth != canvasWidth;
  }
}