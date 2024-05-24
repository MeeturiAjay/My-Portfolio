import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:myportfolio/globals/app_assets.dart';
import 'package:myportfolio/globals/app_text_styles.dart';
import 'package:myportfolio/globals/appcolors.dart';
import 'package:myportfolio/globals/constants.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../globals/app_buttons.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> with TickerProviderStateMixin {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: AppColors.bgcolor2,
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 50.0),
      child: VisibilityDetector(
        key: Key('about_me_visibility_detector'),
        onVisibilityChanged: (visibilityInfo) {
          setState(() {
            _isVisible = visibilityInfo.visibleFraction > 0.5;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInRight(
              duration: Duration(milliseconds: _isVisible ? 1400 : 0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "About",
                  style: AppTextStyles.headingStyles(fontsize: 30.0),
                  children: [
                    TextSpan(
                      text: " Me",
                      style: AppTextStyles.headingStyles(
                        fontsize: 30.0,
                        color: AppColors.robinEdgeBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Constants.sizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: FadeInLeft(
                    duration: Duration(milliseconds: _isVisible ? 800 : 0),
                    child: Container(
                      width: 350.0,
                      height: 370.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.themeColor.withOpacity(1),
                            spreadRadius: 35.0,
                            blurRadius: 30.0,
                            offset: const Offset(0.0, 0.0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90.0),
                        child: Image.asset(
                        AppAssets.profile1,
                        width: 500.0,
                        height: 430.0,
                      ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 50.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInUp(
                        duration: Duration(milliseconds: _isVisible ? 1200 : 0),
                        child: Text(
                          "Driven Data Scientist",
                          style: AppTextStyles.montserratStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      FadeInUp(
                        duration: Duration(milliseconds: _isVisible ? 1600 : 0),
                        child: Text(
                          """
                          Hello! My name is Meeturi Ajay Kumar, and I am a passionate and driven data scientist currently pursuing my Btech in CSE at Kalasalingam University. With a solid academic foundation and a keen interest in data science, I am dedicated to leveraging data-driven insights to solve complex real-world problems.
                          
                          My journey into the world of data science began with a fascination for how data can uncover hidden patterns and drive impactful decisions. Throughout my academic career, I have honed my skills in data analysis, machine learning, and statistical modeling. I have successfully completed numerous projects that demonstrate my ability to transform raw data into actionable insights.""",
                          style: AppTextStyles.normalStyle(),
                        ),
                      ),
                      Constants.sizedBox(height: 25),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1800),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.themeColor.withOpacity(1.0),
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
                              buttonName: "Read More",
                            ),
                          ),
                        ),
                        // duration: Duration(milliseconds: _isVisible ? 2000 : 0),
                        // child: AppButtons.buildMaterialButton(
                        //   onTap: () {},
                        //   buttonName: "Read More",
                        // ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
