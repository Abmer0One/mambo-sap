import 'dart:async';

import 'package:flutter/material.dart';

class PartilhaGravarAudio extends StatefulWidget {
  @override
  _PartilhaGravarAudioState createState() => _PartilhaGravarAudioState();
}

class _PartilhaGravarAudioState extends State<PartilhaGravarAudio> {

  //---------------------------  VARIABLE TIMER --------------------------------
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

  //*************************** WIDGET ROOT ************************************
  @override
  Widget build(BuildContext context) {

    //:::::::::::::::::::::::::::: CONTAINER ROOT ::::::::::::::::::::::::::::::
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: Colors.black26,
        image: DecorationImage(
            image: AssetImage("assets/image/menu/partilha_da_palavra.jpg"),
            fit: BoxFit.fill
        ),
      ),
      child: _gravarAudio(),
    );
  }


  //**************************** GRAVAR AUDIO **********************************
  _gravarAudio(){

    //:::::::::::::::::::::::::: TIMER COUNT :::::::::::::::::::::::::::::::::::
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

        //:::::::::::::::::::::::::::::: TIMER :::::::::::::::::::::::::::::::::
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _labelTextTimer(
                'Hrs', hours.toString().padLeft(2, '0')),
            _labelTextTimer(
                'Min',
                minutes.toString().padLeft(2, '0')),
            _labelTextTimer(
                'Sec',
                seconds.toString().padLeft(2, '0')),
          ],
        ),

        //:::::::::::::::::::::::::::: SPACE :::::::::::::::::::::::::::::::::::
        SizedBox(height: 20),

        //::::::::::::::::::::::: BUTTON RECORDER ::::::::::::::::::::::::::::::
        Container(
          height: MediaQuery.of(context).size.height / 8,
          width: MediaQuery.of(context).size.width / 4,
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Center(
            child: InkWell(
              onTap: (){
                setState(() {
                  isActive = !isActive;
                });
              },
              child: Text(
                isActive ? 'Stop' : 'Play',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  //*************************** CARD TEXT TIMER ********************************
  _labelTextTimer(String description, String value){
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      width: MediaQuery.of(context).size.width / 4,
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          //:::::::::::::::::::::::::: TIMER VALUE :::::::::::::::::::::::::::::
          Text(
            '$value',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 50
            ),
          ),

          //::::::::::::::::::::::::::::: TIMER DESCRIPTION ::::::::::::::::::::
          Text(
            '$description',
            style: TextStyle(
                color: Colors.black26,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
        ],
      ),
    );
  }


}
