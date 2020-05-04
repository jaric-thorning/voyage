

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomSelect extends StatelessWidget {
  
  
  Widget location(String title){
    return InkWell(child: ListTile(
      onTap: () => {},
      title: Text(title),)); 
  }
  @override
  Widget build(BuildContext context) {
    
    
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Location"),
      ),
      
      body: ListView(
        children: <Widget>[
          location("State Rooms"),
          location("1st Class Lounge"),
          location("Dining Hall"), 
          location("Upper Grand Staircase"), 
          location("Aft Deck"), 
          location("3rd Class Births")
        ],
      ),

    );
  }


}