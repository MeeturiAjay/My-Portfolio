import 'package:flutter/material.dart';
import 'dart:async';

class TypewriterText extends StatefulWidget {
  final List<String> textList;
  final TextStyle textStyle;
  final Duration typingDuration;
  final Duration pauseDuration;
  final Duration cursorBlinkDuration;
  final Duration initialDelayDuration;

  const TypewriterText({
    required this.textList,
    required this.textStyle,
    this.typingDuration = const Duration(milliseconds: 100),
    this.pauseDuration = const Duration(milliseconds: 1000),
    this.cursorBlinkDuration = const Duration(milliseconds: 500),
    this.initialDelayDuration = const Duration(milliseconds: 1800),
    Key? key,
  }) : super(key: key);

  @override
  _TypewriterTextState createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  int _textIndex = 0;
  int _charIndex = 0;
  bool _isBackspacing = false;
  bool _showCursor = true;
  late Timer _cursorTimer;
  Timer? _typingTimer;

  @override
  void initState() {
    super.initState();
    _startCursorBlinking();
    Future.delayed(widget.initialDelayDuration, _startTyping);
  }

  @override
  void dispose() {
    _cursorTimer.cancel();
    _typingTimer?.cancel();
    super.dispose();
  }

  void _startTyping() {
    _typingTimer = Timer.periodic(widget.typingDuration, (timer) {
      if (_isBackspacing) {
        if (_charIndex == 0) {
          setState(() {
            _isBackspacing = false;
            _textIndex = (_textIndex + 1) % widget.textList.length;
          });
        } else {
          setState(() {
            _charIndex--;
          });
        }
      } else {
        if (_charIndex < widget.textList[_textIndex].length) {
          setState(() {
            _charIndex++;
          });
        } else {
          _typingTimer?.cancel();
          Future.delayed(widget.pauseDuration, () {
            setState(() {
              _isBackspacing = true;
            });
            Future.delayed(widget.initialDelayDuration, _startTyping);  // Restart typing after pause duration and initial delay
          });
        }
      }
    });
  }

  void _startCursorBlinking() {
    _cursorTimer = Timer.periodic(widget.cursorBlinkDuration, (timer) {
      setState(() {
        _showCursor = !_showCursor;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String textToShow = widget.textList[_textIndex].substring(0, _charIndex);
    return RichText(
      text: TextSpan(
        style: widget.textStyle,
        children: [
          TextSpan(text: textToShow),
          TextSpan(
            text: _showCursor ? '|' : '',
            style: widget.textStyle.copyWith(
              color: _showCursor ? widget.textStyle.color : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
