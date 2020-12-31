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
    {
      'nomeTempoLiturgico': 'Advento',

      'descriptionHistory': 'O Tempo do Advento possui dupla característica: sendo um tempo'
      ' de preparação para as solenidades do Natal, em que comemoramos a primeira vinda do Filho de Deus '
      'entre os homens, é também um tempo em que, por meio desta lembrança, se voltam os corações para a'
      ' expectativa da segunda vinda de Cristo no fim dos tempos. Por esse duplo motivo, o tempo do Advento'
      ' se apresenta como um tempo de piedosa expectativa da vinda do Messias, além de se apresentar como um '
      'tempo de purificação de vida. O tempo do Advento inicia-se quatro domingos antes do Natal e termina'
      ' no dia 24 de Dezembro, desembocando na comemoração do nascimento de Cristo. É um tempo de festa,'
      ' mas de alegria moderada. No Advento a cor litúrgica e o Roxo sendo que no Gaudete pode se usar '
      'o rosa. Tempo de preparação para o Natal é o Advento que são quatro domingos, sendo o terceiro domingo'
      ' do Advento, o Domingo Gaudete. ',

      'imageTempoLiturgico': 'assets/image/tempos_liturgicos/tempo_de_advento.jpg',
      'selecionado': false
    },

    {
      'nomeTempoLiturgico': 'Tempo de Natal',

      'descriptionHistory': 'Após a celebração anual da Páscoa, a comemoração mais venerável para a Igreja'
      ' é o Natal do Senhor e suas primeiras manifestações, pois o Natal é um tempo de fé, alegria e '
      'acolhimento do Filho de Deus que se fez Homem. O tempo do Natal vai da véspera do Natal de Nosso '
      'Senhor até o domingo depois da festa da aparição divina, em que se comemora o Batismo de Jesus. '
      'No ciclo do Natal são celebradas as festas da Sagrada Família, de Maria, mãe de Jesus, Epifania do '
      'Senhor e do Batismo de Jesus. No Natal a cor é Branca simbolizando a paz e a harmonia. ',

      'imageTempoLiturgico': 'assets/image/tempos_liturgicos/tempo_de_natal.jpg',
      'selecionado': false
    },

    {
      'nomeTempoLiturgico': 'Quaresma',

      'descriptionHistory': 'O Tempo da Quaresma é um tempo forte de conversão e penitência, jejum, '
      'caridade e oração. É um tempo de preparação para a Páscoa do Senhor, e dura quarenta dias. Neste '
      'período não se diz o Aleluia, nem se colocam flores na Igreja, as imagens ficam veladas com '
      'tecidos roxos, com exceção da cruz, que só é velada na Semana Santa, não devem ser usados muitos '
      'instrumentos e não se canta o Glória a Deus nas alturas, para que as manifestações de alegria sejam '
      'expressadas de forma mais intensa no tempo que se segue, a Páscoa. A Quaresma inicia-se na Quarta-feira'
      ' de Cinzas, e termina na Quinta-Feira Santa antes da missa da Ceia do Senhor. Na Quaresma a cor '
      'litúrgica é o Roxo sendo que no quarto domingo, o Domingo Laetare pode se usar o rosa. Tempo de '
      'preparação para a Páscoa é a Quaresma que e composta por cinco domingos, sendo o quarto '
      'domingo da Quaresma, o Domingo Laetare. ',

      'imageTempoLiturgico': 'assets/image/tempos_liturgicos/tempo_de_quaresma.jpg',
      'selecionado': false
    },

    {
      'nomeTempoLiturgico': 'Tríduo Pascal',

      'descriptionHistory': 'O Tríduo Pascal começa com a Missa da Santa Ceia do Senhor, na Quinta-Feira Santa.'
      ' Neste dia, é celebrada a Instituição da Eucaristia e do Sacerdócio, e comemora-se o gesto de humildade '
      'de Jesus ao lavar os pés dos discípulos.Na Sexta-Feira Santa celebra-se a Paixão e Morte de Jesus Cristo.'
      ' É o único dia do ano que não tem Missa, acontece apenas uma Celebração da Palavra chamada de “Ação ou Ato'
      ' Litúrgico”. Durante o Sábado Santo, a Igreja não exerce qualquer acto litúrgico, permanecendo em contemplação'
      ' de Jesus morto e sepultado. Na noite de Sábado Santo, já pertencente ao Domingo de Páscoa, acontece a solene'
      ' Vigília pascal. Conclui-se, então, o Tríduo Pascal, que compreende a Quinta-Feira, Sexta-Feira e o Sábado Santo, '
      'que prepara o ponto máximo da Páscoa: o Domingo da Ressurreição. ',

      'imageTempoLiturgico': 'assets/image/tempos_liturgicos/triduo_pascal.png',
      'selecionado': false
    },

    {'nomeTempoLiturgico': 'Tempo de Pascoa',
      'descriptionHistory': 'A Festa da Páscoa ou da Ressurreição do Senhor, se estende por cinquenta dias entre o'
      ' domingo de Páscoa e o domingo de Pentecostes, comemorando a volta de Cristo ao Pai na Ascensão, e o envio '
      'do Espírito Santo. Estas sete semanas devem ser celebradas com alegria e exultação, como se fosse um só dia '
      'de festa, ou, melhor ainda, como se fossem um grande domingo, vivendo uma espiritualidade de alegria no Cristo '
      'Ressuscitado e crendo firmemente na vida eterna. No Tempo Pascal a cor litúrgica é o Branco simbolizando a luz, '
      'tipificando a inocência e a pureza, a alegria e a glória. ',

      'imageTempoLiturgico': 'assets/image/tempos_liturgicos/tempo_de_pascoa.jpg',
      'selecionado': false
    },

    {'nomeTempoLiturgico': 'Tempo Comum',

      'descriptionHistory': 'Além dos tempos que têm características próprias, restam no ciclo anual trinta e três ou '
      'trinta e quatro semanas nas quais são celebrados, na sua globalidade os Mistérios de Cristo. Comemora-se o próprio'
      ' Mistério de Cristo em sua plenitude, principalmente aos domingos. É um período sem grandes acontecimentos, mas '
      'que nos mostra que Deus se faz presente nas coisas mais simples. É um tempo de esperança acolhimento da Palavra de'
      ' Deus. Este tempo é chamado de Tempo Comum, mas não tem nada de vazio. É o tempo da Igreja continuar a obra de Cristo'
      ' nas lutas e no trabalho pelo Reino. O Tempo Comum é dividido em duas partes: a primeira fica compreendida entre os '
      'tempos do Natal e da Quaresma, e é um momento de esperança e de escuta da Palavra onde devemos anunciar o Reino de Deus;'
      ' a segunda parte fica entre os tempos da Páscoa e do Advento, e é o momento do cristão colocar em prática a vivência do '
      'reino e ser sinal de Cristo no mundo, ou como o mesmo Jesus disse, ser sal da terra e luz do mundo. O Tempo Comum é '
      'ainda tempo privilegiado para celebrar as memórias da Virgem Maria e dos Santos. No Tempo Comum a cor litúrgica é o '
      'verde que simboliza esperança. ',

      'imageTempoLiturgico': 'assets/image/tempos_liturgicos/tempo_comum.png',
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
                            image: AssetImage(slide['imageTempoLiturgico'].toString()),
                            fit: BoxFit.fill
                          ),
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
                              SizedBox(height: 10,),
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
                        Wrap(
                          children: <Widget>[
                            Text(
                            slide['descriptionHistory'],
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
                      image: AssetImage(slide['imageTempoLiturgico'].toString()),
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
                width: MediaQuery.of(context).size.width / 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: slide['selecionado'] ? Colors.white : Colors.black,
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
