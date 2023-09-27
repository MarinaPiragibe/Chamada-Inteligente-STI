import 'package:flutter/material.dart';
import 'package:chamada_inteligente/pages/routes.dart';

void main(){
  ThemeData themeData() {
    return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 5.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 5.0)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 5.0)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 5.0)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 5.0)),
      ),
    );
  }
  runApp(MaterialApp(
    title: "Chamada Inteligente",
    debugShowCheckedModeBanner: false,
    routes: Routes.routes,
    initialRoute: Routes.home,
    theme: themeData(),
  ));
}
