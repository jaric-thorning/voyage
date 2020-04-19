import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyage/tools/BasicClock/basic_clock.dart';

class ClockTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClockTrackerPage();
  }
}


class ClockTrackerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClockTrackerPageState();
  }

class _ClockTrackerPageState extends State<ClockTrackerPage>{


  InkWell newClock(DateTime time, bool isUp, bool isBar){
    return InkWell(
      onTap: () => print("Clock Hit"),
      child: Container(
        child: BasicClock(
          isLive: false,
          showAllNumbers: true,
          showDigitalClock: false,
          showSecondHand: false,
          showTicks: true,
          datetime: time,
          isUp: isUp,
          isBar: isBar,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Clock Tracker"),
      ),
      body: Center(
    child: GridView.count(
    crossAxisCount: 2,
      padding: EdgeInsets.only(right: 10, left: 10, bottom: 5, top: 10),
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 4.0,
      children: <Widget>[

        newClock(DateTime(2020,1,1,12,15), true, false),
        newClock(DateTime(2020,1,1,11,55), true, true),
        newClock(DateTime(2020,1,1,9,10), false, false),
        newClock(DateTime(2020,1,1,4,25), false, true)

     ],
    ),
    ));
  }
}


class TriangleDown extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.0;

    var path = Path();

    path.moveTo(size.width/2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}