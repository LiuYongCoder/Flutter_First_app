import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'dart:io';
import './Home/homePage.dart';
import './My/myPage.dart';
import './Service/servicePage.dart';


void main() => runApp(MyApp());

var _bodys;
int selectedIndex = 0;
var appBarTitles = ['首页', '服务', '我的'];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Flutter',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage>  {

  void initData() {
    _bodys = [
      new HomePage(),
      new ServicePage(),
      new MyPage()
    ];
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == selectedIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(
              color: const Color(0xff2C8AE5),
              fontSize: 14.0
          ));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(
              color: const Color(0xFf2c2c2c),
              fontSize:14.0
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    initData();
    return new Scaffold(
      body: _bodys[selectedIndex],

      bottomNavigationBar: new Material(
          child: new BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: getTabTitle(0)
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    title: getTabTitle(1)
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz),
                    title: getTabTitle(2)
                ),
              ],
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
      )
    );
  }

}

