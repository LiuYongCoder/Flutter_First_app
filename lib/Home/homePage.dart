import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import '../WebView/webViewPage.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
  
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('首页'),
        actions: <Widget>[
//          IconButton(
//              icon: Icon(Icons.alarm),
//              onPressed: () {
//                print("alarm");
//              }
//          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) =>
            <PopupMenuItem<String>>[
              PopupMenuItem<String>(child: Text("热度"), value: "hot",),
              PopupMenuItem<String>(child: Text("最新"), value: "new",),
            ],
            onSelected: (String action) {
              switch (action) {
                case "hot":
                  print("hot");
                  break;
                case "new":
                  print("new");
                  break;
              }
            },
            onCanceled: () {
              print("onCanceled");
            },
          )
        ],
      ),
      body: new RandomWords(),
    );
  }

}

/**
 * 列表点击
 */
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('Welcome to Flutter',
//            style: TextStyle(color: Color(0xff4d4d4d))),
//        actions: <Widget>[
//          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
//        ],
//      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
//        setState(() {
//          if (alreadySaved) {
//            _saved.remove(pair);
//          } else {
//            _saved.add(pair);
//          }
//        });
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => new WebViewPage()
          ));
      },
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  void _pushSaved() {
//    var url = 'http://192.168.201.67:8080/foshan-basicservice-port/api/dingYue/channels';
//    var httpClient = new HttpClient();
//
//    String result;
//
//    try {
//      var request = await httpClient.getUrl(Uri.parse(url));
//      var response = await request.close();
//      if (response.statusCode == HttpStatus.ok) {
//        var json = await response.transform(Utf8Decoder()).join();
//        var datas = jsonDecode(json);
//        var array = datas['data'][0];
//        print(array['channelName']);
//      } else {
//        result =
//        'Error getting IP address:\nHttp status ${response.statusCode}';
//      }
//    } catch (exception) {
//      result = 'Failed getting IP address';
//    }
//    print(result);

    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}