import 'package:flutter/material.dart';
import 'dart:math';

class BasicClockPainter extends CustomPainter {
  DateTime datetime;
  final bool showDigitalClock;
  final bool showTicks;
  final bool showNumbers;
  final bool showAllNumbers;
  final bool showSecondHand;
  final Color hourHandColor;
  final Color minuteHandColor;
  final Color secondHandColor;
  final Color tickColor;
  final Color digitalClockColor;
  final Color numberColor;
  final double textScaleFactor;
  final bool isUp;
  final bool isBar;

  static const double BASE_SIZE = 320.0;
  static const double MINUTES_IN_HOUR = 60.0;
  static const double SECONDS_IN_MINUTE = 60.0;
  static const double HOURS_IN_CLOCK = 12.0;
  static const double HAND_PIN_HOLE_SIZE = 8.0;
  static const double STROKE_WIDTH = 3.0;

  BasicClockPainter(
      {@required this.datetime,
        this.showDigitalClock = true,
        this.showTicks = true,
        this.showNumbers = true,
        this.showSecondHand = true,
        this.hourHandColor = Colors.black,
        this.minuteHandColor = Colors.black,
        this.secondHandColor = Colors.redAccent,
        this.tickColor = Colors.grey,
        this.digitalClockColor = Colors.black,
        this.numberColor = Colors.black,
        this.showAllNumbers = false,
        this.textScaleFactor = 1.0,
        this.isBar,
        this.isUp});

  @override
  void paint(Canvas canvas, Size size) {
    double scaleFactor = size.shortestSide / BASE_SIZE;

    if (showTicks) _paintTickMarks(canvas, size, scaleFactor);
    if (showNumbers) _drawIndicators(canvas, size, scaleFactor);
    if (showAllNumbers) _drawAllIndicators(canvas, size, scaleFactor);
    if (showDigitalClock) _paintDigitalClock(canvas, size, scaleFactor);

    _paintClockHands(canvas, size, scaleFactor);
    _paintPinHole(canvas, size, scaleFactor);
    _drawSymbol(canvas, size, scaleFactor, this.isUp, this.isBar);
  }

  @override
  bool shouldRepaint(BasicClockPainter oldDelegate) {
    //return oldDelegate?.datetime?.isBefore(datetime) ?? true;
    return true;
  }

  _paintPinHole(canvas, size, scaleFactor) {
    Paint midPointStrokePainter = Paint()
      ..color = showSecondHand ? secondHandColor : minuteHandColor
      ..strokeWidth = STROKE_WIDTH * scaleFactor
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero),
        HAND_PIN_HOLE_SIZE * scaleFactor, midPointStrokePainter);
  }

  void addDigit(Canvas canvas, int digit, double scaleFactor, Size size) {

    TextStyle style = TextStyle(
        color: numberColor,
        fontWeight: FontWeight.bold,
        fontSize: 18.0 * scaleFactor * textScaleFactor);

    TextSpan span = new TextSpan(style: style, text: digit.toString());
    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();

    double radius = size.width/2 - ( scaleFactor * 40);
    double theta = ((630 - digit * 30) % 360) * pi/180;
    double x = -radius * cos(theta);
    double y = radius * sin(theta) + tp.size.height/2;
    tp.paint(canvas, size.center(-tp.size.bottomCenter(Offset(0,0))).translate(x, y));
  }



  void _drawSymbol(Canvas canvas, Size size, double scaleFactor, bool isUp, bool isBar){

    var paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.0;

    var path = Path();

    if(isUp) {
      path.moveTo(size.width / 2, 10 / 16 * size.height);
      path.lineTo(9 / 16 * size.width, 12 / 16 * size.height);
      path.lineTo(7 / 16 * size.width, 12 / 16 * size.height);
      path.lineTo(size.width / 2, 10 / 16 * size.height);

      if(isBar){
        path.moveTo(7/16 * size.width, 11/16 * size.height);
        path.lineTo(9/16 * size.width, 11/16 * size.height);
      }
    } else {
      path.moveTo(size.width / 2, 12 / 16 * size.height);
      path.lineTo(9 / 16 * size.width, 10 / 16 * size.height);
      path.lineTo(7 / 16 * size.width, 10 / 16 * size.height);
      path.lineTo(size.width / 2, 12 / 16 * size.height);

      if(isBar){
        path.moveTo(7/16 * size.width, 11/16 * size.height);
        path.lineTo(9/16 * size.width, 11/16 * size.height);
      }
    }







    path.close();

    canvas.drawPath(path, paint);

  }
  void _drawIndicators(Canvas canvas, Size size, double scaleFactor) {
    for (int i in [12, 3, 6, 9]) {
      addDigit(canvas, i, scaleFactor, size);
    }
  }

  void _drawAllIndicators(Canvas canvas, Size size, double scaleFactor) {
    for (int i = 1; i <= 12; i++) {
      addDigit(canvas, i, scaleFactor, size);
    }
  }

  Offset _getHandOffset(double percentage, double length) {
    final radians = 2 * pi * percentage;
    final angle = -pi / 2.0 + radians;

    return new Offset(length * cos(angle), length * sin(angle));
  }

  // ref: https://www.codenameone.com/blog/codename-one-graphics-part-2-drawing-an-analog-clock.html
  void _paintTickMarks(Canvas canvas, Size size, double scaleFactor) {
    double r = size.shortestSide / 2;
    double tick = 5 * scaleFactor,
        mediumTick = 2.0 * tick,
        longTick = 3.0 * tick;
    double p = longTick + 4 * scaleFactor;
    Paint tickPaint = Paint()
      ..color = tickColor
      ..strokeWidth = 2.0 * scaleFactor;

    for (int i = 1; i <= 60; i++) {
      // default tick length is short
      double len = tick;
      if (i % 15 == 0) {
        // Longest tick on quarters (every 15 ticks)
        len = longTick;
      } else if (i % 5 == 0) {
        // Medium ticks on the '5's (every 5 ticks)
        len = mediumTick;
      }
      // Get the angle from 12 O'Clock to this tick (radians)
      double angleFrom12 = i / 60.0 * 2.0 * pi;

      // Get the angle from 3 O'Clock to this tick
      // Note: 3 O'Clock corresponds with zero angle in unit circle
      // Makes it easier to do the math.
      double angleFrom3 = pi / 2.0 - angleFrom12;

      canvas.drawLine(
          size.center(Offset(cos(angleFrom3) * (r + len - p),
              sin(angleFrom3) * (r + len - p))),
          size.center(
              Offset(cos(angleFrom3) * (r - p), sin(angleFrom3) * (r - p))),
          tickPaint);
    }
  }

  void _paintClockHands(Canvas canvas, Size size, double scaleFactor) {
    double r = size.shortestSide / 2;
    double p = 0.0;
    if (showTicks) p += 28.0;
    if (showNumbers) p += 24.0;
    if (showAllNumbers) p += 24.0;
    double longHandLength = r - (p * scaleFactor);
    double shortHandLength = r - (p + 36.0) * scaleFactor;

    Paint handPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.bevel
      ..strokeWidth = STROKE_WIDTH * scaleFactor;
    double seconds = datetime.second / SECONDS_IN_MINUTE;
    double minutes = (datetime.minute) / MINUTES_IN_HOUR;
    double hour = (datetime.hour) / HOURS_IN_CLOCK;

    canvas.drawLine(
        size.center(_getHandOffset(hour, HAND_PIN_HOLE_SIZE * scaleFactor)),
        size.center(_getHandOffset(hour, shortHandLength)),
        handPaint..color = hourHandColor);

    canvas.drawLine(
        size.center(_getHandOffset(minutes, HAND_PIN_HOLE_SIZE * scaleFactor)),
        size.center(_getHandOffset(minutes, longHandLength)),
        handPaint..color = minuteHandColor);
    if (showSecondHand)
      canvas.drawLine(
          size.center(
              _getHandOffset(seconds, HAND_PIN_HOLE_SIZE * scaleFactor)),
          size.center(_getHandOffset(seconds, longHandLength)),
          handPaint..color = secondHandColor);
  }

  void _paintDigitalClock(Canvas canvas, Size size, double scaleFactor) {
    String hour = datetime.hour.toString().padLeft(2, "0");
    String minute = datetime.minute.toString().padLeft(2, "0");
    String second = datetime.second.toString().padLeft(2, "0");
    TextSpan digitalClockSpan = new TextSpan(
        style: TextStyle(
            color: digitalClockColor,
            fontSize: 18 * scaleFactor * textScaleFactor),
        text: "$hour:$minute:$second");
    TextPainter digitalClockTP = new TextPainter(
        text: digitalClockSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    digitalClockTP.layout();
    digitalClockTP.paint(
        canvas,
        size.center(
            -digitalClockTP.size.center(Offset(0.0, -size.shortestSide / 6))));
  }
}
