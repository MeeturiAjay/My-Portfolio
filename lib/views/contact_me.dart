import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../globals/app_buttons.dart';
import '../globals/app_text_styles.dart';
import '../globals/appcolors.dart';
import '../globals/constants.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildContactText(),
          Constants.sizedBox(height: 50.0),
          Material(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.transparent,
            elevation: 8.0,
            child: TextField(
              cursorColor: AppColors.white,
              style: AppTextStyles.normalStyle(),
              decoration: buildInputDecoration(hintText: 'Full Name'),
            ),
          ),
          Constants.sizedBox(height: 10.0),
          Material(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.transparent,
            elevation: 8.0,
            child: TextField(
              cursorColor: AppColors.white,
              style: AppTextStyles.normalStyle(),
              decoration: buildInputDecoration(hintText: 'Email Address'),
            ),
          ),
          Constants.sizedBox(height: 10.0),
          Material(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.transparent,
            elevation: 8.0,
            child: TextField(
              cursorColor: AppColors.white,
              style: AppTextStyles.normalStyle(),
              decoration: buildInputDecoration(hintText: 'Mobile Number'),
            ),
          ),
          Constants.sizedBox(height: 10.0),
          Material(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.transparent,
            elevation: 8.0,
            child: TextField(
              cursorColor: AppColors.white,
              style: AppTextStyles.normalStyle(),
              decoration: buildInputDecoration(hintText: 'Email Subject'),
            ),
          ),
          Constants.sizedBox(height: 10.0),
          Material(
            borderRadius: BorderRadius.circular(10.0),
            elevation: 8,
            child: TextField(
              maxLines: 10,
              cursorColor: AppColors.white,
              style: AppTextStyles.normalStyle(),
              decoration: buildInputDecoration(hintText: 'Your Message'),
            ),
          ),
          Constants.sizedBox(height: 30.0),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.themeColor.withOpacity(1),
                  spreadRadius: 5.0,
                  blurRadius: 10.0,
                  offset: const Offset(0.5, 0.0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: AppButtons.buildMaterialButton(
                onTap: () {},
                buttonName: "Send Message📤",
              ),
            ),
          ),
          // AppButtons.buildMaterialButton(
          //     buttonName: 'Send Message', onTap: () {}),
        ],
      ),
      tablet: buildForm(),
      desktop: buildForm(),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgcolor,
      size: size, // Added this line
    );
  }

  Column buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildContactText(),
        Constants.sizedBox(height: 50.0),
        Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.transparent,
                elevation: 8.0,
                child: TextField(
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(),
                  decoration: buildInputDecoration(hintText: 'Full Name'),
                ),
              ),
            ),
            Constants.sizedBox(width: 10.0),
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.transparent,
                elevation: 8.0,
                child: TextField(
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(),
                  decoration: buildInputDecoration(hintText: 'Email Address'),
                ),
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 10.0),
        Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.transparent,
                elevation: 8.0,
                child: TextField(
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(),
                  decoration: buildInputDecoration(hintText: 'Mobile Number'),
                ),
              ),
            ),
            Constants.sizedBox(width: 10.0),
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.transparent,
                elevation: 8.0,
                child: TextField(
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(),
                  decoration: buildInputDecoration(hintText: 'Email Subject'),
                ),
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 10.0),
        Material(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.transparent,
          elevation: 8.0,
          child: TextField(
            maxLines: 10,
            cursorColor: AppColors.white,
            style: AppTextStyles.normalStyle(),
            decoration: buildInputDecoration(hintText: 'Your Message'),
          ),
        ),
        Constants.sizedBox(height: 20.0),
        AppButtons.buildMaterialButton(
            buttonName: 'Send Message', onTap: () {}),
        Constants.sizedBox(height: 20.0),
      ],
    );
  }

  FadeInDown buildContactText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Contact ',
          style: AppTextStyles.headingStyles(fontsize: 30.0),
          children: [
            TextSpan(
              text: 'Me!',
              style: AppTextStyles.headingStyles(
                  fontsize: 30.0, color: AppColors.themeColor),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.comfortaaStyle(),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none),
      filled: true,
      fillColor: Colors.white12,
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    );
  }
}

class HelperClass extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final double paddingWidth;
  final Color bgColor;
  final Size size; // Added this line

  const HelperClass({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.paddingWidth,
    required this.bgColor,
    required this.size, // Added this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768.0) {
          return Container(
            width: size.width, // Modified this line
            height: size.height, // Modified this line
            alignment: Alignment.center,
            color: bgColor,
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.03, horizontal: 18.0),
            child: mobile,
          );
        } else if (constraints.maxWidth < 1200.0) {
          return Container(
            width: size.width, // Modified this line
            height: size.height, // Modified this line
            alignment: Alignment.center,
            color: bgColor,
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.06, horizontal: paddingWidth),
            child: tablet,
          );
        } else {
          return Container(
            width: size.width, // Modified this line
            height: 700.0, // Modified this line
            alignment: Alignment.center,
            color: bgColor,
            padding: EdgeInsets.symmetric(
                vertical: 30.0, horizontal: paddingWidth),
            child: desktop,
          );
        }
      },
    );
  }
}
