import 'package:flutter/material.dart';

import 'page_actividades.dart';
import 'page_biblia.dart';
import 'page_coordenacao.dart';
import 'page_historia.dart';
import 'page_missal.dart';
import 'page_oracoes.dart';


class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {

  bool opened = true;

  //***************************** WIDGET ROOT **********************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Com Santo António de Padua, é viva a palavra quando são as obras que falam...",
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 64
              ),
            ),
          ),
          _menuItem(),
          _buttonMenu(),
        ],
      )
    );
  }

  //****************************** MENU ITEM ******************************** */
  _menuItem(){
    int id = 0;
    return Stack(
      children: <Widget>[

        //::::::::::::::::::::::: MISSAL BUTTON ANIMATED ::::::::::::::::::::::
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          left: opened
              ? 0.0
              : MediaQuery.of(context).size.width / 34,
          top: opened
              ? MediaQuery.of(context).size.height / 1.5
              : MediaQuery.of(context).size.height / 44,

          //------------------------------ CLICK -------------------------------
          child: _clickMax(
            id = 1,
            Icon(
              Icons.layers,
              color: opened ? Colors.transparent :  Colors.white,
            ),
            "Missal",
            opened ? Colors.transparent : Colors.blueAccent,
              MediaQuery.of(context).size.height / 2.5,
              MediaQuery.of(context).size.width / 1.6
          ),
        ),

        //::::::::::::::::::::::: HISTORIA BUTTON ANIMATED ::::::::::::::::::::::
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          left: opened
              ? 0.0
              : MediaQuery.of(context).size.width / 1.5,
          top: MediaQuery.of(context).size.height / 44,

          //------------------------------ CLICK -------------------------------
          child: _clickMax(
            id = 2,
            Icon(
              Icons.school,
              color: opened ? Colors.transparent :  Colors.white,
            ),
            "História",
            opened ? Colors.transparent : Colors.blueAccent,
              MediaQuery.of(context).size.height / 4,
              MediaQuery.of(context).size.width / 3.5
          ),
        ),

        //::::::::::::::::::::::: COORDENAÇAO BUTTON ANIMATED ::::::::::::::::::::::::
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          left: opened
              ? 0.0
              : MediaQuery.of(context).size.width / 1.5,
          top: opened
              ? (MediaQuery.of(context).size.height / 2) - 40.0
              : MediaQuery.of(context).size.height / 3.6,

          //------------------------------ CLICK -------------------------------
          child: _clickMax(
            id = 3,
            Icon(
              Icons.person,
              color: opened ? Colors.transparent :  Colors.white,
            ),
            "Coordenação",
            opened ? Colors.transparent : Colors.blueAccent,
              MediaQuery.of(context).size.height / 4,
              MediaQuery.of(context).size.width / 3.5
          ),
        ),

        //:::::::::::::::::::::::: ACTIVIDADES BUTTON ANIMATED ::::::::::::::::::::::
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          left: opened ?
          0 : MediaQuery.of(context).size.width / 34,
          top: opened
          //FECHAR...
              ? MediaQuery.of(context).size.height / 2
          //ABRIR...
              : MediaQuery.of(context).size.height / 2.34,

          //------------------------------ CLICK -------------------------------
          child: _click(
            id = 4,
            Icon(
              opened ? null : Icons.category ,
              color: opened ? Colors.transparent :  Colors.white,
            ),
            "Actividades",
            opened ? Colors.transparent : Colors.blueAccent,
              MediaQuery.of(context).size.height / 10,
              MediaQuery.of(context).size.width / 1.6
          ),
        ),

        //:::::::::::::::::::::::: BIBLIA BUTTON ANIMATED ::::::::::::::::::::::
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          left: opened ?
          0 : MediaQuery.of(context).size.width / 34,
          top: opened
          //FECHAR...
              ? MediaQuery.of(context).size.height / 2
          //ABRIR...
              : MediaQuery.of(context).size.height / 1.88,

          //------------------------------ CLICK -------------------------------
          child: _clickMax(
              id = 5,
              Icon(
                opened ? null : Icons.build ,
                color: opened ? Colors.transparent :  Colors.white,
              ),
              "Biblia",
              opened ? Colors.transparent : Colors.blueAccent,
              MediaQuery.of(context).size.height / 3.5,
              MediaQuery.of(context).size.width / 1.08
            ),
        ),

        //:::::::::::::::::::::::: ORAÇOES BUTTON ANIMATED ::::::::::::::::::::::
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          left: opened ?
          0 : MediaQuery.of(context).size.width / 29.1,
          top: opened
          //FECHAR...
              ? MediaQuery.of(context).size.height / 2
          //ABRIR...
              : MediaQuery.of(context).size.height / 1.22,

          //------------------------------ CLICK -------------------------------
          child: _click(
            id = 6,
            Icon(
              opened ? null : Icons.title,
              color: opened ? Colors.transparent :  Colors.white,
            ),
            "Orações",
            opened ? Colors.transparent : Colors.blueAccent,
              MediaQuery.of(context).size.height / 10,
              MediaQuery.of(context).size.width / 2.2
          ),
        ),

        //:::::::::::::::::::::::: PERFIL BUTTON ANIMATED ::::::::::::::::::::::
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          left: opened ?
          0 : MediaQuery.of(context).size.width / 2,
          top: opened
          //FECHAR...
              ? MediaQuery.of(context).size.height / 2
          //ABRIR...
              : MediaQuery.of(context).size.height / 1.22,

          //------------------------------ CLICK -------------------------------
          child: _click(
            id = 7,
            Icon(
              opened ? null : Icons.title ,
              color: opened ? Colors.transparent :  Colors.white,
            ),
            "Perfil",
            opened ? Colors.transparent : Colors.blueAccent,
              MediaQuery.of(context).size.height / 10,
              MediaQuery.of(context).size.width / 2.2
          ),
        ),

      ],
    );

  }

  //****************************** BUTTON MENU ****************************** */
  _buttonMenu(){
    return Align(
      alignment: Alignment.centerLeft,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation){
          return ScaleTransition(
              child: child,
              scale: animation
          );
        },
        child: opened ?

        //::::::::::::::::::::::::::::::::: OPEN MENU ::::::::::::::::::::::::::
        InkWell(
          key: UniqueKey(),
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: _containerMenu(Icons.menu, Colors.white, Colors.blue),
          ),
          onTap: (){
            setState(() {
              opened = false;
            });
          },
        ) :

        //:::::::::::::::::::::::::::: CLOSE MENU ::::::::::::::::::::::::::::::
        InkWell(
          key: UniqueKey(),
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: _containerMenu(Icons.close, Colors.white, Colors.red),
          ),
          onTap: (){
            setState(() {
              opened = true;
            });
          },
        ),
      ),
    );
  }

  //****************************** CONTAINER MENU *************************** */
  _containerMenu(IconData iconData, Color colorIcon, Color colorContainer){
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      width: MediaQuery.of(context).size.width / 12,
      margin: EdgeInsets.only(
        top:20
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: colorContainer //Colors.redAccent
      ),
      child: Center(
        child: Icon(
            iconData,
            color: colorIcon //Colors.white
        ),
      ),
    );
  }

  //*********************************** CARD MENU *************************** */
  _cardMenu(Icon icon,String menuDescription, Color iconColor, double heightSize, double widthSize){

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: heightSize,
        width: widthSize,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: iconColor,
        ),

        //:::::::::::::::::::::: CARD COMPONENTS :::::::::::::::::::::::::::::::
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              //---------------------------- ICON ------------------------------
              icon,

              //---------------------------- SPACE -----------------------------
              SizedBox(width: 10,),

              //------------------------- DESCRIPTION --------------------------
              Text(
                menuDescription,
                style: TextStyle(
                  color: opened ? Colors.transparent : Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //********************************* CLICK ********************************* */
  _click(int id, Icon icon,String menuDescription, Color iconColor, double heightSize, double widthSize){
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation){
        return RotationTransition(
          child: child,
          turns: animation,
        );
      },
      child: InkWell(
        key: UniqueKey(),

        //:::::::::::::::::::::::: CARD MENU :::::::::::::::::::::::::::::::::::
        child: _cardMenu(icon, menuDescription, iconColor, heightSize, widthSize),

        onTap: (){
          setState(() {
            opened = true;
            var grade = id;
            switch (grade) {

              case 4: {
                // GO TO ACTIVIDADES...
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => PageActividades(),
                    )
                );
              }
              break;

              case 6: {
                // GO TO ORAÇOES...
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => PageOracao(),
                    )
                );
              }
              break;

              case 7: {
                // GO TO PERFIL...
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => null,
                    )
                );
              }
              break;

              default: {
                print("INVALID CHOICE");
              }
              break;
            }
          });
        },
      ),
    );
  }

  //*********************************** CARD MENU *************************** */
  _cardMenuMax(Icon icon,String menuDescription, Color iconColor, double heightSize, double widthSize){

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: heightSize,
        width: widthSize,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: iconColor,
        ),

        //:::::::::::::::::::::: CARD COMPONENTS :::::::::::::::::::::::::::::::
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              //---------------------------- ICON ------------------------------
              icon,

              //---------------------------- SPACE -----------------------------
              SizedBox(width: 10,),

              //------------------------- DESCRIPTION --------------------------
              Text(
                menuDescription,
                style: TextStyle(
                  color: opened ? Colors.transparent : Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //********************************* CLICK ********************************* */
  _clickMax(int id, Icon icon,String menuDescription, Color iconColor, double heightSize, double widthSize){
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation){
        return RotationTransition(
          child: child,
          turns: animation,
        );
      },
      child: InkWell(
        key: UniqueKey(),

        //:::::::::::::::::::::::: CARD MENU :::::::::::::::::::::::::::::::::::
        child: _cardMenuMax(icon, menuDescription, iconColor, heightSize, widthSize),

        onTap: (){
          setState(() {
            opened = true;
            var grade = id;
            switch (grade) {

              case 1: {
                // MISSAL...
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => PageMissal(),
                    )
                );
              }
              break;

              case 2: {
                // GO TO HISTORIA...
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => PageHistoria(),
                    )
                );
              }
              break;

              case 3: {
                // GO TO COORDENAÇÃO...
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => PageCoordenacao(),
                    )
                );
              }
              break;

              case 5: {
                // GO TO BIBLIA...
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => PageBiblia(),
                    )
                );
              }
              break;

              default: {
                print("INVALID CHOICE");
              }
              break;
            }
          });
        },
      ),
    );
  }

}
