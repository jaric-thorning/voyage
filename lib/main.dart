import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:voyage/pack-a-punch.dart';
import 'package:voyage/guide.dart';
import 'package:voyage/tools/clock-tracker.dart';
import 'package:voyage/tools/elemental-tracker.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
          child: Column(children: <Widget>[
        Expanded(
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
            child: Text("Voyage of Despair",
                style: TextStyle(color: Colors.white, fontSize: 30)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/voyage-of-despair.jpg"),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text("View Map"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("Guide"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Guide()));
            },
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
              leading: Icon(Icons.access_time),
              title: Text("Clock Tracker"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ClockTracker()));
              }),
              ListTile(
                  leading: Icon(Icons.access_time),
                  title: Text("Elemental Tracker"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => ElementalTracker()));
                  }
              )
        ])),
        Container(
            child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            child: Column(children: <Widget>[
              ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () {
                    Navigator.pop(context);
                  })
            ]),
          ),
        ))
      ])),
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
}
