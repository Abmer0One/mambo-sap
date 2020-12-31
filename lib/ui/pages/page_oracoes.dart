import 'package:flutter/material.dart';


class PageOracao extends StatefulWidget {
  @override
  _PageOracaoState createState() => _PageOracaoState();
}

class _PageOracaoState extends State<PageOracao> {

  bool trocaTela = false;

  //******************************* WIDGET ROOT ********************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.menu_book),
        onPressed: (){
          setState(() {
            trocaTela = true;
          });
        },
      ),
      body: /*trocaTela ? _allPage() : */_initialPage(),
    );
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
}
