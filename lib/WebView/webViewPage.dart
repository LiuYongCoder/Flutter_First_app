import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class WebViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new WebViewPageState();
  }
}

class WebViewPageState extends State<WebViewPage> {

  var urlString = "https://www.baidu.com";

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('百度一下'),
      ),
      body: new WebviewScaffold(
        url: urlString,
        withZoom: false,
      ),
    );
  }
}
