import 'package:flutter/material.dart';
import 'package:chamada_inteligente/pages/routes.dart';

void main(){
  runApp(MaterialApp(
    title: "Chamada Inteligente",
    debugShowCheckedModeBanner: false,
    routes: Routes.routes,
    initialRoute: Routes.login,
  ));
}