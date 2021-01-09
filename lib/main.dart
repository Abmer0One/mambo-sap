import 'package:flutter/material.dart';
import 'package:mambo_sap/model/model_historia.dart';
import 'package:mambo_sap/model/model_oracao.dart';
import 'package:provider/provider.dart';

import 'component/component_theme.dart';
import 'model/model_coordenacao.dart';
import 'ui/pages/page_actividades.dart';
import 'ui/pages/page_biblia.dart';
import 'ui/pages/page_coordenacao.dart';
import 'ui/pages/page_historia.dart';
import 'ui/pages/page_home.dart';
import 'ui/pages/page_initial.dart';
import 'ui/pages/page_missal.dart';
import 'ui/pages/page_oracoes.dart';
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
        ChangeNotifierProvider.value(
          value: ModelOracao(),
        ),
        ChangeNotifierProvider.value(
          value: ModelOrar(),
        ),
        ChangeNotifierProvider.value(
          value: ModelHistoria(),
        ),
        ChangeNotifierProvider.value(
          value: ModelHistorial(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mambo SAP',
        /*theme: ThemeData(
            primaryColor: Colors.black,
            fontFamily: ComponentTheme.quickFont,
            primarySwatch: Colors.amber
        ),*/

          theme: ThemeData(
            // Define the default brightness and colors.
            brightness: Brightness.dark,
            primaryColor: Colors.lightBlue[800],
            accentColor: Colors.blue[900],

            // Define the default font family.
            fontFamily: 'Georgia',

            // Define the default TextTheme. Use this to specify the default
            // text styling for headlines, titles, bodies of text, and more.
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
            ),
          ),
        supportedLocales: [
          const Locale("en", "US"),
          const Locale("hi", "IN"),
        ],
        home:
        PageInitial(),
        //PageHistoria(),
        //PageCoordenacao(),
        //PageHome(),
        //PageMissal(),
        //Gravar(),
        //TimerApp(),
        //PageActividades(),
        //PageBiblia(),
        //PageOracao(),
      ),
    );
  }
}