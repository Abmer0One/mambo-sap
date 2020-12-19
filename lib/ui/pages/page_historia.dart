import 'package:flutter/material.dart';

class PageHistoria extends StatefulWidget {
  @override
  _PageHistoriaState createState() => _PageHistoriaState();
}

class _PageHistoriaState extends State<PageHistoria> {

  ScrollController _scrollController;
  var slideSelecionado;

  //************************** INDICE HISTORIA ****************************** */
  List indiceHistoria = [
    {'nomeCapitulo': '1992', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.','selecionado': false},
    {'nomeCapitulo': '1993', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.', 'selecionado': false},
    {'nomeCapitulo': '1994', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.', 'selecionado': false},
    {'nomeCapitulo': '1995', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.', 'selecionado': false},
    {'nomeCapitulo': '1996', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.', 'selecionado': false},
    {'nomeCapitulo': '1997', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.', 'selecionado': false},
    {'nomeCapitulo': '1998', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.', 'selecionado': false},
    {'nomeCapitulo': '1999', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.', 'selecionado': false},
    {'nomeCapitulo': '2000', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.', 'selecionado': false},
    {'nomeCapitulo': '2001', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.', 'selecionado': false},
    {'nomeCapitulo': '2002', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.', 'selecionado': false},
    {'nomeCapitulo': '2005', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.', 'selecionado': false},
    {'nomeCapitulo': '2016', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.', 'selecionado': false},
    {'nomeCapitulo': '2017', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.', 'selecionado': false},
    {'nomeCapitulo': '2018', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.', 'selecionado': false},
    {'nomeCapitulo': '2019', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.', 'selecionado': false},
    {'nomeCapitulo': '2020', 'descriptionHistory': 'Nesta carta de São João retrata de duas testemunhas que simbolizam todos os que receberam a missão profética e, por isso, estão disponíveis para anunciar a Boa Nova. Essas testemunhas têm a proteção de Deus e d´Ele recebem poderes extraordinários em ordem à evangelização que o Espírito Santo torna fecunda. São instrumentos nas mãos de Deus, ao serviço da humanidade. Por isso são dignos de veneração e hão-de participar na glória de Deus. A única condição para isso é que sigam o mesmo caminho que o mestre, Jesus, percorreu.', 'selecionado': false},
    {'nomeCapitulo': '2021', 'descriptionHistory': 'Aqui começa uma nova jornada.', 'selecionado': false},
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
    return Scaffold(
      appBar: AppBar(
        title: _appBar(),
      ),
      body: Row(
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
        height: 500.0,
        width: 300.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            //::::::::::::::::::::::::::::: TITLE ::::::::::::::::::::::::::::::
            Center(
              child: Text(
                slide['nomeCapitulo'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Quicksand',
                ),
              ),
            ),

            //:::::::::::::::::::::::::::::: DESCRIPTION :::::::::::::::::::::::
            Text(
              slide['descriptionHistory'],
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black,
                fontFamily: 'Quicksand',
              ),
            ),
          ],
        ),
      ),
    );
  }

  //******************************* SCROLL SLIDE **************************** */
  scrollToSlide(inputSlide){
    var qualSlide = indiceHistoria
        .indexWhere((slide) => slide['nomeCapitulo'] == inputSlide['nomeCapitulo']);
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
                width: 25,
                color: slide['selecionado'] ? Colors.yellowAccent : Colors.blue,
              ),

              //:::::::::::::::::::::::::: SPACE :::::::::::::::::::::::::::::::
              SizedBox(width: 10,),

              //::::::::::::::::::::::::: DESCRIPTION ::::::::::::::::::::::::::
              Text(
                slide['nomeCapitulo'],
                style: TextStyle(
                  fontWeight: slide['selecionado'] ? FontWeight.bold : FontWeight.normal,
                  fontSize: 17.0,
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
      width: MediaQuery.of(context).size.width / 4,
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
      width: (MediaQuery.of(context).size.width / 3) * 2,
      child: ListView(
        controller: _scrollController,
        children: indiceHistoria.map((element){
          return getCards(element);
        }).toList(),
      ),
    );
  }

}
