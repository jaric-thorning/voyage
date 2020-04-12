import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:sticky_headers/sticky_headers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voyage',
      theme: ThemeData(primaryColor: Colors.grey[850]),
      home: MyHomePage(title: 'Voyage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _menu,
        ),
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert), onPressed: _settings)
        ],
      ),
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 480),
          padding: EdgeInsets.only(right: 70, left: 70, bottom: 15, top: 15),
          color: Colors.white,
          child: Text(
            'Walkthrough Guide',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }

  void _menu() {}
  void _settings() {}
}
