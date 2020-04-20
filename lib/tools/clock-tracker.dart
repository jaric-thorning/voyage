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
  ClockTrackerPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ClockTrackerPageState();
  }

class _ClockTrackerPageState extends State<ClockTrackerPage>{


  DateTime _time1;
  DateTime _time2;
  DateTime _time3;
  DateTime _time4;

  List<Widget> clocks;

  Container clock1;

  @override
  void initState() {
    _time1 = DateTime(2020, 1, 1, 12, 0);
    _time2 = DateTime(2020, 1, 1, 12, 0);
    _time3 = DateTime(2020, 1, 1, 12, 0);
    _time4 = DateTime(2020, 1, 1, 12, 0);
    
    super.initState();
  }

  TimeOfDay _time = TimeOfDay(hour: 12, minute: 00);

  Future<Null> selectTime(BuildContext context, int clockNum) async {
    _time = await showTimePicker(context: context, initialTime: _time);

    setState(() {
      if(clockNum == 1){
        _time1 =  DateTime(2020,1,1,_time.hour,_time.minute);
      } else if(clockNum == 2){
        _time2 =  DateTime(2020,1,1,_time.hour,_time.minute);
      } else if(clockNum == 3){
        _time3 =  DateTime(2020,1,1,_time.hour,_time.minute);
      } else {
        _time4 =  DateTime(2020,1,1,_time.hour,_time.minute);
      }
    });
  }


  Container buildClock(int clockNum, DateTime time, bool isUp, bool isBar){
    return new Container(
        child: InkWell(
            onTap: () {
              selectTime(context, clockNum);
            },
            child: BasicClock(
              isLive: false,
              showAllNumbers: true,
              showDigitalClock: false,
              showSecondHand: false,
              showTicks: true,
              datetime: time,
              isUp: isUp,
              isBar: isBar,)
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    print(_time1);
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
        buildClock(1, _time1, true, false),
        buildClock(2, _time2, true, false),
        buildClock(3, _time3, true, false),
        buildClock(4, _time4, true, false),
      ]
    ),
    ));
  }
}