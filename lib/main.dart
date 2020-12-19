import 'package:flutter/material.dart';

import 'ui/pages/page_coordenacao.dart';
import 'ui/pages/page_historia.dart';
import 'ui/pages/page_initial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mambo SAP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
        //PageInitial(),
        //PageHistoria(),
        PageCoordenacao()
    );
  }
}

