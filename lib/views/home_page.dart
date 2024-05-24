import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:myportfolio/globals/app_assets.dart';
import 'package:myportfolio/globals/app_buttons.dart';
import 'package:myportfolio/globals/app_text_styles.dart';
import 'package:myportfolio/globals/appcolors.dart';
import 'package:myportfolio/globals/constants.dart';
import 'package:myportfolio/views/about_me.dart';
import 'package:myportfolio/views/contact_me.dart';
import 'package:myportfolio/views/my_portfolio.dart';
import 'package:myportfolio/views/services.dart';
import 'package:myportfolio/views/skills.dart';
import 'package:myportfolio/widgets/profile_animation.dart';
import 'package:myportfolio/widgets/type_writer_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final List<bool> _isHovered = [
    false,
    false,
    false,
    false,
    false,
    false
  ]; // Added for hover detection

  void _downloadCV({required String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      appBar: AppBar(
        backgroundColor: AppColors.bgcolor,
        elevation: 0.0,
        toolbarHeight: 80.0,
        title: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Row(
            children: [
              FadeInLeft(
                duration: Duration(milliseconds: 2100),
                child: MouseRegion(
                  onEnter: (_) => _onHover(0, true),
                  onExit: (_) => _onHover(0, false),
                  child: TextButton(
                    onPressed: () => _scrollTo(context, size.height * 0.001),
                    child: Text(
                      "Meeturi Ajay Kumar",
                      style: _isHovered[0]
                          ? AppTextStyles.headerTextStyle(fontSize: 25.0)
                              .copyWith(color: Colors.blue)
                          : AppTextStyles.headerTextStyle(fontSize: 25.0),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              // Home Button
              FadeInUp(
                duration: Duration(milliseconds: 1500),
                child: MouseRegion(
                  onEnter: (_) => _onHover(0, true), // Handle hover enter
                  onExit: (_) => _onHover(0, false), // Handle hover exit
                  child: TextButton(
                    onPressed: () => _scrollTo(context, size.height * 0.0),
                    child: Text(
                      "Home",
                      style: _isHovered[0] // Change color on hover
                          ? AppTextStyles.headerTextStyle(fontSize: 18.0)
                              .copyWith(color: Colors.blue)
                          : AppTextStyles.headerTextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              // About Button
              FadeInUp(
                duration: Duration(milliseconds: 1800),
                child: MouseRegion(
                  onEnter: (_) => _onHover(1, true),
                  onExit: (_) => _onHover(1, false),
                  child: TextButton(
                    onPressed: () => _scrollTo(context, size.height * 0.92),
                    child: Text(
                      "About",
                      style: _isHovered[1]
                          ? AppTextStyles.headerTextStyle(fontSize: 18.0)
                              .copyWith(color: Colors.blue)
                          : AppTextStyles.headerTextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              // About Button
              FadeInUp(
                duration: Duration(milliseconds: 1800),
                child: MouseRegion(
                  onEnter: (_) => _onHover(5, true),
                  onExit: (_) => _onHover(5, false),
                  child: TextButton(
                    onPressed: () => _scrollTo(context, size.height * 1.9),
                    child: Text(
                      "Skills",
                      style: _isHovered[5]
                          ? AppTextStyles.headerTextStyle(fontSize: 18.0)
                              .copyWith(color: Colors.blue)
                          : AppTextStyles.headerTextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              // Services Button
              FadeInUp(
                duration: Duration(milliseconds: 2100),
                child: MouseRegion(
                  onEnter: (_) => _onHover(2, true),
                  onExit: (_) => _onHover(2, false),
                  child: TextButton(
                    onPressed: () => _scrollTo(context, size.height * 3.32),
                    child: Text(
                      "Services",
                      style: _isHovered[2]
                          ? AppTextStyles.headerTextStyle(fontSize: 18.0)
                              .copyWith(color: Colors.blue)
                          : AppTextStyles.headerTextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              // Portfolio Button
              FadeInUp(
                duration: Duration(milliseconds: 2400),
                child: MouseRegion(
                  onEnter: (_) => _onHover(3, true),
                  onExit: (_) => _onHover(3, false),
                  child: TextButton(
                    onPressed: () => _scrollTo(context, size.height * 4.48),
                    child: Text(
                      "Portfolio",
                      style: _isHovered[3]
                          ? AppTextStyles.headerTextStyle(fontSize: 18.0)
                              .copyWith(color: Colors.blue)
                          : AppTextStyles.headerTextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              // Contact Button
              FadeInUp(
                duration: Duration(milliseconds: 2700),
                child: MouseRegion(
                  onEnter: (_) => _onHover(4, true),
                  onExit: (_) => _onHover(4, false),
                  child: TextButton(
                    onPressed: () => _scrollTo(context, size.height * 5.87),
                    child: Text(
                      "Contact",
                      style: _isHovered[4]
                          ? AppTextStyles.headerTextStyle(fontSize: 18.0)
                              .copyWith(color: Colors.blue)
                          : AppTextStyles.headerTextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: EdgeInsets.only(
          top: size.height * 0.15,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInDown(
                      duration: const Duration(milliseconds: 1500),
                      child: Text(
                        "Hello, It's Me",
                        style: AppTextStyles.montserratStyle(
                            color: Colors.white, fontSize: 24.0),
                      ),
                    ),
                    Constants.sizedBox(height: 5),
                    FadeInRight(
                      duration: const Duration(milliseconds: 1500),
                      child: Text(
                        "Meeturi Ajay Kumar",
                        style: AppTextStyles.headingStyles(),
                      ),
                    ),
                    Constants.sizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FadeInLeft(
                          duration: const Duration(milliseconds: 1500),
                          child: Text(
                            "And I'm a ",
                            style: AppTextStyles.montserratStyle(
                                color: Colors.white, fontSize: 24.0),
                          ),
                        ),
                        TypewriterText(
                          textList: const [
                            "Student",
                            "ML Engineer",
                            "DL Engineer",
                            "NLP Engineer",
                            "Data Analyst",
                            "Flutter Developer",
                            "Fresher",
                          ],
                          textStyle: AppTextStyles.montserratStyle(
                              color: Colors.red, fontSize: 24.0),
                          typingDuration: const Duration(milliseconds: 100),
                          pauseDuration: const Duration(milliseconds: 1000),
                        ),
                      ],
                    ),
                    Constants.sizedBox(height: 5),
                    FadeInDown(
                      duration: const Duration(milliseconds: 1500),
                      child: SizedBox(
                        width: size.width * 0.5,
                        child: Text(
                            '''Driven Data Scientist with a solid academic foundation and a growth mindset. Passionate about using AI/ML techniques to tackle real-world challenges, with strong technical skills in Python. Enthusiastic about turning theoretical knowledge into practical solutions to make a meaningful impact in AI.''',
                            style: AppTextStyles.normalStyle()),
                      ),
                    ),
                    Constants.sizedBox(height: 20.0),
                    Row(
                      children: [
                        FadeInUp(
                          duration: Duration(milliseconds: 1500),
                          child: SocialButton(
                            asset: AppAssets.facebook,
                            url: 'https://www.facebook.com',
                          ),
                        ),
                        Constants.sizedBox(width: 15),
                        FadeInUp(
                          duration: Duration(milliseconds: 1800),
                          child: SocialButton(
                            asset: AppAssets.twitter,
                            url: 'https://x.com/meeturi',
                          ),
                        ),
                        Constants.sizedBox(width: 15),
                        FadeInUp(
                          duration: Duration(milliseconds: 2100),
                          child: SocialButton(
                            asset: AppAssets.linkedin,
                            url:
                                'https://www.linkedin.com/in/meeturi-ajay-kumar-a02743248/',
                          ),
                        ),
                        Constants.sizedBox(width: 15),
                        FadeInUp(
                          duration: Duration(milliseconds: 2400),
                          child: SocialButton(
                            asset: AppAssets.insta,
                            url: 'https://www.instagram.com',
                          ),
                        ),
                        Constants.sizedBox(width: 15),
                        FadeInUp(
                          duration: Duration(milliseconds: 2700),
                          child: SocialButton(
                            asset: AppAssets.github,
                            url: 'https://github.com/MeeturiAjay',
                          ),
                        ),
                      ],
                    ),
                    Constants.sizedBox(height: 18),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1700),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.themeColor.withOpacity(1),
                              spreadRadius: 5.0,
                              blurRadius: 10.0,
                              offset: const Offset(0.5, 0),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: AppButtons.buildMaterialButton(
                            onTap: () => _downloadCV(
                                url:
                                    'https://drive.google.com/file/d/1q2nGleUpQe13O3jpxGmmXQTFdnIOnCn4/view?usp=sharing'),
                            buttonName: "Download CV",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ProfileAnimation()
              ],
            ),
            const SizedBox(
              height: 80.0,
            ),
            const AboutMe(),
            const MySkills(),
            const SizedBox(
              height: 80.0,
            ),
            const MyServices(),
            const SizedBox(
              height: 40.0,
            ),
            const MyPortfolio(),
            const ContactUs()
          ],
        ),
      ),
    );
  }

  void _scrollTo(BuildContext context, double offset) {
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  // Method to handle hover state changes
  void _onHover(int index, bool isHovered) {
    setState(() {
      _isHovered[index] = isHovered;
    });
  }
}

class SocialButton extends StatefulWidget {
  final String asset;
  final String url;

  const SocialButton({required this.asset, required this.url, Key? key})
      : super(key: key);

  @override
  _SocialButtonState createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool _isHovered = false;

  void _redirecturl({required String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true), // Handle hover enter
      onExit: (_) => _onHover(false), // Handle hover exit
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          border: Border.all(
              color: _isHovered ? AppColors.bgcolor : AppColors.themeColor,
              width: 2.0),
          color: _isHovered ? AppColors.themeColor : AppColors.bgcolor,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(6.0),
        child: Transform.scale(
          scale: _isHovered ? 1.2 : 1.0,
          child: InkWell(
            onTap: () => _redirecturl(url: widget.url),
            child: Image.asset(
              widget.asset,
              width: 10.0,
              height: 10.0,
              color: _isHovered ? AppColors.bgcolor : AppColors.themeColor,
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
