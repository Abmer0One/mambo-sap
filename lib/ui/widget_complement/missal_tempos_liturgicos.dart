import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MissalTemposLiturgicos extends StatefulWidget {
  @override
  _MissalTemposLiturgicosState createState() => _MissalTemposLiturgicosState();
}

class _MissalTemposLiturgicosState extends State<MissalTemposLiturgicos> {

  ScrollController _scrollController;
  var slideSelecionado;

  //************************** INDICE TEMPO LITURGICO *********************** */
  List indiceTempoLiturgico = [
    {'nomeTempoLiturgico': 'Advento', 'descriptionHistory': 'Advento','selecionado': false},
    {'nomeTempoLiturgico': 'Morto', 'descriptionHistory': 'Morto', 'selecionado': false},
    {'nomeTempoLiturgico': 'Pascoa', 'descriptionHistory': 'Pascoa', 'selecionado': false},
    {'nomeTempoLiturgico': 'Quaresma', 'descriptionHistory': 'Quaresma', 'selecionado': false},
    {'nomeTempoLiturgico': 'Branco', 'descriptionHistory': 'Branco', 'selecionado': false},
    {'nomeTempoLiturgico': 'Tempo Comum', 'descriptionHistory': 'Tempo Comum', 'selecionado': false},
  ];

  //******************************* INIT STATE ****************************** */
  @override
  void initState(){
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(trocarSelector);
    setState((){
      slideSelecionado = indiceTempoLiturgico[0];
      slideSelecionado['selecionado'] = true;
    });
  }

  //***************************** CHANGE SELECTOR *************************** */
  trocarSelector(){
    var maxScrollValue = _scrollController.position.maxScrollExtent;
    var divisao = (maxScrollValue / indiceTempoLiturgico.length) + 20;
    var valorScroll = _scrollController.offset.round();
    var slideValue = (valorScroll / divisao).round();
    var currentSlide = indiceTempoLiturgico.indexWhere((slide) => slide['selecionado']);

    print(slideValue);

    setState((){
      indiceTempoLiturgico[currentSlide]['selecionado'] = false;
      slideSelecionado = indiceTempoLiturgico[slideValue];
      slideSelecionado['selecionado'] = true;
    });

  }

  //****************************** WIDGET ROOT ****************************** */
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(width: 15.0,),
          _descriptionRigthSide(),
          SizedBox(width: 10.0,),
          _shortInformation(),
          SizedBox(width: 10.0,),
          _indiceLeftSide(),
        ],
      ),
    );
  }

  //******************************* GET CARDS ******************************* */
  Widget getCards(slide){
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:  Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 1.5,
        child: Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 350,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          image: DecorationImage(

                              image: AssetImage("assets/image/inicial/padroeiro.png"),
                              fit: BoxFit.fill
                          )
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                           /* gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                                  Colors.white,
                                  Colors.black26.withOpacity(.3)
                                ]
                            )*/
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[

                              //:::::::::::::::::: TITLE :::::::::::::::::::::::
                              Text(
                                slide['nomeTempoLiturgico'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: <Widget>[
                                  Text(
                                    slide['nomeTempoLiturgico'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'Quicksand',
                                    ),
                                  ),

                                  SizedBox(width: 50,),
                                  Text(
                                    slide['nomeTempoLiturgico'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'Quicksand',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

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
                          SizedBox(height: 40,),
                          Text("Função", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),

                          SizedBox(height: 10,),

                          Text("1 de Abril, em Kasporn, Nowhere.", style: TextStyle(color: Colors.black),),

                          SizedBox(height: 20,),

                          Text("Nacionalidade", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),

                          SizedBox(height: 10,),

                          Text("bhrastshy", style: TextStyle(color: Colors.black),),

                          SizedBox(height: 20,),

                          Text("Meus Momentos", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),

                        ],
                      ),
                    )
                  ]),
                )
              ],
            ),

          ],
        ),

        /*Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            //::::::::::::::::::::::::::::: TITLE ::::::::::::::::::::::::::::::
            Center(
              child: Text(
                slide['nomeTempoLiturgico'],
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
        ),*/
      ),
    );
  }

  //******************************* SCROLL SLIDE **************************** */
  scrollToSlide(inputSlide){
    var qualSlide = indiceTempoLiturgico
        .indexWhere((slide) => slide['nomeTempoLiturgico'] == inputSlide['nomeTempoLiturgico']);
    var maxScrollValue = _scrollController.position.maxScrollExtent;
    var divisao = (maxScrollValue / indiceTempoLiturgico.length) + 20;
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
                  borderRadius: BorderRadius.circular(90.0),
                  image: DecorationImage(
                      image: AssetImage("assets/image/inicial/padroeiro.png"),
                      fit: BoxFit.fill
                  ),
                ),
              ),

              //:::::::::::::::::::::::::: SPACE :::::::::::::::::::::::::::::::
              SizedBox(height: 10,),

              //::::::::::::::::::::::::: DESCRIPTION ::::::::::::::::::::::::::
              Text(
                slide['nomeTempoLiturgico'],
                style: TextStyle(
                  fontWeight: slide['selecionado'] ? FontWeight.bold : FontWeight.normal,
                  fontSize: 17.0,
                  color: Colors.black,
                  fontFamily: 'Quicksand',
                ),
              ),

              Container(
                height: 5,
                width: MediaQuery.of(context).size.width / 8,
                color: slide['selecionado'] ? Colors.white : Colors.black,
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
      height: MediaQuery.of(context).size.height / 3.8,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color:  Colors.black12,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(
        left: 5,
      ),
        children: indiceTempoLiturgico.map((element){
          return getTitles(element);
        }).toList(),
      ),
    );
  }

  //************************** DESCRIPTION RIGTH SIDE ************************* */
  _descriptionRigthSide(){
    return Container(
      height: MediaQuery.of(context).size.height / 1.8,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        children: indiceTempoLiturgico.map((element){
          return getCards(element);
        }).toList(),
      ),
    );
  }

  //*************************** SHORT INFORMATION ******************************
  _shortInformation(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          //::::::::::::::::::::::: COLOR TEMPO LITURGICO ::::::::::::::::::::::::
          _basicInformation1("Cor", Colors.green),

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
          _basicInformation("Duração", "Maio - Nov"),

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
          _basicInformation("Duração", "Maio - Nov"),
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

  //******************************** BASIC INFORMATION *************************
  _basicInformation1(String title, Color description){
    return Container(
      child: Column(
        children: [

          //:::::::::::::::::::::::::::: TITLE :::::::::::::::::::::::::::::::::
          Text(
            title,
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.normal,
                fontSize: 14
            ),
          ),

          //:::::::::::::::::::::::::::::: SPACE :::::::::::::::::::::::::::::::
          SizedBox(height: 10,),

          //:::::::::::::::::::::::::::::: COLOR :::::::::::::::::::::::::::::::
          Container(
            height: MediaQuery.of(context).size.height / 24,
            width: MediaQuery.of(context).size.width / 8,
            decoration: BoxDecoration(
              color: description,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
        ],
      ),
    );
  }

}
