import 'package:flutter/material.dart';
import 'package:chamada_inteligente/pages/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(MaterialApp(
    localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
    supportedLocales: [const Locale('pt', 'BR')],
    title: "Chamada Inteligente",
    debugShowCheckedModeBanner: false,
    routes: Routes.routes,
    initialRoute: Routes.login,
    theme: ThemeData(
      primaryColor: Colors.blue[900], // Define a cor primária como azul escuro
      hintColor: Colors.blue[1000], // Define a cor de destaque como branca
      scaffoldBackgroundColor:
          Colors.white, // Define a cor de fundo do Scaffold como azul escuro
      appBarTheme: AppBarTheme(
        color: Colors.blue[900], // Define a cor de fundo da barra de aplicativos como azul escuro
      ),
    ),
  ));
}
