import 'package:flutter/material.dart';

class PageCoordenacao extends StatefulWidget {
  @override
  _PageCoordenacaoState createState() => _PageCoordenacaoState();
}

class _PageCoordenacaoState extends State<PageCoordenacao> {

  ScrollController _scrollController;
  var slideSelecionado;

  //************************** INDICE HISTORIA ****************************** */
  List indiceHistoria = [
    {
      'imagemCoordenador': 'assets/image/inicial/descobre.jpg',
      'cargoCoordenador': 'Coordenador',
      'nomeCoordenador': 'António Dala',
      'funcaoCoordenador': 'Gerir o grupo e o resto...',
      'contactoCoordenador': '923111111',
      'selecionado': false
    },
    {
      'imagemCoordenador': 'assets/image/inicial/descobre.jpg',
      'cargoCoordenador': 'Vice-Coordenador',
      'nomeCoordenador': 'Abiúd Mota',
      'funcaoCoordenador': 'Gerir o grupo e o resto...',
      'contactoCoordenador': '923222222',
      'selecionado': false
    },
    {
      'imagemCoordenador': 'assets/image/inicial/descobre.jpg',
      'cargoCoordenador': 'Secretária',
      'nomeCoordenador': 'Valeriana Tito',
      'funcaoCoordenador': 'Gerir o grupo e o resto...',
      'contactoCoordenador': '923333333',
      'selecionado': false
    },
    {
      'imagemCoordenador': 'assets/image/inicial/descobre.jpg',
      'cargoCoordenador': 'Tesoureira',
      'nomeCoordenador': 'Siria Tenente',
      'funcaoCoordenador': 'Gerir o grupo e o resto...',
      'contactoCoordenador': '923444444',
      'selecionado': false
    },
    {
      'imagemCoordenador': 'assets/image/inicial/descobre.jpg',
      'cargoCoordenador': 'Disciplinar',
      'nomeCoordenador': 'Emelinda Andre',
      'funcaoCoordenador': 'Gerir o grupo e o resto...',
      'contactoCoordenador': '92355555',
      'selecionado': false
    },
    {
      'imagemCoordenador': 'assets/image/inicial/descobre.jpg',
      'cargoCoordenador': 'Vice-Disciplinar',
      'nomeCoordenador': 'Lidia Joaquim',
      'funcaoCoordenador': 'Gerir o grupo e o resto...',
      'contactoCoordenador': '923666666',
      'selecionado': false
    },
    {
      'imagemCoordenador': 'assets/image/inicial/descobre.jpg',
      'cargoCoordenador': 'Coord. JCD',
      'nomeCoordenador': 'Celso Alexandre',
      'funcaoCoordenador': 'Gerir o grupo e o resto...',
      'contactoCoordenador': '923777777',
      'selecionado': false
    },
    {
      'imagemCoordenador': 'assets/image/inicial/descobre.jpg',
      'cargoCoordenador': 'Coord. Mirrins',
      'nomeCoordenador': 'Joelma Malheiro',
      'funcaoCoordenador': 'Gerir o grupo e o resto...',
      'contactoCoordenador': '923888888',
      'selecionado': false
    },

  ];

  //******************************* INIT STATE ****************************** */
  @override
  void initState(){
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(trocarSelector);
    setState((){
      slideSelecionado = indiceHistoria[0];
      slideSelecionado['selecionado'] = true;
    });
  }

  //***************************** CHANGE SELECTOR *************************** */
  trocarSelector(){
    var maxScrollValue = _scrollController.position.maxScrollExtent;
    var divisao = (maxScrollValue / indiceHistoria.length) + 20;
    var valorScroll = _scrollController.offset.round();
    var slideValue = (valorScroll / divisao).round();
    var currentSlide = indiceHistoria.indexWhere((slide) => slide['selecionado']);

    print(slideValue);

    setState((){
      indiceHistoria[currentSlide]['selecionado'] = false;
      slideSelecionado = indiceHistoria[slideValue];
      slideSelecionado['selecionado'] = true;
    });

  }

  //****************************** APPBAR *********************************** */
  _appBar(){
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Coordenação",
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
    return Scaffold(
      appBar: AppBar(
        title: _appBar(),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 15.0,),
          _indiceLeftSide(),
          SizedBox(width: 10.0,),
          _descriptionRigthSide(),
        ],
      ),
    );
  }

  //******************************* GET CARDS ******************************* */
  Widget getCards(slide){
    return Padding(
      padding: EdgeInsets.only(
          top: 15.0,
          right: 10.0
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:  Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        height: MediaQuery.of(context).size.height / 2.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //:::::::::::::::::::::::::::: IMAGE :::::::::::::::::::::::::::
            Container(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/image/inicial/descobre.jpg",
                    ),
                    fit: BoxFit.cover
                ),
              ),
            ),

            //::::::::::::::::::::::::: SPACE ::::::::::::::::::::::::::::::
            SizedBox(height: 10,),

            //:::::::::::::::::::: DESCRIPTION CARD ::::::::::::::::::::::::
            _descriptionCard(slide),

            //:::::::::::::::::::::::::: BUTTON MORE :::::::::::::::::::::::
            InkWell(
              key: UniqueKey(),
              child: Container(
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.width / 8,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 3.5,
                  top: MediaQuery.of(context).size.height / 998,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red
                ),
                child: Center(
                  child: Icon(
                      Icons.post_add_sharp,
                      color: Colors.white
                  ),
                ),
              ),
              onTap: (){
                setState(() {

                });
              },
            ),
          ],
        ),
      ),
    );
  }

  //****************************** DESCRIPTION CARD ************************* */
  _descriptionCard(slide){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        //::::::::::::::::::::::::::::: TITLE ::::::::::::::::::::::::::::::
        _formItemCard(Icons.workspaces_filled, slide['cargoCoordenador'], 18),

        //:::::::::::::::::::::::::::::: NAME ::::::::::::::::::::::::::
        _formItemCard(Icons.person_pin, slide['nomeCoordenador'], 20),

        //:::::::::::::::::::::::::::::: PHONE :::::::::::::::::::::::::
        _formItemCard(Icons.phone, slide['contactoCoordenador'], 18),

      ],
    );
  }

  //**************************** FORM ITEM CARD ***************************** */
  _formItemCard(IconData iconData, String description, double sizeText){
    return Row(
      children: [

        //:::::::::::::::::::::::::::::: ICON :::::::::::::::::::::::::::
        Icon(
            iconData,
            color: Colors.red
        ),

        //:::::::::::::::::::::::::::::: SPACE :::::::::::::::::::::::::::
        SizedBox(width: 5,),

        //:::::::::::::::::::::::::::::: DESCRIPTION :::::::::::::::::::::::::::
        Text(
          description,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18,
            color: Colors.black,
            fontFamily: 'Quicksand',
          ),
        ),

      ],
    );
  }

  //******************************* SCROLL SLIDE **************************** */
  scrollToSlide(inputSlide){
    var qualSlide = indiceHistoria
        .indexWhere((slide) => slide['cargoCoordenador'] == inputSlide['cargoCoordenador']);
    var maxScrollValue = _scrollController.position.maxScrollExtent;
    var divisao = (maxScrollValue / indiceHistoria.length) + 20;
    var scrollToValue = qualSlide * divisao;
    _scrollController.animateTo(
        scrollToValue,
        duration: Duration(milliseconds: 1),
        curve: Curves.easeIn
    );
  }

  //******************************* GET TITLES ****************************** */
  Widget getTitles(slide){
    return InkWell(
      onTap: (){
        scrollToSlide(slide);
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: 10,
        ),

        //============================ CONTAINER INDICE ========================
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(
                color:  Colors.blue,
                style: BorderStyle.solid,
                width: 1.0
            ),
          ),
          child: Row(
            children: [

              //::::::::::::::::::::::::::: MARK CONTAINER :::::::::::::::::::::
              Container(
                height: 25,
                width: 10,
                color: slide['selecionado'] ? Colors.yellowAccent : Colors.blue,
              ),

              //:::::::::::::::::::::::::: SPACE :::::::::::::::::::::::::::::::
              SizedBox(width: 10,),

              //::::::::::::::::::::::::: DESCRIPTION ::::::::::::::::::::::::::
              Text(
                slide['cargoCoordenador'],
                style: TextStyle(
                  fontWeight: slide['selecionado'] ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'Quicksand',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //***************************** INDICE LEFT SIDE ************************** */
  _indiceLeftSide(){
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      child: ListView(
        children: indiceHistoria.map((element){
          return getTitles(element);
        }).toList(),
      ),
    );
  }

  //************************** DESCRIPTION RIGTH SIDE ************************* */
  _descriptionRigthSide(){
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: ListView(
        controller: _scrollController,
        children: indiceHistoria.map((element){
          return getCards(element);
        }).toList(),
      ),
    );
  }

}
