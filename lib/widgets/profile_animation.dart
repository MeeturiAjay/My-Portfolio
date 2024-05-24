import 'package:flutter/material.dart';
import '../globals/app_assets.dart';
import '../globals/appcolors.dart';

class ProfileAnimation extends StatefulWidget {
  const ProfileAnimation({Key? key}) : super(key: key);

  @override
  State<ProfileAnimation> createState() => _ProfileAnimationState();
}

class _ProfileAnimationState extends State<ProfileAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..repeat(reverse: true);

    _animation = Tween(begin: Offset.zero, end: const Offset(0.0, -0.05))
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        width: 300.0,
        height: 300.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.themeColor.withOpacity(1.0),
              spreadRadius: 24.0,
              blurRadius: 10.0,
              offset: const Offset(0.0, 0.0), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(90.0),
          child: Image.asset(
            AppAssets.profile,
            width: 350.0,
            height: 380.0,
          ),
        ),
      ),
    );}}