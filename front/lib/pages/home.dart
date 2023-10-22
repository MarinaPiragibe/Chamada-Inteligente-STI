import 'dart:convert';
import 'package:chamada_inteligente/utils/page-utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final http.Response user;

  const Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

Future<http.Response> GetTurmasInscritas(int id) async {
  var response = await http.get(
    Uri.parse('http://127.0.0.1:3000/turmas/' + id.toString()),
  );

  return response;
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Future<http.Response> resposta =
        GetTurmasInscritas(jsonDecode(widget.user.body)[0]["id"]);
    resposta.then((value) {
      List<dynamic> respostaLista = jsonDecode(value.body) as List;
      for (var i = 0; i < respostaLista.length; i++) {
        print(respostaLista[i]);
      }
    });

    return Scaffold(
        appBar: AppBar(
          title: Text('Sua Aplicação'),
        ),
        body: PageUtils.pages[PageUtils.selectedIndex],
        bottomNavigationBar:
            PageUtils.buildBottomNavigationBar(context, widget.user));
  }
}
