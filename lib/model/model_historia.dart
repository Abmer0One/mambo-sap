import 'package:flutter/material.dart';

class ModelHistorial with ChangeNotifier {
  final List<ModelHistoria> historias = [
    ModelHistoria(
      position: 5,
      imageHistory: "assets/image/menu/historiaLeitores.jpg",
      anoHistoria: "1992",
      descriptionAnoHistoria: "      Creio ó meu Jesus, que estais presente no Santíssimo "
          "Sacramento. Amo-Vos sobre todas as coisas e desejo-Vos possuir em minha alma."
          " Mas como agora não posso receber-Vos sacramentalmente, vinde espiritualmente "
          "ao meu coração. E, como se já Vos tivesse recebido, uno-me inteiramente a Vós;"
          "Sacramento. Amo-Vos sobre todas as coisas e desejo-Vos possuir em minha alma."
          " Mas como agora não posso receber-Vos sacramentalmente, vinde espiritualmente "
          "ao meu coração. E, como se já Vos tivesse recebido, uno-me inteiramente a Vós;"
          " não consintais que de Vós me aparte",
    ),
    ModelHistoria(
      position: 5,
      imageHistory: "assets/image/menu/historiaLeitores.jpg",
      anoHistoria: "1993",
      descriptionAnoHistoria: "Creio ó meu Jesus, que estais presente no Santíssimo "
          "Sacramento. Amo-Vos sobre todas as coisas e desejo-Vos possuir em minha alma."
          " Mas como agora não posso receber-Vos sacramentalmente, vinde espiritualmente "
          "ao meu coração. E, como se já Vos tivesse recebido, uno-me inteiramente a Vós;"
          " não consintais que de Vós me aparte",
    ),
    ModelHistoria(
      position: 5,
      imageHistory: "assets/image/menu/historiaLeitores.jpg",
      anoHistoria: "1994",
      descriptionAnoHistoria: "Creio ó meu Jesus, que estais presente no Santíssimo "
          "Sacramento. Amo-Vos sobre todas as coisas e desejo-Vos possuir em minha alma."
          " Mas como agora não posso receber-Vos sacramentalmente, vinde espiritualmente "
          "ao meu coração. E, como se já Vos tivesse recebido, uno-me inteiramente a Vós;"
          " não consintais que de Vós me aparte",
    ),
    ModelHistoria(
      position: 5,
      imageHistory: "assets/image/menu/historiaLeitores.jpg",
      anoHistoria: "1995",
      descriptionAnoHistoria: "Creio ó meu Jesus, que estais presente no Santíssimo "
          "Sacramento. Amo-Vos sobre todas as coisas e desejo-Vos possuir em minha alma."
          " Mas como agora não posso receber-Vos sacramentalmente, vinde espiritualmente "
          "ao meu coração. E, como se já Vos tivesse recebido, uno-me inteiramente a Vós;"
          " não consintais que de Vós me aparte",
    ),
    ModelHistoria(
      position: 5,
      imageHistory: "assets/image/menu/historiaLeitores.jpg",
      anoHistoria: "1996",
      descriptionAnoHistoria: "Creio ó meu Jesus, que estais presente no Santíssimo "
          "Sacramento. Amo-Vos sobre todas as coisas e desejo-Vos possuir em minha alma."
          " Mas como agora não posso receber-Vos sacramentalmente, vinde espiritualmente "
          "ao meu coração. E, como se já Vos tivesse recebido, uno-me inteiramente a Vós;"
          " não consintais que de Vós me aparte",
    ),
  ];
}

class ModelHistoria with ChangeNotifier {
  final int position;
  final String imageHistory;
  final String anoHistoria;
  final String descriptionAnoHistoria;

  ModelHistoria(
      {
        @required this.position,
        @required this.imageHistory,
        @required this.anoHistoria,
        @required this.descriptionAnoHistoria,
      }
      );
}