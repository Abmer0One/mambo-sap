import 'package:flutter/material.dart';
import 'partilha_gravar_audio.dart';
import 'partilha_gravar_texto.dart';

class MenuPartilha extends StatefulWidget {
  @override
  _MenuPartilhaState createState() => _MenuPartilhaState();
}

class _MenuPartilhaState extends State<MenuPartilha> {

  //------------------------ VARIABLE CHANGE CONTAINER ------------------------/
  bool recordAudio = false;
  bool recordTexto = false;

  //******************************* WIDGET ROOT ********************************
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _partilhaPalavra(),
    );
  }

  //************************** PARTILHA DA PALAVRA *****************************
  _partilhaPalavra(){
    return Stack(
      children: [

        //::::::::::::::::::::::: IMAGE TOP BACKGROUND :::::::::::::::::::::::::
        /*recordAudio ? PartilhaGravarAudio() : Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.black12,
            image: DecorationImage(
                image: AssetImage("assets/image/inicial/descobre.jpg"),
                fit: BoxFit.fill
            ),
          ),
        ), */recordTexto ? PartilhaGravarTexto() : Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.black12,
            image: DecorationImage(
                image: AssetImage("assets/image/menu/partilha_da_palavra.jpg"),
                fit: BoxFit.fill
            ),
          ),
        ),

        //::::::::::::::::::::::: CONTAINER BOTTOM :::::::::::::::::::::::::::::
        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 2,
          ),
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //--------------------- DESCRIPTION PAGE -------------------------
              _descriptionPage(),

              //------------------------- SPACE --------------------------------
              SizedBox(height: MediaQuery.of(context).size.height / 26,),

              //----------------------- ROW OF OPTIONS -------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  //
                  InkWell(
                    onTap: (){
                      setState(() {
                        _alertShoiceAudio(context);
                      });
                    },
                    child: _cardOption(
                        "Audio",
                        Icons.keyboard_voice_rounded
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      setState(() {
                        _alertShoiceTexto(context);
                      });
                    },
                    child: _cardOption(
                        "Texto",
                        Icons.note_add
                    ),
                  ),



                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  //**************************** DESCRIPTION PAGE ******************************
  _descriptionPage(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          "O Seu Momento de Partilha",
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 24
          ),
        ),

        Text(
          "Partilhe o conhecimento e enriqueça a sua fé, escolha a forma de partilha...",
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.normal,
              fontSize: 18
          ),
        ),
      ],
    );
  }

  //************************* CARD OPTION **************************************
  _cardOption(String title, IconData iconData){
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black12,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Icon(
            iconData,
            size: MediaQuery.of(context).size.height / 6,
          ),

          Text(
            title,
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          )
        ],
      ),
    );
  }

  //*************************** DIALOG CHOICE OPTION ***************************
  _alertShoiceAudio(BuildContext context, ){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white70,
            shape: RoundedRectangleBorder(

              borderRadius:
              BorderRadius.all(Radius.circular(20),
              ),
            ),
            child: Container(

              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //::::::::::::::::: GRAVAR BUTTON ANIMATED :::::::::::::::::::
                  InkWell(
                    onTap: (){
                      setState(() {
                        recordTexto = false;
                        recordAudio = true;
                        Navigator.pop(context);
                      });
                    },
                    child:_containerOption(Icons.record_voice_over, "Gravar"),
                  ),


                  //::::::::::::::::::::::: LISTAR BUTTON ANIMATED ::::::::::::::::::::::
                  InkWell(
                    onTap: (){
                      setState(() {
                        recordTexto = false;
                        recordAudio = true;
                        Navigator.pop(context);
                      });
                    },
                    child: _containerOption(Icons.list, "Meus Audios"),
                  ),

                ],
              ),
            ),
          );
        }
    );
  }

  //*************************** CONTAINER OPTION *******************************
  _containerOption(IconData iconData, String title){
    return Container(
      child: Row(
        children: [

          Icon(
            iconData,
            size: MediaQuery.of(context).size.height / 20,
          ),

          SizedBox(width: 10,),

          Text(
            title,
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          )
        ],
      ),
    );
  }

  //*************************** DIALOG CHOICE OPTION ***************************
  _alertShoiceTexto(BuildContext context, ){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //::::::::::::::::: GRAVAR BUTTON ANIMATED :::::::::::::::::::
                  InkWell(
                    onTap: (){
                      setState(() {
                        recordAudio = false;
                        recordTexto = true;
                        Navigator.pop(context);
                      });
                    },
                    child:_containerOption(Icons.text_fields, "Gravar"),
                  ),

                  //::::::::::::::::: LISTAR BUTTON ANIMATED :::::::::::::::::::
                  InkWell(
                    onTap: (){
                      setState(() {
                        recordAudio = false;
                        recordTexto = true;
                        Navigator.pop(context);
                      });
                    },
                    child: _containerOption(Icons.list, "Meus Textos"),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

}
