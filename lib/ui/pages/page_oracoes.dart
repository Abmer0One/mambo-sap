import 'package:flutter/material.dart';
import 'package:mambo_sap/model/model_oracao.dart';
import 'package:provider/provider.dart';


class PageOracao extends StatefulWidget {
  @override
  _PageOracaoState createState() => _PageOracaoState();
}

class _PageOracaoState extends State<PageOracao> {

  bool trocaTela = false;
  String prayerBegin = "Comece aqui a sua ligação com Deus...";
  String prayerBeginTitle = "Esteje ligado.";


  //******************************* WIDGET ROOT ********************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: trocaTela ? _allPage() :_initialPage(),
    );
  }

  //******************************* SET PRAYER ****************************** */
  _setPrayer(String prayer, String title){
    setState((){
      prayerBegin = prayer;
      prayerBeginTitle = title;
    });
  }

  //****************************** INITIAL PAGE ********************************
  _initialPage(){
    return Stack(
      children: [

        //:::::::::::::::::::::::::::::: VIDEO :::::::::::::::::::::::::::::::
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/image/bible/oracao.webp",
                ),
                fit: BoxFit.cover
            ),
          ),
        ),

        //:::::::::::::::::::::: INITIAL INFORMATION :::::::::::::::::::::::::
        _initialInformation(),

        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 1.1,
            left: MediaQuery.of(context).size.width / 1.2,
          ),
          child: FloatingActionButton(
            child: Icon(Icons.menu_book),
            onPressed: (){
              setState(() {
                trocaTela = true;
              });
            },
          ),
        )

      ],
    );
  }

  //************************** INITIAL INFORMATION *****************************
  _initialInformation(){
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 2.5,
      ),
      child: Center(
        child: Column(
          children: [

            //:::::::::::::::::::::::::::::: TITLE :::::::::::::::::::::::::::::::
            Text(
              "Orações",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 48.0
              ),
            ),

            //:::::::::::::::::::::::::::::: SUBTITLE ::::::::::::::::::::::::::
            Text(
              "Uma ligação com Deus...",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.normal,
                  fontSize: 18.0
              ),
            ),
          ],
        ),
      ),
    );
  }

  //******************************* ALL PAGE ***********************************
  _allPage(){
    final oracaoModel = Provider.of<ModelOrar>(context, listen: false);
    return Container(

      /*decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/image/bible/oracao.webp",
            ),
            fit: BoxFit.cover
        ),
      ),*/

      color: Colors.black45,
      padding: EdgeInsets.only(
        top: 25
      ),
      child: Column(
        children: [
          _information(),
          _listOfPrayers(oracaoModel)
        ],
      ),
    );
  }

  //****************************** INFORMATION *********************************
  _information(){
    return //:::::::::::::::::::::::: CONTAINER TEXT ::::::::::::::::::::::::::::
      Container(
        height: MediaQuery.of(context).size.height / 1.4,
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
              prayerBeginTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
                fontFamily: 'Quicksand',
              ),
            ),
          ],
        ),
      ),
    );
  }

  //***************************** TEXTO VERSICULOS *****************************
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
                      prayerBegin,
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

  //***************************** LIST OF PRAYERS ******************************
  _listOfPrayers(ModelOrar modelOrar){
    return Column(
      children: [
        Consumer<ModelOracao>(builder: (context, orar, child) {
          return Container(
            height: MediaQuery.of(context).size.height / 3.93,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              color: Colors.blue[700],
            ),
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(10.0),
              itemCount: orar.oracoes.length,
              itemBuilder: (ctx, i){
                return _cardPrayers(
                  orar.oracoes[i].titleOracao,
                  Icons.category,
                  orar.oracoes[i].descriptionOracao
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 6 / 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          );
        }),
      ],
    );
  }

  //****************************** CARD PRAYERS ********************************
  _cardPrayers(String titlePrayer, IconData iconLove, String descriptionPrayer){
    return InkWell(
      onTap: (){
        _setPrayer(descriptionPrayer, titlePrayer);
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 30, right: 10, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            //::::::::::::::::::::::::::::: TITLE ::::::::::::::::::::::::::::::::
            Text(
              titlePrayer,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            ),

            //::::::::::::::::::::::::::::: ICON LOVE ::::::::::::::::::::::::::::
            Icon(
              iconLove,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

}
