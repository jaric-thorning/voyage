import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyage/tools/BasicClock/basic_clock.dart';
import 'package:voyage/tools/room-select.dart';

class ElementalTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElementalTrackerPage();
  }
}


class ElementalTrackerPage extends StatefulWidget {
  ElementalTrackerPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ElementalTrackerPageState();
  }

class _ElementalTrackerPageState extends State<ElementalTrackerPage>{

  Widget createSymbol(Icon icon, String text){
    return InkWell(onTap: () => {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RoomSelect()))
    },
    child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        icon,
        Text(text)],));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Elemental Tracker"),
      ),
      body: Center(
    child: GridView.count(
    crossAxisCount: 2,
      padding: EdgeInsets.only(right: 10, left: 10, bottom: 5, top: 10),
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 4.0,
      children: <Widget>[
        createSymbol(Icon(Icons.whatshot, size: 70, color: Colors.red), "Fire"),
        createSymbol(Icon(Icons.opacity, size: 70, color: Colors.blue), "Water"),
        createSymbol(Icon(Icons.flash_on, size: 70, color: Colors.yellowAccent), "Electric"),
        createSymbol(Icon(Icons.scatter_plot, size: 70, color: Colors.lime), "Gas"),
      ]
    ),
    ));
  }
}