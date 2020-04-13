import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Guide extends StatelessWidget{

  Text bodyText(String text){
    return Text(text + "\n", style: TextStyle(fontSize: 20));
  }
  Text headingText(String text){
    return Text(text, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.left,);
  }


  Card entry(String title, String desc, String assetImage){
    return Card(
      child: InkWell(
    splashColor: Colors.blue.withAlpha(30),
    onTap: () {
    print('Card tapped.');
    },
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[ Container(
        height: 100,
      alignment: Alignment.center,
      child: ListTile(
    leading: CircleAvatar(
      radius: 30,
      backgroundImage: AssetImage(assetImage), // no matter how big it is, it won't overflow
      ),
    title: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
//          subtitle: Text(desc),
    ),
//        ButtonBar(
//          children: <Widget>[
//            FlatButton(
//            child: const Text('Completed'),
//            onPressed: () { /* ... */ },
//            ),
//          ],
//        )
    )])));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guide")
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
           children: <Widget>[
             entry("Retrieve the Sentinel Artifact", "","assets/images/sentinel-artifact.jpg" ),
             entry("Activate The Pack-a-Punch", "", "assets/images/pack-a-punch.jpg"),
             entry("Find The Clocks", "", "assets/images/clock.jpg"),
             entry("Kill the Elementals", "", "assets/images/elemental.jpg"),
             entry("Get the Kracken", "", "assets/images/voyage-of-despair.jpg"),
             entry("Upgrade the Kracken", "", "assets/images/kraken-upgrade.jpg"),
             entry("Shoot the Leaking Pipes", "", "assets/images/leaking-pipes.jpg"),
           ],
      ))));
  }

}