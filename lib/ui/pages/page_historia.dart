import 'package:flutter/material.dart';
import 'package:mambo_sap/model/model_historia.dart';
import 'package:provider/provider.dart';

class PageHistoria extends StatefulWidget {
  @override
  _PageHistoriaState createState() => _PageHistoriaState();
}

class _PageHistoriaState extends State<PageHistoria> {

  bool selectedCard = false;
  Color colorHistorySelected = Colors.white;
  String descriptionBegin = "Conheça a Historia do Grupo";
  String historyBeginTitle = "Com Santo António de Padua, é viva a palavra quando são as obras que falam...";

  //******************************* SET INFORMATION ************************* */
  _setPrayer(String prayer, String title){
    setState((){
      descriptionBegin = prayer;
      historyBeginTitle = title;
    });
  }

  //****************************** APPBAR *********************************** */
  _appBar(){
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Historial",
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
      ],
    );
  }


  //****************************** WIDGET ROOT ****************************** */
  @override
  Widget build(BuildContext context) {
    final historiaModel = Provider.of<ModelHistoria>(context, listen: false);
    return Scaffold(
     // appBar: AppBar(title: _appBar(),),
      body: Column(
        children: <Widget>[
          SizedBox(width: 15.0,),
         _information(),
          SizedBox(width: 10.0,),
          _shortInformation(),
          SizedBox(width: 10.0,),
          _listOfHistory(historiaModel),
        ],
      ),
    );
  }

  //********************* TEXTO DESCRIPTION HISTORY ****************************
  _textoVersiculos(){
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              //:::::::::::::::::::::::::::::: DESCRIPTION :::::::::::::::::::::::
              Wrap(
                  children: <Widget>[
                    Text(
                      descriptionBegin,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ]
              ),
            ],
          ),
        )
      ]),
    );
  }

  //********************************* TITLES ***********************************
  _titles(){
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            //:::::::::::::::::: TITLE :::::::::::::::::::::::
            Text(
              historyBeginTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'Quicksand',
              ),
            ),
          ],
        ),
      ),
    );
  }

  //******************************* ALL TEXTS **********************************
  _allTexts(){
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 100,
          backgroundColor: Colors.transparent,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              //:::::::::::::::::::::: TITLES ::::::::::::::::::::::::::
              child: _titles(),
            ),
          ),
        ),
        //:::::::::::::::::::: TEXTO VERSICULOS ::::::::::::::::::::::::
        _textoVersiculos(),
      ],
    );
  }

  //****************************** INFORMATION *********************************
  _information(){
    return //:::::::::::::::::::::::: CONTAINER TEXT ::::::::::::::::::::::::::::
      Container(
        height: MediaQuery.of(context).size.height / 1.6,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          top:10,
          left: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.black12,
        ),
        child: _allTexts(),
      );
  }

  //******************************* GET TITLES ****************************** */
  Widget getHistorias(String imageHistoria, String anoHistoria, String descriptionAnoHistoria){
    return InkWell(
      onTap: (){
        selectedCard = true;
        _setPrayer(descriptionAnoHistoria, anoHistoria);
      },
      child: Padding(
        padding: EdgeInsets.all(10),

        //============================ CONTAINER INDICE ========================
        child: Container(
          height: MediaQuery.of(context).size.height / 8,
          width: MediaQuery.of(context).size.width / 4,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.all(
                color:  Colors.blue,
                style: BorderStyle.solid,
                width: 1.0
            ),
          ),
          child: Column(
            children: [

              //::::::::::::::::::::::::::: MARK CONTAINER :::::::::::::::::::::
              Container(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(
                      image: AssetImage(imageHistoria),
                      fit: BoxFit.fill
                  ),
                ),
              ),

              //:::::::::::::::::::::::::: SPACE :::::::::::::::::::::::::::::::
              SizedBox(height: 10,),

              //::::::::::::::::::::::::: DESCRIPTION ::::::::::::::::::::::::::
              Text(
                anoHistoria,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                  color: Colors.black,
                  fontFamily: 'Quicksand',
                ),
              ),

              Container(
                height: 5,
                width: MediaQuery.of(context).size.width / 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //***************************** LIST OF HSTORY *******************************
  _listOfHistory(ModelHistoria modelHistoria){
    return Column(
      children: [
        Consumer<ModelHistorial>(builder: (context, historial, child) {
          return Container(
            height: MediaQuery.of(context).size.height / 3.90,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              color: ThemeData.dark().bottomAppBarColor,
            ),
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10.0),
              itemCount: historial.historias.length,
              itemBuilder: (ctx, i){
                return getHistorias(
                  historial.historias[i].imageHistory,
                  historial.historias[i].anoHistoria,
                  historial.historias[i].descriptionAnoHistoria,
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 6 / 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
            ),
          );
        }),
      ],
    );
  }

  //*************************** SHORT INFORMATION ******************************
  _shortInformation(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          //::::::::::::::::::::::::::::: DURATION :::::::::::::::::::::::::::::::
          _basicInformation("Anos de Existência", "28"),

          //:::::::::::::::::::::::::::: CONTAINER DIVIDER :::::::::::::::::::::::
          Container(
            height: MediaQuery.of(context).size.height / 12,
            width: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              border: Border.all(
                  color:  Colors.blue,
                  style: BorderStyle.solid,
                  width: 1.0
              ),
            ),
          ),

          //::::::::::::::::::::::::::::: DURATION :::::::::::::::::::::::::::::::
          _basicInformation("Padroeiro", "Santo António \n     de Padua"),
        ],
      ),
    );
  }

  //******************************** BASIC INFORMATION *************************
  _basicInformation(String title, String description){
    return Container(
      child: Column(
        children: [

          //:::::::::::::::::::::::::::: TITLE :::::::::::::::::::::::::::::::::
          Text(
            title,
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.normal,
                fontSize: 16
            ),
          ),

          //:::::::::::::::::::::::::::::: SPACE :::::::::::::::::::::::::::::::
          SizedBox(height: 10,),

          //:::::::::::::::::::::::::::::: DESCRIPTION :::::::::::::::::::::::::
          Text(
            description,
            style: TextStyle(
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
