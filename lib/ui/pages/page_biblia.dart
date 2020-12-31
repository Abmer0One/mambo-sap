import 'package:flutter/material.dart';


class PageBiblia extends StatefulWidget {
  @override
  _PageBibliaState createState() => _PageBibliaState();
}

class _PageBibliaState extends State<PageBiblia> {


  bool trocaTela = false;

  //------------------------------ FILTERS VARIABLE ----------------------------
  String filtersTestamento;
  String filterCapitulo;
  String filterlivro;
  String filterVersiculo;

  //------------------------------ LIST FILTERS --------------------------------
  List testamento = ["Antigo Testamento", "Novo Testamento"];

  List livroAntigoTestamento = [
    "Gênesis", "Êxodo", "Levítico", "Números", "Deuteronômio", "Josué", "Juízes",
    "Rute", "I Samuel", "II Samuel", "I Reis", "II Reis", "I Crônicas", "IICrônicas",
    "Esdras", "Neemias", "Tobias", "Judite", "Ester", "I Macabeus", "II Macabeus",
    "Jó", "Salmos", "Provérbios", "Eclesiastes", "Cântico dos Cânticos", "Sabedoria",
    "Eclesiástico", "Isaías", "Jeremias", "Lamentações", "Baruc", "Ezequiel", "Daniel",
    "Oséias", "Joel", "Amós", "Abdias", "Jonas", "Miquéias", "Naum", "Habacuc",
    "Sofonias", "Ageu", "Zacarias", "Malaquias",
  ];

  List livroNovoTestamento = [
    "Mateus", "Marcos", "Lucas", "João", "Atos dos Apóstolos", "Romanos", "I Coríntios",
    "II Coríntios", "Gálatas", "Efésios", "Filipenses", "Colossenses", "I Tessalonicenses",
    "II Tessalonicenses", "I Timóteo", "II Timóteo", "A Tito", "A Filemon", "Hebreus",
    "Epístola de São Tiago", "Epístola I de São Pedro", "Epístola II de São Pedro",
    "Epístola I de São João", "Epístola II de São João", "Epístola III de São João",
    "Epístola de São Judas", "Apocalipse",
  ];
  List capitulo = ["1","2","3","4","5","6","7","8","9","10"];
  List versiculo = ["1","2","3","4","5","6","7","8","9","10"];

  //******************************* WIDGET ROOT ********************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: trocaTela ? _allPage() : _initialPage(),
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
                  "assets/image/bible/biblia_campo.jpg",
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
              "Biblia Sagrada",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 48.0
              ),
            ),

            //:::::::::::::::::::::::::::::: SUBTITLE ::::::::::::::::::::::::::
            Text(
              "O verdadeiro amor...",
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

  //********************************** All PAGE ********************************
  _allPage(){
    return Container(
      padding: EdgeInsets.only(
        top:20,
      ),
      child: Column(
        children: [

          //:::::::::::::::::::::::: FILTERS BIBLE :::::::::::::::::::::::::::::
          _filtersContainer(),

          //:::::::::::::::::::::::: CONTAINER TEXT ::::::::::::::::::::::::::::
          Container(
            height: MediaQuery.of(context).size.height / 1.24,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              top:10,
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.black12,
            ),
            child: _allTexts(),
          ),
        ],
      ),
    );
  }

  //******************************* ALL TEXTS **********************************
  _allTexts(){
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 150,
          backgroundColor: Colors.transparent,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage("assets/image/bible/biblia_campo.jpg"),
                    fit: BoxFit.fill
                ),
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
              "Genesis",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
                fontFamily: 'Quicksand',
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                Text(
                  "Capitulo 1",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ],
            )
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
                      "Aqui vai o texto biblico",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
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

  //**************************** FILTERS CONTAINER *****************************
  _filtersContainer(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 6,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 5,),
              dropDownTutorProjecto(context, filtersTestamento, testamento,"Testamento"),
              SizedBox(width: 10,),
              dropDownTutorProjecto(context, filterlivro, livroAntigoTestamento,"Livro"),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20,),
              dropDownTutorProjecto(context, filterCapitulo, capitulo,"Capitulo"),
              SizedBox(width: 10,),
              dropDownTutorProjecto(context, filterVersiculo, versiculo,"Versiculo"),
            ],
          ),
        ],
      ),
    );
  }

  //**************************** DROPDOWN FILTERS ******************************
  Widget dropDownTutorProjecto(BuildContext context, String filtersType, List listType, String description){
    return Container(
      width: MediaQuery.of(context).size.width / 2.3,
      height: MediaQuery.of(context).size.height / 16,
      padding: EdgeInsets.only(left: 5),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField<dynamic>(
            value: filtersType,
            hint: Text(description,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.normal
              ),
            ),
            items: listType
                .map((label) => DropdownMenuItem(
              child: Text(label),
              value: label,
            )
            ).toList(),
            onChanged: (valueType) {
              setState(() => filtersType = valueType);
            },
          )
      ),
    );
  }
}
