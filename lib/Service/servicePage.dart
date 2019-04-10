import 'package:flutter/material.dart';


class ServicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ServicePageState();
  }
  
}

class ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('服务'),
      ),
      body: new Center(
        child: new Text('这是第二个页面'),
      ),
    );
  }
}