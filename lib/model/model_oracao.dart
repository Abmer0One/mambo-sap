import 'package:flutter/material.dart';

class ModelOracao with ChangeNotifier {
  final List<ModelOrar> oracoes = [
    ModelOrar(
      position: 1,
      titleOracao: "Pai Nosso",
      descriptionOracao: "Pai Nosso que estais nos Céus, santificado seja o vosso "
          "Nome, venha a nós o vosso Reino, seja feita a vossa vontade assim na terra"
          " como no Céu. O pão nosso de cada dia nos dai hoje, perdoai-nos as nossas "
          "ofensas assim como nós perdoamos a quem nos tem ofendido, e não nos deixeis"
          " cair em tentação, mas livrai-nos do Mal. Amém",
    ),
    ModelOrar(
      position: 2,
      titleOracao: "Oração do Credo",
      descriptionOracao: " Creio em um só Deus, Pai todo-poderoso, Criador do céu"
          " e da terra De todas as coisas visíveis e invisíveis. Creio em um só Senhor,"
          " Jesus Cristo, Filho Unigênito de Deus, nascido do Pai antes de todos "
          "os séculos: Deus de Deus, Luz da Luz, Deus verdadeiro de Deus verdadeiro."
          "Gerado, não criado, consubstancial ao Pai. Por Ele todas as coisas foram "
          "feitas, E por nós, homens, e para nossa salvação desceu dos céus E encarnou"
          " pelo Espírito Santo, no seio da Virgem Maria, e Se fez homem. Também por"
          " nós foi crucificado sob Pôncio Pilatos, padeceu e foi sepultado. Ressuscitou"
          " ao terceiro dia, conforme as Escrituras, e subiu aos céus, onde está sentado"
          " à direita do Pai. De novo há-de vir em sua glória, para julgar os vivos e "
          "os mortos, e o seu reino não terá fim. Creio no Espírito Santo, Senhor que dá a vida,"
          "e procede do Pai e do Filho, e com o Pai e o Filho é adorado e glorificado:"
          "Ele que falou pelos Profetas. Creio na Igreja una, santa, católica e apostólica."
          "Professo um só batismo Para remissão dos pecados. E espero a ressurreição dos mortos,"
          "e vida do mundo que há-de vir. Ámen.",
    ),

    ModelOrar(
      position: 3,
      titleOracao: "Acto de Contrição",
      descriptionOracao: "Meu Deus, porque sois infinitamente bom e Vos amo de todo"
          " o meu coração, pesa-me de Vos ter ofendido e, com o auxílio da Vossa divina"
          " graça, proponho firmemente emendar-me e nunca mais Vos tornar a ofender. "
          "Peço e espero o perdão das minhas culpas pela Vossa infinita misericórdia."
          " Ámen.",
    ),
    ModelOrar(
      position: 4,
      titleOracao: "Avé Maria",
      descriptionOracao: "Avé Maria, cheia de graça, o Senhor é convosco, bendita "
          "sois vós entre as mulheres e bendito é o fruto do vosso ventre, Jesus."
          "Santa Maria, Mãe de Deus, rogai por nós pecadores, agora e na hora da nossa"
          " morte. Ámen",
    ),
    ModelOrar(
      position: 5,
      titleOracao: "Comunhão",
      descriptionOracao: "Creio ó meu Jesus, que estais presente no Santíssimo "
          "Sacramento. Amo-Vos sobre todas as coisas e desejo-Vos possuir em minha alma."
          " Mas como agora não posso receber-Vos sacramentalmente, vinde espiritualmente "
          "ao meu coração. E, como se já Vos tivesse recebido, uno-me inteiramente a Vós;"
          " não consintais que de Vós me aparte",
    ),
  ];
}

class ModelOrar with ChangeNotifier {
  final int position;
  final String titleOracao;
  final String descriptionOracao;

  ModelOrar(
      {
        @required this.position,
        @required this.titleOracao,
        @required this.descriptionOracao,
      }
      );
}