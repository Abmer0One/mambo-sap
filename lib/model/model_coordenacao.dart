import 'package:flutter/material.dart';

class ModelCoordenacao with ChangeNotifier {
  final List<ModelCoordenador> coordenadores = [
    ModelCoordenador(
      position: 7,
      imageCoord: "assets/image/inicial/padroeiro.png",
      nameCoord: "António Dala",
      cargoCoord: "Coordenador",
      funcaoCoord: "O Coordenador como responsável máximo tem o dever de garantir o "
          "bom ambiente no seio do grupo e manter o normal funcionamento das actividades"
          "do grupo, assim como a sua manutenção, então deve: \n\n"
          "Velar pelo respeito mútuo, a boa relação entre os membros.\n"
          "Velar pela unidade do grupo e a superação continua das dificuldades encontradas.\n"
          "Estar situado sobre todas as reuniões marcadas dentro e fora da capela.\n"
          "Marcar reuniões com os coordenadores no sentido de acompanhar, avaliar os trabalhos"
          "e identificar as suas dificuldades e encontrar as soluções.\n"
          "Dar abertura e dirigir as reuniões trimestrais.\n"
          "Assinar os documentos de interesse do grupo.\n"
          "Nomear novos coordenadores e destituir.\n"
          "Apoiar todas as comissões de trabalho.\n"
          "Supervisionar as actividades do grupo e os prazos de elaboração de relatórios"
          "e prestação de contas.\n"
          "Representar o grupo nas reuniões do Conselho do Centro, CJC e Liturgia. "
          "Transmitir essas informações ao secretário e este por sua vez encarregar-se-á em "
          "transmitir e sensibiliza-los.",
      contactoCoord: "923777777",
    ),
    ModelCoordenador(
      position: 7,
      imageCoord: "assets/image/inicial/padroeiro.png",
      nameCoord: "Abiúd Mota",
      cargoCoord: "Vice-Coordenador",
      funcaoCoord: "Gerir o grupo e o resto...",
      contactoCoord: "923777777",
    ),
    ModelCoordenador(
      position: 7,
      imageCoord: "assets/image/inicial/padroeiro.png",
      nameCoord: "Valeriana Tito",
      cargoCoord: "Coordenadora da Secretária",
      funcaoCoord: "Gerir o grupo e o resto...",
      contactoCoord: "923777777",
    ),
    ModelCoordenador(
      position: 7,
      imageCoord: "assets/image/inicial/padroeiro.png",
      nameCoord: "Siria Tenente",
      cargoCoord: "Coordenador da Tesouraria",
      funcaoCoord: "Gerir o grupo e o resto...",
      contactoCoord: "923777777",
    ),
    ModelCoordenador(
      position: 7,
      imageCoord: "assets/image/inicial/padroeiro.png",
      nameCoord: "Emelinda Andre",
      cargoCoord: "Coordenadora Disciplinar",
      funcaoCoord: "Gerir o grupo e o resto...",
      contactoCoord: "923777777",
    ),
    ModelCoordenador(
      position: 7,
      imageCoord: "assets/image/inicial/padroeiro.png",
      nameCoord: "Lidia Joaquim",
      cargoCoord: "Vice-Coordenadora Disciplinar",
      funcaoCoord: "Gerir o grupo e o resto...",
      contactoCoord: "923777777",
    ),
    ModelCoordenador(
      position: 7,
      imageCoord: "assets/image/inicial/padroeiro.png",
      nameCoord: "Joelma Malheiro",
      cargoCoord: "Coordenadora dos Mirins",
      funcaoCoord: "Gerir o grupo e o resto...",
      contactoCoord: "988888888",
    ),
    ModelCoordenador(
      position: 7,
      imageCoord: "assets/image/inicial/padroeiro.png",
      nameCoord: "Celso Alexandre",
      cargoCoord: "Coordenador de J.C.D",
      funcaoCoord: "Gerir o grupo e o resto...",
      contactoCoord: "988888888",
    ),
  ];
}

class ModelCoordenador with ChangeNotifier {
  final int position;
  final String imageCoord;
  final String nameCoord;
  final String cargoCoord;
  final String funcaoCoord;
  final String contactoCoord;

  ModelCoordenador(
      {
        @required this.position,
        @required this.imageCoord,
        @required this.nameCoord,
        @required this.cargoCoord,
        @required this.funcaoCoord,
        @required this.contactoCoord,
      }
      );
}