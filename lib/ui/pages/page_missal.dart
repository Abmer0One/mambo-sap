import 'package:flutter/material.dart';
import 'package:mambo_sap/ui/share/share_navigation_item.dart';
import 'package:mambo_sap/ui/widget_complement/menu_partilha.dart';
import 'package:mambo_sap/ui/widget_complement/missal_leituras.dart';
import 'package:mambo_sap/ui/widget_complement/missal_tempos_liturgicos.dart';
import 'package:mambo_sap/ui/widget_complement/partilha_gravar_audio.dart';
import 'package:mambo_sap/ui/widget_complement/partilha_gravar_texto.dart';

import 'page_home.dart';

class PageMissal extends StatefulWidget {


  @override
  _PageMissalState createState() => _PageMissalState();
}

class _PageMissalState extends State<PageMissal> with TickerProviderStateMixin{

  //------------------------ VARIABLES OF NAVI BOTTOM -------------------------/
  int selectedIndex = 0;
  Color backgroundColorNav = Colors.black;



  //--------------------- VARIABLE TAB OF PAGE MISSAL -------------------------/
  TabController _tabController;


  //------------------------ BOTTOM NAVIGATION ITEMS --------------------------/
  List<ShareNavigationItem> items = [
    ShareNavigationItem(Icon(Icons.menu_book_outlined), Text('Leituras'), Colors.black12),
    ShareNavigationItem(Icon(Icons.share_outlined), Text('Partilha da Palavra'), Colors.black12),
    ShareNavigationItem(Icon(Icons.workspaces_filled), Text('Tempos Liturgicos'), Colors.black12)
  ];

  //*********************************** INIT STATE ************************** */
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3,
        vsync: this
    );
  }

  //********************************* WIDGET ROOT *************************** */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          IndexedStack(
            children: <Widget>[

              //----------------------- PAGE LEITURAS ------------------------------
              PageMissalLeituras(),

              //------------------- PAGE PARTILHA DE PALAVRA -----------------------
              MenuPartilha(),

              //------------------- PAGE TEMPOS LITURGICOS -------------------------
              MissalTemposLiturgicos()

            ],
            index: selectedIndex,
          ),
        ],
      ),

      //::::::::::::::::::::::::: BOTTOM NAV CUSTOM ::::::::::::::::::::::::::::
      bottomNavigationBar: _bottomNavCustom(),
    );
  }


  //******************************* ITEM BOTTOM BAR ****************************
  Widget _buildItem(ShareNavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: 50,
      width: isSelected ? 180 : 50,
      padding: isSelected ? EdgeInsets.only(left: 16, right: 16) : null,
      decoration: isSelected ?
      BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ) : null,

      //:::::::::::::::::::::::::::: LIST ::::::::::::::::::::::::::::::::::::::
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              //::::::::::::::::::::::::::: ICON :::::::::::::::::::::::::::::::
              IconTheme(
                data: IconThemeData(
                  size: 24,
                  color: isSelected ? backgroundColorNav : Colors.black54,
                ),
                child: item.icon,
              ),

              //:::::::::::::::::::::::::::::: TEXT ::::::::::::::::::::::::::::
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: isSelected
                    ? DefaultTextStyle.merge(
                    style: TextStyle(color: backgroundColorNav),
                    child: item.title
                ) : Container(),
              )
            ],
          ),
        ],
      ),
    );
  }

  //******************************* BOTTOM NAV CUSTOM **************************
  _bottomNavCustom(){
    return Container(
      height: 56,
      padding: EdgeInsets.only(left: 20, top: 4, bottom: 4, right: 8),

      //:::::::::::::::::::::::::::::: DECORATION ::::::::::::::::::::::::::::::
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]
      ),

      //::::::::::::::::::::::::::::::::: SIZE :::::::::::::::::::::::::::::::::
      width: MediaQuery.of(context).size.width,

      //::::::::::::::::::::::::::: ROW ITEMS LIST :::::::::::::::::::::::::::::
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          var itemIndex = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = itemIndex;
                //item.title;
              });
            },
            child: _buildItem(item, selectedIndex == itemIndex),
          );
        }).toList(),
      ),
    );
  }



}


