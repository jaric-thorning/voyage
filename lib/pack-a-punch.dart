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
  List<String> images = [
    "assets/images/engineroom.jpg",
    "assets/images/cargohold.jpg",
    "assets/images/lowergrand.jpg",
    "assets/images/poopdeckr.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Pack-A-Punch")),
        backgroundColor: Colors.grey[800],
        body: Center(
            child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(right: 70, left: 70, bottom: 15, top: 15),
            color: Colors.white,
            child: Text(
              'Pack-a-Punch Guild',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
                fontSize: 25,
              ),
            ),
          ),
          GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
              itemBuilder: (BuildContext context, int index))
        ])));
  }
}
