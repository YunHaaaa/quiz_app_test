import 'package:flutter/material.dart';
import 'package:quiz_app_test/model/model_quiz.dart';
//import 'package:quiz_app_test/screen/screen_quiz.dart';

class CandWidget extends StatefulWidget {
  late VoidCallback tap;
  late String text;
  late int index;
  late double width;
  late bool answerState;

  CandWidget({required this.tap, required this.index, required this.width, required this.text, required this.answerState});
  _CandWidgetState createState() => _CandWidgetState();
}

class _CandWidgetState extends State<CandWidget> {
  // 임의추가수정
  List<int> _answers = [-1, -1, -1];
  List<bool> _answerState = [false, false, false, false];
  int _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width * 0.8,
        height: widget.width * 0.1,
        padding: EdgeInsets.fromLTRB(widget.width * 0.048, widget.width * 0.024,
            widget.width * 0.048, widget.width * 0.024),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.deepPurple),
            color: widget.answerState ? Colors.deepPurple : Colors.white),
        child: InkWell(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.width * 0.035,
              color: widget.answerState ? Colors.white : Colors.black,
            ),
          ),
          onTap: () {
            setState(() {
              widget.tap();
              widget.answerState = !widget.answerState;
            });
          },
        ));
  }

  List<Widget> _buildCandidates(double width, Quiz quiz) {
    List<Widget> _children = [];
    for (int i = 0; i < 4; i++) {
      _children.add(CandWidget(
        index: i,
        text: quiz.candidates[i],
        width: width,
        answerState: _answerState[i],
        tap: () {
          setState(() {
            for (int j = 0; j < 4; j++) {
              if (j == i) {
                _answerState[j] = true;
                _answers[_currentIndex] = j;
              } else {
                _answerState[j] = false;
              }
            }
          });
        },
      ));
      _children.add(
        Padding(
          padding: EdgeInsets.all(width * 0.024),
        ),
      );
    }
    return _children;
  }
}
