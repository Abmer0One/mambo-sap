import 'package:flutter/material.dart';

class PartilhaGravarTexto extends StatefulWidget {
  @override
  _PartilhaGravarTextoState createState() => _PartilhaGravarTextoState();
}

class _PartilhaGravarTextoState extends State<PartilhaGravarTexto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.8,
      width: MediaQuery.of(context).size.width,
      //color: Colors.black26,
      decoration: BoxDecoration(
        color: Colors.black26,
        image: DecorationImage(
            image: AssetImage("assets/image/menu/partilha_da_palavra.jpg"),
            fit: BoxFit.fill
        ),
      ),
      child: Column(

        children: [

          //************************ CONTAINER TITLE ***************************
          Container(
            height: MediaQuery.of(context).size.height / 12,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(
                top: 40,
                left: 10,
                right: 10,
                bottom: 10
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Digite o titulo'
              ),
            ),
          ),

          //************************* CARD DESCRIPTION *************************
          new Card(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.black12,
                    width: 1
                ),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 4,
              child: SingleChildScrollView(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Escreva aqui o que deseja partilhar...'
                  ),
                  maxLines: null,
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              //************************ BUTTOM CANCEL *************************
              InkWell(
                onTap: (){
                  setState(() {
                    // CANCELAR O TEXTO DE PARTILHA...
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 16,
                  width: MediaQuery.of(context).size.width / 2.2,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(
                      top: 10,
                      left: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Cancelar",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                    )
                  ),
                ),
              ),

              //************************ BUTTOM SAVE *******************************
              InkWell(
                onTap: (){
                  setState(() {
                  // GUARDAR O TEXTO DE PARTILHA...
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 16,
                  width: MediaQuery.of(context).size.width / 2.2,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(
                      top: 10,
                      right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Guardar",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),
                    )
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
