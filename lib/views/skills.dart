import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../globals/app_text_styles.dart';
import '../globals/appcolors.dart';
import '../globals/constants.dart';

class MySkills extends StatefulWidget {
  final bool triggerAnimations; // Updated: Added triggerAnimations property

  const MySkills({Key? key, this.triggerAnimations = false}) : super(key: key);

  @override
  _MySkillsState createState() => _MySkillsState();
}

class _MySkillsState extends State<MySkills> with TickerProviderStateMixin {
  late AnimationController _mlController;
  late AnimationController _dlController;
  late AnimationController _nlpController;
  late AnimationController _pythonController;
  late AnimationController _dsController;
  late AnimationController _edaController;
  late AnimationController _sqlController;
  late AnimationController _dppController;
  late AnimationController _fdController;
  late AnimationController _firebaseController;
  late AnimationController _gitController;
  late AnimationController _communicationController;
  late AnimationController _streamlitController;
  late AnimationController _teamWorkController;
  late bool _triggered;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _triggered = widget.triggerAnimations;
    if (_triggered)
      _startAnimations(); // Start animations if triggerAnimations is initially true
  }

  @override
  void didUpdateWidget(covariant MySkills oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.triggerAnimations && widget.triggerAnimations) {
      _triggered = true;
      _resetAnimations();
      _startAnimations();
    }
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _initializeControllers() {
    _mlController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _dlController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _nlpController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _pythonController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _dsController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _edaController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _sqlController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _dppController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _fdController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _firebaseController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _gitController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _communicationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _streamlitController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _teamWorkController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  void _disposeControllers() {
    _mlController.dispose();
    _dlController.dispose();
    _nlpController.dispose();
    _pythonController.dispose();
    _dsController.dispose();
    _edaController.dispose();
    _sqlController.dispose();
    _dppController.dispose();
    _fdController.dispose();
    _firebaseController.dispose();
    _gitController.dispose();
    _communicationController.dispose();
    _streamlitController.dispose();
    _teamWorkController.dispose();
  }

  void _startAnimations() {
    _mlController.forward();
    _dlController.forward();
    _nlpController.forward();
    _pythonController.forward();
    _dsController.forward();
    _edaController.forward();
    _sqlController.forward();
    _dppController.forward();
    _fdController.forward();
    _firebaseController.forward();
    _gitController.forward();
    _communicationController.forward();
    _streamlitController.forward();
    _teamWorkController.forward();
  }

  void _resetAnimations() {
    _mlController.reset();
    _dlController.reset();
    _nlpController.reset();
    _pythonController.reset();
    _dsController.reset();
    _edaController.reset();
    _sqlController.reset();
    _dppController.reset();
    _fdController.reset();
    _firebaseController.reset();
    _gitController.reset();
    _communicationController.reset();
    _streamlitController.reset();
    _teamWorkController.reset();
  }

  Widget _buildCircularProgressIndicator(
      AnimationController controller, String label, double value) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    semanticsLabel: label,
                    value: controller.value * value,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  "${(controller.value * value * 100).toInt()}%",
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

  Widget _buildLinearProgressIndicator(
      AnimationController controller, String label, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.normalStyle(),
        ),
        Constants.sizedBox(height: 10),
        AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: LinearProgressIndicator(
                value: controller.value * value,
                color: Colors.blue,
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return VisibilityDetector(
      key: Key('my-skills-section'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction >= 0.63) {
          _resetAnimations();
          _startAnimations();
        }
      },
      child: Container(
        color: AppColors.bgcolor,
        width: size.width,
        height: 800,
        padding: EdgeInsets.symmetric(vertical: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RichText(
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
            Constants.sizedBox(height: 60.0),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCircularProgressIndicator(
                        _mlController, "Machine Learning", 0.75),
                    Constants.sizedBox(width: 50.0),
                    _buildCircularProgressIndicator(
                        _dlController, "Deep Learning", 0.7),
                    Constants.sizedBox(width: 50.0),
                    _buildCircularProgressIndicator(
                        _nlpController, "NLP", 0.55),
                    Constants.sizedBox(width: 50.0),
                    _buildCircularProgressIndicator(
                        _pythonController, "Python", 0.6),
                  ],
                ),
                Constants.sizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLinearProgressIndicator(
                        _dsController, "Data Structures & Algorithms", 0.5),
                    _buildLinearProgressIndicator(
                        _edaController, "Exploratory Data Analysis", 0.65),
                  ],
                ),
                Constants.sizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLinearProgressIndicator(_sqlController, "SQL", 0.6),
                    _buildLinearProgressIndicator(
                        _dppController, "Data (Pre)Processing", 0.8),
                  ],
                ),
                Constants.sizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLinearProgressIndicator(
                        _fdController, "Flutter Development", 0.6),
                    _buildLinearProgressIndicator(
                        _firebaseController, "Firebase", 0.6),
                  ],
                ),
                Constants.sizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLinearProgressIndicator(
                        _gitController, "Git/Github", 0.5),
                    _buildLinearProgressIndicator(
                        _communicationController, "Communication", 0.65),
                  ],
                ),
                Constants.sizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLinearProgressIndicator(
                        _streamlitController, "Streamlit", 0.5),
                    _buildLinearProgressIndicator(
                        _teamWorkController, "Team Work", 0.85),
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
