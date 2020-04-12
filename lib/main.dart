import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:voyage/pack-a-punch.dart';

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
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  static var steps = [
    "Pack-a-Punch",
    "Clocls",
    "Elementals",
    "Planets",
    "Ice Barrier",
    "Final Boss"
  ];

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
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
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
          //GridView.count(
          //primary: false,
          //crossAxisSpacing: 10,
          //mainAxisSpacing: 10,
          //crossAxisCount: 2,
          //children: <Widget>[
          //Container(
          //padding: EdgeInsets.all(8),
          //child: Text('Pack-a-Punch'),
          //color: Colors.lightGreen,
          //),
          //Container(
          //padding: EdgeInsets.all(8),
          //child: Text('Clocks'),
          //color: Colors.lightGreen,
          //),
          //Container(
          //padding: EdgeInsets.all(8),
          //child: Text('Elementals'),
          //color: Colors.lightGreen,
          //),
          //Container(
          //padding: EdgeInsets.all(8),
          //child: Text('Planets'),
          //color: Colors.lightGreen,
          //),
          //Container(
          //padding: EdgeInsets.all(8),
          //child: Text('Ice Barriers'),
          //color: Colors.lightGreen,
          //),
          //Container(
          //padding: EdgeInsets.all(8),
          //child: Text('Final Boss'),
          //color: Colors.lightGreen,
          //),
          //],
          //)
          RaisedButton(
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PackAPunch()))
            },
          )
        ]),
      ),
    );
  }

  void _menu() {}
  void _settings() {}
}
