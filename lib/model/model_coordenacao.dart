import 'package:flutter/material.dart';

class ModelCoordenacao with ChangeNotifier {
  final List<ModelCoordenador> coordenadores = [
    ModelCoordenador(
      position: 7,
      imageCoord: "assets/image/inicial/padroeiro.png",
      nameCoord: "António Dala",
      cargoCoord: "Coordenador",
      funcaoCoord: "Gerir o grupo e o resto...",
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