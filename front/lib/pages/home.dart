import 'dart:convert';
import 'dart:ffi';
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

Future<http.Response> GetProfessor(int id) async{
  var response = await http.get(
    Uri.parse('http://127.0.0.1:3000/professors/' + id.toString()),
  );
  return response;
}


Future<http.Response> GetDisciplina(int id) async{
  var response = await http.get(
    Uri.parse('http://127.0.0.1:3000/disciplinas/' + id.toString()),
  );
  return response;
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Future<http.Response> resposta = GetTurmasInscritas(jsonDecode(widget.user.body)[0]["id"]);
    resposta.then((value) {
      List<dynamic> respostaLista = jsonDecode(value.body) as List;
      for (var i = 0; i < respostaLista.length; i++) {
        print(respostaLista[i]["professors_id"]);
        Future<http.Response> professor = GetProfessor(respostaLista[i]["professors_id"]);
        print(professor.then((value) => print(value.body)));
        Future<http.Response> disciplinas = GetDisciplina(respostaLista[i]["disciplinas_id"]);
        print(disciplinas.then((value) => print(value.body)));
      }
    });
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
