import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../globals/app_assets.dart';
import '../globals/app_buttons.dart';
import '../globals/app_text_styles.dart';
import '../globals/appcolors.dart';
import '../globals/constants.dart';

class MyPortfolio extends StatefulWidget {
  const MyPortfolio({super.key});

  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {

  bool ischurn = false, isfraud = false, ismovie = false, issenti = false, issales = false, isimage = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 810.0,
      color: AppColors.bgcolor2,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 12.0),
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
                    text: " Projects",
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
                    ischurn = value;
                  });
                },
                hoverColor: Colors.white,
                child: buildAnimatedContainer(
                    title: """Customer Churn""",
                    asset: AppAssets.churn,
                    hover: ischurn
                ),
              ),
              Constants.sizedBox(width: 35),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isfraud = value;
                  });
                },
                hoverColor: Colors.white,
                child: buildAnimatedContainer(
                    title: "Fraud Detection System",
                    asset: AppAssets.fraud,
                    hover: isfraud
                ),
              ),
              Constants.sizedBox(width: 35),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    ismovie = value;
                  });
                },
                hoverColor: Colors.white,
                child: buildAnimatedContainer(title: """Movie Recommendation""",
                    asset: AppAssets.movie,
                    hover: ismovie
                ),
              ),
            ],
          ),
          Constants.sizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    issenti = value;
                  });
                },
                hoverColor: Colors.white,
                child: buildAnimatedContainer(title: """Sentiment Analysis""",
                    asset: AppAssets.senti,
                    hover: issenti
                ),
              ),
              Constants.sizedBox(width: 35),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    issales = value;
                  });
                },
                hoverColor: Colors.white,
                child: buildAnimatedContainer(title: """Sales Forecasting""",
                    asset: AppAssets.sales,
                    hover: issales
                ),
              ),
              Constants.sizedBox(width: 35),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isimage = value;
                  });
                },
                hoverColor: Colors.white,
                child: buildAnimatedContainer(title: """Image Classification""",
                    asset: AppAssets.classify,
                    hover: isimage
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
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
              color: Colors.black26,
              spreadRadius: 4.0,
              blurRadius: 4.5,
              offset: Offset(3.0, 4.5))
        ]),
    width: hover? 320.0 : 300.0,
    height: hover? 290.0 : 270.0,
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
          style: AppTextStyles.montserratStyle(color: Colors.white, fontSize: 18.0),
        ),
        // Constants.sizedBox(height: 10),
        // Text(
        //   "driven Machine Learning Engineer, I offer a range of services to help businesses harness the power of artificial intelligence and machine learning.",
        //   style: AppTextStyles.normalStyle(),
        //   textAlign: TextAlign.center,
        // ),
        Constants.sizedBox(height: 10),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: AppColors.themeColor.withOpacity(1),
              spreadRadius: 2.0,
              blurRadius: 10.0,
              offset: const Offset(0.5, 0.0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: AppButtons.buildMaterialButton(
            onTap: () {},
            buttonName: "Github",
          ),
        ),
      ),
        Constants.sizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: AppColors.themeColor.withOpacity(1),
                spreadRadius: 2.0,
                blurRadius: 10.0,
                offset: const Offset(0.5, 0.0),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: AppButtons.buildMaterialButton(
              onTap: () {},
              buttonName: "Wanna try!",
            ),
          ),
        ),
      ],
    ),
  );
}
