import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myportfolio/globals/app_text_styles.dart';
import 'package:myportfolio/globals/appcolors.dart';
import 'package:animate_do/animate_do.dart';

import '../globals/constants.dart';

class MySkills extends StatefulWidget {
  const MySkills({super.key});

  @override
  _MySkillsState createState() => _MySkillsState();
}

class _MySkillsState extends State<MySkills> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animations = [
      Tween<double>(begin: 0, end: 0.75).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
      Tween<double>(begin: 0, end: 0.7).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
      Tween<double>(begin: 0, end: 0.55).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
      Tween<double>(begin: 0, end: 0.6).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
      Tween<double>(begin: 0, end: 0.4).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
      Tween<double>(begin: 0, end: 0.6).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
      Tween<double>(begin: 0, end: 0.8).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
      Tween<double>(begin: 0, end: 0.6).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
      Tween<double>(begin: 0, end: 0.5).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
      Tween<double>(begin: 0, end: 0.6).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
      Tween<double>(begin: 0, end: 0.45).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
      Tween<double>(begin: 0, end: 0.75).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
    ];

    // Start the animation when the page is first built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildSkillColumn(String label, Animation<double> animation) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    value: animation.value,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  '${(animation.value * 100).toInt()}%',
                  style: AppTextStyles.normalStyle(),
                ),
              ],
            );
          },
        ),
        SizedBox(height: 20.0),
        Text(
          label,
          style: AppTextStyles.normalStyle(),
        ),
      ],
    );
  }

  Widget _buildLinearSkillColumn(String label, Animation<double> animation, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.normalStyle(),
        ),
        Constants.sizedBox(height: 10),
        Container(
          width: size.width * 0.3, // Adjust the width as needed
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return LinearProgressIndicator(
                value: animation.value,
                color: Colors.blue,
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.bgcolor,
      width: size.width,
      height: 800,
      padding: EdgeInsets.symmetric(vertical: 60.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FadeInRight(
              duration: const Duration(milliseconds: 1400),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "My",
                  style: AppTextStyles.headingStyles(fontsize: 30.0),
                  children: [
                    TextSpan(
                      text: " Skills",
                      style: AppTextStyles.headingStyles(
                        fontsize: 30.0,
                        color: AppColors.robinEdgeBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Constants.sizedBox(height: 60.0),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSkillColumn("Machine Learning", _animations[0]),
                    Constants.sizedBox(width: 50.0),
                    _buildSkillColumn("Deep Learning", _animations[1]),
                    Constants.sizedBox(width: 50.0),
                    _buildSkillColumn("NLP", _animations[2]),
                    Constants.sizedBox(width: 50.0),
                    _buildSkillColumn("Python", _animations[3]),
                  ],
                ),
                Constants.sizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLinearSkillColumn("Data Structures & Algorithms", _animations[4], size),
                    _buildLinearSkillColumn("Exploratory Data Analysis", _animations[5], size),
                  ],
                ),
                Constants.sizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLinearSkillColumn("SQL", _animations[6], size),
                    _buildLinearSkillColumn("Data (Pre)Processing", _animations[7], size),
                  ],
                ),
                Constants.sizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLinearSkillColumn("Flutter Development", _animations[8], size),
                    _buildLinearSkillColumn("Firebase", _animations[9], size),
                  ],
                ),
                Constants.sizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLinearSkillColumn("Git/Github", _animations[10], size),
                    _buildLinearSkillColumn("Communication", _animations[11], size),
                  ],
                ),
                Constants.sizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLinearSkillColumn("Streamlit", _animations[10], size),
                    _buildLinearSkillColumn("Team Work", _animations[11], size),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
