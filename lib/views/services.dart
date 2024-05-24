import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:myportfolio/globals/appcolors.dart';
import 'package:myportfolio/globals/app_text_styles.dart';
import 'package:myportfolio/globals/constants.dart';
import 'package:myportfolio/globals/app_buttons.dart';

import '../globals/app_assets.dart';

class MyServices extends StatefulWidget {
  const MyServices({super.key});

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  bool isML = false, isDL = false, isNLP = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: AppColors.bgcolor,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 1400),
            child: RichText(
              text: TextSpan(
                text: "My",
                style: AppTextStyles.headingStyles(fontsize: 30.0),
                children: [
                  TextSpan(
                    text: " Services",
                    style: AppTextStyles.headingStyles(
                        fontsize: 30.0, color: AppColors.robinEdgeBlue),
                  )
                ],
              ),
            ),
          ),
          Constants.sizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isML = value;
                  });
                },
                hoverColor: Colors.white,
                child: buildAnimatedContainer(
                    title: "Machine Learning",
                    asset: AppAssets.ml_service,
                    hover: isML
                ),
              ),
              Constants.sizedBox(width: 35),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isDL = value;
                  });
                },
                hoverColor: Colors.white,
                child: buildAnimatedContainer(
                    title: "Deep Learning",
                    asset: AppAssets.dl_service,
                    hover: isDL
                ),
              ),
              Constants.sizedBox(width: 35),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isNLP = value;
                  });
                },
                hoverColor: Colors.white,
                child: buildAnimatedContainer(title: "NLP",
                    asset: AppAssets.nlp_service,
                    hover: isNLP
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

AnimatedContainer buildAnimatedContainer(
    {required String title, required String asset, required bool hover}) {
  return AnimatedContainer(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25.0),
    decoration: BoxDecoration(
      border: hover? Border.all(color: AppColors.themeColor, width: 3.0) : null,
        color: AppColors.bgcolor2,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const [
          BoxShadow(
              color: Colors.black26,
              spreadRadius: 4.0,
              blurRadius: 4.5,
              offset: Offset(3.0, 4.5))
        ]),
    width: hover? 320.0 : 300.0,
    height: hover? 420.0 : 400.0,
    duration: const Duration(milliseconds: 600),
    child: Column(
      children: [
        Image.asset(
          asset,
          height: 90.0,
          width: 70.0,
        ),
        Text(
          title,
          style: AppTextStyles.montserratStyle(color: Colors.white, fontSize: 24.0),
        ),
        Constants.sizedBox(height: 10),
        Text(
          "driven Machine Learning Engineer, I offer a range of services to help businesses harness the power of artificial intelligence and machine learning.",
          style: AppTextStyles.normalStyle(),
          textAlign: TextAlign.center,
        ),
        Constants.sizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: AppColors.themeColor.withOpacity(1),
                spreadRadius: 5.0,
                blurRadius: 8.0,
                offset: const Offset(0.5, 0.0),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: AppButtons.buildMaterialButton(
              onTap: () {},
              buttonName: "Read More",
            ),
          ),
        ),
      ],
    ),
  );
}
