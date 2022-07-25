import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('My Quiz APP'),
        backgroundColor: Colors.deepPurple,
        leading: Container(), // 페이지 이동 시에 자동으로 생겨나는 뒤로가기 버튼 등을 지우는 효과
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              'images/quiz.jpeg',
              width: width * 0.8,
            ),
          ),
          Padding(padding: EdgeInsets.all(width * 0,024),),
          Text('플러터 퀴즈 앱',
          style: TextStyle(
            fontSize: width * 0.065,
            fontWeight: FontWeight.bold,
          ),),
          Text(data)
        ],
      ),
    ));
  }
}
