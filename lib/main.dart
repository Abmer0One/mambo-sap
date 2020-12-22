import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/model_coordenacao.dart';
import 'ui/pages/page_coordenacao.dart';
import 'ui/pages/page_historia.dart';
import 'ui/pages/page_initial.dart';
import 'ui/pages/teste.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //--------------------- PROVIDER ---------------//
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ModelCoordenacao(),
        ),
        ChangeNotifierProvider.value(
          value: ModelCoordenador(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mambo SAP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
        //PageInitial(),
        PageHistoria(),
        //PageCoordenacao(),
        //SignIn(),
      )
    );
  }
}