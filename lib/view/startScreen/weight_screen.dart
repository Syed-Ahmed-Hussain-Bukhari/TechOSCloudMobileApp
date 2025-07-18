// import 'package:etech_cricket_app/view/startScreen/height_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:etech_cricket_app/constants/app_colors.dart';
// import 'package:etech_cricket_app/constants/custom_size.dart';

// class WeightController extends GetxController {
//   var isKg = true.obs;
//   var weight = 75.0.obs;
// }

// class WeightScreen extends StatelessWidget {
//   const WeightScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = CustomSize();
//     final controller = Get.put(WeightController());

//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       appBar: AppBar(
//         toolbarHeight: size.customHeight(context) / 10,
//          backgroundColor: AppColors.whiteColor,
//         leading: Icon(Icons.arrow_back, color: AppColors.primaryColor),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: size.customWidth(context) * 0.05),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "What Is Your Weight?",
//               style: GoogleFonts.poppins(
//                 fontSize: size.customWidth(context) / 15,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.blackColor,
//               ),
//             ),
//             SizedBox(height: size.customHeight(context) * 0.01),
//             Text(
//               "Please select your weight using the scale below.",
//               textAlign: TextAlign.start,
//               style: GoogleFonts.poppins(
//                 fontSize: size.customWidth(context) / 26,
//                 color: AppColors.greyColor,
//               ),
//             ),
//             SizedBox(height: size.customHeight(context) * 0.04),
//             Obx(() => Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _unitToggle(context, 'KG', controller.isKg.value, () => controller.isKg.value = true),
//                     SizedBox(width: size.customWidth(context) * 0.03),
//                     _unitToggle(context, 'LB', !controller.isKg.value, () => controller.isKg.value = false),
//                   ],
//                 )),
//             SizedBox(height: size.customHeight(context) * 0.04),
//             _weightSlider(context, controller), // ✅ Not wrapped in Obx here
//             SizedBox(height: size.customHeight(context) * 0.03),
//             Obx(() => Center(
//               child: Text(
//                     "${controller.weight.value.toStringAsFixed(0)} ${controller.isKg.value ? 'KG' : 'LB'}",
//                     style: GoogleFonts.poppins(
//                       fontSize: size.customWidth(context) / 12,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.blackColor,
//                     ),
//                   ),
//             )),
//             SizedBox(height: size.customHeight(context) * 0.06),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                       print("Selected Weight: ${controller.weight.value.toStringAsFixed(1)} ${controller.isKg.value ? 'KG' : 'LB'}");
//                       // Navigate or store weight if needed
//                       Get.to(HeightScreen());
//                     },
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

//   Widget _weightSlider(BuildContext context, WeightController controller) {
//     return Obx(() => SliderTheme(
//           data: SliderTheme.of(context).copyWith(
//             thumbColor: AppColors.primaryColor,
//             activeTrackColor: AppColors.primaryColor,
//             inactiveTrackColor: Colors.grey,
//             trackHeight: 2,
//             thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
//           ),
//           child: Slider(
//             min: 30,
//             max: 150,
//             divisions: 120,
//             value: controller.weight.value,
//             onChanged: (value) {
//               controller.weight.value = value;
//             },
//           ),
//         ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:etech_cricket_app/view/startScreen/height_screen.dart'; // Assuming this is your next screen

class WeightController extends GetxController {
  var isLbs = true.obs; // True for lbs, false for kg, default to lbs as per screenshot
  var weight = 120.0.obs; // Default weight from screenshot in lbs

  // Method to convert weight if units change
  void toggleUnit(bool toLbs) {
    if (isLbs.value != toLbs) {
      if (toLbs) {
        // Convert KG to LBS (1 KG = 2.20462 LBS)
        weight.value = (weight.value * 2.20462).roundToDouble(); // Round to nearest for display
      } else {
        // Convert LBS to KG (1 LBS = 0.453592 KG)
        weight.value = (weight.value / 2.20462).roundToDouble(); // Round to nearest for display
      }
      isLbs.value = toLbs;
      // Clamp weight to new unit's valid range after conversion
      weight.value = weight.value.clamp(minWeight, maxWeight);
    }
  }

  // Calculate current min/max for the slider based on unit
  double get minWeight {
    if (isLbs.value) {
      return 60.0; // Lower bound for lbs as seen in screenshot's typical range
    } else {
      return 30.0; // Corresponds to approx 66 lbs
    }
  }

  double get maxWeight {
    if (isLbs.value) {
      return 260.0; // Upper bound for lbs
    } else {
      return 120.0; // Corresponds to approx 264 lbs
    }
  }

  // Calculate divisions for the slider
  int get divisions => (maxWeight - minWeight).round();
}

class WeightScreen extends StatelessWidget {
  const WeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();
    final controller = Get.put(WeightController());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        toolbarHeight: size.customHeight(context) * 0.12, // Adjusted for progress bar and text
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
              value: 3 / 5, // STEP 3/5
              backgroundColor: AppColors.greyColor.withOpacity(0.4),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              minHeight: size.customHeight(context) * 0.01,
            ),
            SizedBox(height: size.customHeight(context) * 0.005),
            Text(
              'STEP 3/5',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "What Is Your Weight?",
                  style: GoogleFonts.poppins(
                    fontSize: size.customWidth(context) * 0.06, // Adjusted font size for title
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.customHeight(context) * 0.005),
            Center(
              child: Text(
                "Please select your weight using the scale below.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: size.customWidth(context) * 0.035, // Adjusted font size for subtitle
                  color: AppColors.greyColor,
                ),
              ),
            ),
            SizedBox(height: size.customHeight(context) * 0.04),

            // KG/LBS Toggle Buttons
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _unitToggleButton(context, 'lbs', controller.isLbs.value, () => controller.toggleUnit(true)),
                    SizedBox(width: size.customWidth(context) * 0.03),
                    _unitToggleButton(context, 'kg', !controller.isLbs.value, () => controller.toggleUnit(false)),
                  ],
                )),
            SizedBox(height: size.customHeight(context) * 0.04),

            // Current Weight Display
            Obx(() => Center(
                  child: Text(
                    "${controller.weight.value.toStringAsFixed(0)} ${controller.isLbs.value ? 'lbs' : 'kg'}",
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.12, // Larger font size for weight
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
                )),
            SizedBox(height: size.customHeight(context) * 0.03),

            // Custom Ruler Slider (combined visual and interaction in a Stack)
            // Use Expanded to take available vertical space for the ruler section
            Expanded(
              child: Align( // Align the content to the center
                alignment: Alignment.center,
                child: Obx(() => SizedBox(
                      height: size.customHeight(context) * 0.15, // Fixed height for the entire ruler visual area
                      child: Stack(
                        alignment: Alignment.center, // Center the stack content
                        children: [
                          // Custom Painter for Ruler Marks and Numbers (background visual)
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return CustomPaint(
                                size: Size(constraints.maxWidth, constraints.maxHeight),
                                painter: RulerPainter(
                                  minValue: controller.minWeight,
                                  maxValue: controller.maxWeight,
                                  currentValue: controller.weight.value,
                                  primaryColor: AppColors.primaryColor,
                                  greyColor: AppColors.greyColor,
                                  size: size,
                                  canvasWidth: constraints.maxWidth, // Pass actual width to painter
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
                              min: controller.minWeight,
                              max: controller.maxWeight,
                              divisions: controller.divisions,
                              value: controller.weight.value.clamp(controller.minWeight, controller.maxWeight),
                              onChanged: (value) {
                                controller.weight.value = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
            ),

            SizedBox(height: size.customHeight(context) * 0.06), // Space before button, pushes button to bottom

            // Continue Button
            Center(
              child: SizedBox(
                width: double.infinity, // Full width button
                height: size.customHeight(context) * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    print("Selected Weight: ${controller.weight.value.toStringAsFixed(0)} ${controller.isLbs.value ? 'lbs' : 'kg'}");
                    Get.to(() => const HeightScreen()); // Navigate to HeightScreen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.customHeight(context) * 0.2), // Consistent border radius
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.poppins(
                      fontSize: size.customWidth(context) * 0.045, // Consistent font size
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

  // Custom Toggle Button for KG/LBS
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
          borderRadius: BorderRadius.circular(size.customHeight(context) * 0.02), // Slightly less rounded than main buttons
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.greyColor.withOpacity(0.5),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: size.customWidth(context) * 0.05, // Adjusted font size
            fontWeight: FontWeight.w600, // Bold as per screenshot
            color: isSelected ? AppColors.whiteColor : AppColors.blackColor, // Text color changes
          ),
        ),
      ),
    );
  }
}

// Custom Painter for the Ruler Scale and Indicator
class RulerPainter extends CustomPainter {
  final double minValue;
  final double maxValue;
  final double currentValue;
  final Color primaryColor;
  final Color greyColor;
  final CustomSize size;
  final double canvasWidth; // Actual width provided by LayoutBuilder

  RulerPainter({
    required this.minValue,
    required this.maxValue,
    required this.currentValue,
    required this.primaryColor,
    required this.greyColor,
    required this.size,
    required this.canvasWidth,
  });

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final Paint linePaint = Paint()
      ..color = greyColor.withOpacity(0.5)
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;

    // Calculate the pixel step for each unit
    final double range = maxValue - minValue;
    if (range == 0) return; // Avoid division by zero

    final double pixelsPerUnit = canvasWidth / range;

    // Y-position for the top of the ruler lines (relative to canvas top)
    final double rulerLineTopY = canvasSize.height * 0.2; // Start lines slightly down from top

    // Draw marks and numbers
    for (double i = minValue; i <= maxValue; i++) {
      final double x = (i - minValue) * pixelsPerUnit;
      double lineHeight = 0;
      double textOffset = 0;
      bool isMajorTick = false;

      // Adjust tick length based on major/minor marks
      if (i % 10 == 0) { // Major ticks every 10 units (e.g., 110, 120, 130)
        lineHeight = size.customHeight(Get.context!) * 0.03; // Longer line
        isMajorTick = true;
        textOffset = size.customHeight(Get.context!) * 0.01; // Space for text below line
      } else { // Minor ticks for every 1 unit
        lineHeight = size.customHeight(Get.context!) * 0.01; // Shorter line
      }

      // Draw the tick line
      canvas.drawLine(
        Offset(x, rulerLineTopY),
        Offset(x, rulerLineTopY + lineHeight),
        linePaint,
      );

      // Draw the number for major ticks
      if (isMajorTick) {
        final textSpan = TextSpan(
          text: i.toStringAsFixed(0),
          style: GoogleFonts.poppins(
            color: AppColors.blackColor, // Numbers are black
            fontSize: size.customWidth(Get.context!) * 0.035, // Responsive font size
            fontWeight: FontWeight.w500,
          ),
        );
        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        // Position text below the tick mark
        textPainter.paint(canvas, Offset(x - textPainter.width / 2, rulerLineTopY + lineHeight + textOffset));
      }
    }

    // Draw the central red indicator (triangle)
    // Its position should correspond to the currentValue
    final double indicatorX = (currentValue - minValue) * pixelsPerUnit;
    final Paint indicatorPaint = Paint()..color = primaryColor;
    final Path trianglePath = Path();

    // The triangle points upwards from the base of the main ruler line
    // It should be positioned slightly below the bottom of the major ticks.
    final double triangleBaseY = rulerLineTopY + (size.customHeight(Get.context!) * 0.03); // Aligned with bottom of longest tick
    final double triangleHeight = size.customHeight(Get.context!) * 0.015; // Small triangle height
    final double triangleWidth = size.customWidth(Get.context!) * 0.015; // Small triangle base half-width

    trianglePath.moveTo(indicatorX, triangleBaseY + triangleHeight); // Base center point (bottom point of triangle)
    trianglePath.lineTo(indicatorX - triangleWidth, triangleBaseY); // Top left point
    trianglePath.lineTo(indicatorX + triangleWidth, triangleBaseY); // Top right point
    trianglePath.close();
    canvas.drawPath(trianglePath, indicatorPaint);
  }

  @override
  bool shouldRepaint(covariant RulerPainter oldDelegate) {
    // Repaint only if relevant properties change to optimize performance
    return oldDelegate.minValue != minValue ||
           oldDelegate.maxValue != maxValue ||
           oldDelegate.currentValue != currentValue ||
           oldDelegate.canvasWidth != canvasWidth;
  }
}