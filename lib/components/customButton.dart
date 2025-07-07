import 'package:etech_cricket_app/constants/app_colors.dart';
import 'package:etech_cricket_app/constants/custom_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  String title;
  final VoidCallback? onTap;
  bool loading = false;
  double height;
  double width;
  Color? color;
  double radius;
  CustomButton(
      {super.key,
      required this.radius,
      this.color,
      required this.height,
      required this.width,
      required this.title,
      this.onTap,
      required this.loading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  strokeWidth: CustomSize().customWidth(context) / 200,
                  color: Colors.white,
                )
              : FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                     style: GoogleFonts.poppins(
                      fontSize: CustomSize().customWidth(context) * 0.045,
                      color: AppColors.whiteColor,
                    ),
                  )),
        ),
      ),
    );
  }
}
