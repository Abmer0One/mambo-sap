import 'package:flutter/material.dart';
import 'dart:async';



class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = false;

  Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.teal[50],
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _labelTextTimer(
                        'HRS', hours.toString().padLeft(2, '0')),
                    _labelTextTimer(
                        'MIN',
                        minutes.toString().padLeft(2, '0')),
                    _labelTextTimer(
                        'SEC',
                        seconds.toString().padLeft(2, '0')),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                    color: Colors.pink[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(isActive ? 'Stop' : 'Play'),
                    onPressed: () {
                      setState(() {
                        isActive = !isActive;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }

  //*************************** CARD TEXT TIMER ********************************
  _labelTextTimer(String description, String value){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.teal,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
                color: Colors.white, fontSize: 55, fontWeight: FontWeight.bold),
          ),
          Text(
            '$description',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}


