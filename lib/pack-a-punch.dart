import 'package:flutter/material.dart';

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


class _PackAPunchPageState extends State<PackAPunchPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pack-A-Punch")
      ),
      body: Center(
          child: Text("Pack-A-Punch Page")),
    );
  }


}