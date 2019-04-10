import 'package:flutter/material.dart';


class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyPageState();
  }
}

class MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('我的'),
//      ),
      body: new Center(
        child: new Text('这是第三个页面'),
      ),
    );
  }
}