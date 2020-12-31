import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageActividades extends StatefulWidget {

  final index;

  const PageActividades({Key key, this.index,}) : super(key: key);

  @override
  _PageActividadesState createState() => _PageActividadesState();
}

class _PageActividadesState extends State<PageActividades> {

  //------------------------ SELECTION VARIABLE -------------------------------/
  bool selecionarData = false;
  var list = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sab", "Dom",];

  //********************************* APP BAR ******************************* */
  _appBar(){
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Actividades",
              style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            SizedBox(width: 8.0),
            Text(
              "Lsapp",
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.normal,
                  color: Colors.white70
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          "Ago",
          style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      ],
    );
  }

  //**************************** WIDGET ROOT ******************************** */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBar(),
      ),
      backgroundColor: Colors.white,
      body: _activityList(),
    );
  }

  //*************************** ACTIVITY LIST ******************************* */
  _activityList(){
    return ListView(
      children: <Widget>[

        //::::::::::::::::::::::::: TOP CONTAINER ::::::::::::::::::::::::::::::
        Container(
          //color: Colors.blue,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  7,
                  (index) => _topDateRow(index)
              ),
            ),
          ),
        ),

        //:::::::::::::::::::::::: CARD LIST ACTIVITIES ::::::::::::::::::::::::
        Column(
          children: List.generate(8, (index) => _activityInformation()),
        ),
      ],
    );
  }


  //************************** ACTIVITY INFORMATION ************************* */
  _activityInformation(){
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text(
                "13:00",
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                ),
              ),
              _timeLines(
                [20.0,30.0,40.0,10.0],
              ),
            ],
          ),
        ),
        SizedBox(width: 12.0,),
        Expanded(
          child: Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 4.0),
              color: Colors.white70,
              padding: EdgeInsets.only(
                left: 16.0,
                top: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 21.0,
                    child: Row(
                      children: <Widget>[
                        Text(
                          "13:00 - 14:00",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                        VerticalDivider(),
                        Text(
                          "Capela NSP, Golf-2",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Tarde dos Leitores",
                    style: TextStyle(
                        fontSize: 21.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  //**************************** TIME LINES ********************************* */
  _timeLines(final lines){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          4,
              (index) => Container(
            margin: EdgeInsets.symmetric(vertical: 14.0),
            width: lines[index],
            height: 2.0,
            color: Colors.blue,
          )),
    );
  }

  //***************************** TOP DATE ROW ****************************** */
  _topDateRow(final index){
    bool selecionarData = true;
    return InkWell(
      onTap: (){
        setState(() {
          selecionarData =! selecionarData;
        });
      },
      child: Container(
        decoration: selecionarData ? null :BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[

            //:::::::::::::::::::::::: DAY OF WEEK :::::::::::::::::::::::::::::
            Text(
              list[index],
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Quicksand',
                  fontWeight: selecionarData ?  FontWeight.normal : FontWeight.bold,
                  color: selecionarData ? Colors.white : Colors.blue
              ),
            ),

            //:::::::::::::::::::::::::: DAY :::::::::::::::::::::::::::::::::::
            Text(
              "${10 + index}",
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Quicksand',
                  fontWeight: selecionarData ?  FontWeight.normal : FontWeight.bold,
                  color: selecionarData ? Colors.white : Colors.blue
              ),
            ),

            //::::::::::::::::::::::::::: POINT ::::::::::::::::::::::::::::::::
            Container(
              height: 4.0,
              width: 4.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selecionarData ? Colors.white : Colors.blue
              ),
            ),
          ],
        ),
      ),
    );
  }
}






