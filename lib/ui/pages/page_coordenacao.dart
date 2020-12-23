import 'package:flutter/material.dart';
import 'package:mambo_sap/model/model_coordenacao.dart';
import 'package:provider/provider.dart';

class PageCoordenacao extends StatefulWidget {
  @override
  _PageCoordenacaoState createState() => _PageCoordenacaoState();
}

class _PageCoordenacaoState extends State<PageCoordenacao> {



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
    final coordenador = Provider.of<ModelCoordenador>(context, listen: false);
    return Scaffold(
     // appBar: AppBar(title: _appBar(),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

        /*  Consumer<Coordenadores>(builder: (context, coordenador, child) {
            return Container(
              height: MediaQuery.of(context).size.height / 2,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(10.0),
                itemCount: coordenador.coordenadores.length,
                itemBuilder: (ctx, i){
                  return _cardCoordenador(
                      coordenador.coordenadores[i].imageCoord,
                      coordenador.coordenadores[i].cargoCoord,
                      coordenador.coordenadores[i].nameCoord,
                      "Ver",
                      "+",
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 7 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            );
          }),*/
          //::::::::::::::::::::::::::::::: SPACE ::::::::::::::::::::::::::::::
          SizedBox(height: 50,),

          _descriptionCoord("Coordenação LSAP", 38),

          //::::::::::::::::::::::::::::::: SPACE ::::::::::::::::::::::::::::::
          SizedBox(height: 30,),

          _descriptionCoord("Com Santo António de Padua, é viva a palavra quando são as obras que falam...", 24),

          //::::::::::::::::::::::::::::::: SPACE ::::::::::::::::::::::::::::::
          SizedBox(height: 40,),

          _listThemes(coordenador),
        ],
      ),
    );
  }

  _descriptionCoord(String description, double textSize){
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: MediaQuery.of(context).size.height / 8,
      width: MediaQuery.of(context).size.width / 1.5,
      child: Wrap(
        children: [
          Text(
            description,
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.normal,
                fontSize: textSize
            ),
          ),
        ],
      ),
    );
  }


  //******************************* CARD COORD ***************************** */
  _cardCoordenador(ModelCoordenador coordenador, String imageCoord, String cargoCoordenador, String nomeCoordenador, String maisCoord, String simbolCoord){
    //final coordenador = Provider.of<ModelCoordenador>(context, listen: false);
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      //width: MediaQuery.of(context).size.width / 8,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(160.0),
        color: Colors.black12,
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          //::::::::::::::::::::::::::::: IMAGE ::::::::::::::::::::::::::::::::
          Container(
            height: 150.0,
            width: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90.0),
              //color: Colors.black12,
              image: DecorationImage(
                  image: AssetImage(imageCoord),
                  fit: BoxFit.fill
              ),
            ),
          ),

          //::::::::::::::::::::::::::::::: SPACE ::::::::::::::::::::::::::::::
          SizedBox(height: 20,),

          //::::::::::::::::::::::::::: NUMBER THEME :::::::::::::::::::::::::::
          Text(
            cargoCoordenador,
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.normal,
                fontSize: 18
            ),
          ),

          //::::::::::::::::::::::::::::::: SPACE ::::::::::::::::::::::::::::::
          SizedBox(height: 5,),

          //::::::::::::::::::::::::::::: TITLE THEME ::::::::::::::::::::::::::
          Text(
            nomeCoordenador,
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),

          //::::::::::::::::::::::::::::::: SPACE ::::::::::::::::::::::::::::::
          SizedBox(height: 40,),

          //::::::::::::::::::::::::::::::: DESCRIPTION ::::::::::::::::::::::::
          InkWell(
            onTap: () => _alertConfirm(context, coordenador),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  maisCoord,
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),

                //::::::::::::::::::::::::::::::: DESCRIPTION ::::::::::::::::::::::::
                Text(
                  simbolCoord,
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  //******************************* LIST THEMES ***************************** */
  _listThemes(ModelCoordenador modelCoordenador){
    return Column(
      children: [
        Consumer<ModelCoordenacao>(builder: (context, coordenador, child) {
          return Container(
            height: MediaQuery.of(context).size.height / 2,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10.0),
              itemCount: coordenador.coordenadores.length,
              itemBuilder: (ctx, i){
                return _cardCoordenador(
                  modelCoordenador,
                  coordenador.coordenadores[i].imageCoord,
                  coordenador.coordenadores[i].cargoCoord,
                  coordenador.coordenadores[i].nameCoord,
                  "Ver",
                  "+",
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 7 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          );
        }),
      ],
    );
  }

  //------------------- RADIO BUTTON ALERT DIALOG ------------------------------
  _imageCoordenador(BuildContext context, String description){
    return Container(
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
            image: AssetImage(description),
            fit: BoxFit.cover
        ),
      ),
    );

  }

  //------------------------- INFORMATION RADIO BUTTON --------------------------------------
  _informationPay(){
    return Container(
      margin: EdgeInsets.all(5),
      child: Wrap(
        children: <Widget>[
          Text(
              "Faça o seu pagamento direito na nossa conta bancaria. "
                  "Se possivel informe o ID do seu pedido como identificação"
                  " do seu dispositivo de transferência. Para pagamentos via"
                  " DOC, seu pedido não será enviado enquanto o pagamento não"
                  " for compensado."),
        ],
      ),
    );
  }

  //----------------------------- DIALOG COFIRM --------------------------------
  _alertConfirm(BuildContext context, ModelCoordenador coordenador){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(10.0),
              ),
            ),
            child: Stack(
              children: <Widget>[
                CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 450,
                      backgroundColor: Colors.white,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/image/inicial/padroeiro.png"),
                                  fit: BoxFit.cover
                              )
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    colors: [
                                      Colors.white,
                                      Colors.white.withOpacity(.3)
                                    ]
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text("Crismado", style:
                                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40)
                                    ,),
                                  SizedBox(height: 20,),
                                  Row(
                                    children: <Widget>[
                                      Text("1 mês", style: TextStyle(color: Colors.black54, fontSize: 16),),

                                      SizedBox(width: 50,),
                                      Text("Crismado", style:
                                      TextStyle(color: Colors.black54, fontSize: 16)
                                        ,)
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
                              Text("Irmão Descobre, esta no grupo a 1 mês e bwede dia, foi na disciplina no primeiro dia, ainda não namorou com ninguem, boa menina? tem que perguntar nas 5 irmãos que ele ... o resto já sabem.",
                                style: TextStyle(color: Colors.black, height: 1.4),),
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

                              SizedBox(height: 20,),

                              //SPACE...
                              SizedBox(height: 120,)
                            ],
                          ),
                        )
                      ]),
                    )
                  ],
                ),


                Positioned.fill(
                  bottom: 50,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.blueAccent
                          ),
                          child: Align(
                              child: Text(
                                "Voltar",
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
    );
  }








}
