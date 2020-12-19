import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class PageInitial extends StatefulWidget {
  @override
  _PageInitialState createState() => _PageInitialState();
}

//***************************** GLOBAL VARIABLE ***************************** */
int numPage = 3;
final PageController _pageController = PageController(initialPage: 0);
int currentPage = 0;


//  ************************ BUILDER PAGE INDICATOR ************************* */
List<Widget> _builderPageIndicator(){
  List<Widget> list = [];
  for(int i = 0; i < numPage; i++){
    list.add(i == currentPage ? _indicator(true) : _indicator(false));
  }
  return list;
}

//******************************* INDICATOR ********************************* */
Widget _indicator(bool isActive){
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: 1
    ),
    child: AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 8,
      width: isActive ? 24.0: 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
  );
}


class _PageInitialState extends State<PageInitial> {

  //*************************** WIDGET ROOT ********************************* */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          //:::::::::::::::::::::::::::::: VIDEO :::::::::::::::::::::::::::::::::
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/image/inicial/descobre.jpg",
                  ),
                  fit: BoxFit.cover
              ),
            ),
          ),

          //:::::::::::::::::::::::: ANIMATED CONTAINER ::::::::::::::::::::::::
          _animatedContainer(),

        ],
      ),

      //:::::::::::::::::::::::::::: BOTTOM SHEEP ::::::::::::::::::::::::::::::
      bottomSheet: currentPage == numPage - 1 ? _bottomSheepStart() :Text(''),
    );
  }

  //************************* STACK CARD INFORMATION ************************ */
  _cardInformation(String title, String subtitle){
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          //::::::::::::::::::::::::::::::::: TITLE ::::::::::::::::::::::::::::
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 28.0
            ),
          ),

          //:::::::::::::::::::::::::::::: SPACE :::::::::::::::::::::::::::::::
          SizedBox(height: 10),

          //:::::::::::::::::::::::::::: SUBTITLE ::::::::::::::::::::::::::::::
          Text(
            subtitle,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.normal,
                fontSize: 18.0
            ),
          ),

        ],
      ),
    );
  }

  //*************************** SCROLL INFORMATION ************************** */
  _scrollInformation(){
    return Column(
      children: [

        //::::::::::::::::::::::::::: INDICATOR :::::::::::::::::::::::::::::::
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _builderPageIndicator(),
        ),

        //:::::::::::::::::::::: BUTTON SCROLL INDICATOR :::::::::::::::::::::::
        Container(
          height: 30,
          child: currentPage != numPage - 1 ? Expanded(
            child: Align(
              alignment: FractionalOffset.topRight,
              child: FlatButton(
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.ease,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      //height: size.height*1,
                      //-------------------------- TEXT ------------------------
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0
                        ),
                      ),
                    ),

                    //----------------------- SPACE ----------------------------
                    SizedBox(width: 5.0,),

                    //------------------------ ICON ----------------------------
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          )
              :Text(''),
        ),
      ],
    );
  }

  //************************* CARD VIEW INFORMATION ************************* */
  _cardViewInformation(){
    return Container(
      height: MediaQuery.of(context).size.height /6,
      child: PageView(
        physics: ClampingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int page){
          setState(() {
            currentPage = page;
          });
        },
        children: <Widget>[
          _cardInformation("Mambo SAP", "Seja bem vindo ao grupo de todos nós."),
          _cardInformation("Para si", "A Biblia, o Missal, sobre Litúrgia e muito mais em um só lugar."),
          _cardInformation("Desfrute do nosso App", "Com Santo António de Padua, é viva a palavra quando são as obras que falam."),
        ],
      ),
    );
  }

  //**************************** ANIMATED CONTAINER ************************* */
  _animatedContainer(){
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.3),
      decoration: BoxDecoration(
        color: Colors.white70
      ),
      height: MediaQuery.of(context).size.height / 3,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          //margin: EdgeInsets.only(top: MediaQuery.of(context).size.height),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _cardViewInformation(),
                _scrollInformation(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //**************************** BOTTOM SHEEP START ************************* */
  _bottomSheepStart(){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      color: Colors.black,

      //:::::::::::::::::::::::::::::: GET MENU PAGE :::::::::::::::::::::::::::
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => null,
              )
          );
        },

        //::::::::::::::::::::::::::: CENTER TEXT ::::::::::::::::::::::::::::::
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Vamos Começar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
