import 'dart:convert';
import 'package:chamada_inteligente/models/aluno.dart';
import 'package:chamada_inteligente/utils/page-utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Aluno user;

  const Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
  
    //Future<http.Response> respostaProfessor = GetProfessor(resposta)

    return Scaffold(
        appBar: AppBar(
          title: Text('Sua Aplicação'),
        ),
        body: PageUtils.pages[PageUtils.selectedIndex],
        bottomNavigationBar:
            PageUtils.buildBottomNavigationBar(context, widget.user));
  }
}
