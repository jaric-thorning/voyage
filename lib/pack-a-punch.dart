import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

class PackAPunch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PackAPunchPage();
  }
}

class PackAPunchPage extends StatefulWidget {
  PackAPunchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PackAPunchPageState createState() => _PackAPunchPageState();
}

class _PackAPunchPageState extends State<PackAPunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Pack-A-Punch")),
        backgroundColor: Colors.grey[800],
        body: Center(
            child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.only(right: 10, left: 10, bottom: 5, top: 10),
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 4.0,
          children: <Widget>[
            Container(
              child: Image.asset("assets/images/engineroom.jpg",
                  height: 50, width: 50),
            ),
            Container(
              child: Image.asset("assets/images/engineroom.jpg",
                  height: 50, width: 50),
            ),
            Container(
              child: Image.asset("assets/images/engineroom.jpg",
                  height: 50, width: 50),
            ),
            Container(
              child: Image.asset("assets/images/engineroom.jpg",
                  height: 50, width: 50),
            ),
          ],
        )));
  }
}
