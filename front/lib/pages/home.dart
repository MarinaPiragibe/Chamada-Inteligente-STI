import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//aqui vai ser a primeira pagina
class Home extends StatefulWidget {
  final http.Response user;
  const Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

Future<http.Response> GetTurmasInscritas(int id) async{
  var response = await http.get(
      Uri.parse('http://127.0.0.1:3000/turmas/' + id.toString()),
    );
  
    return response;
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
  Future<http.Response> resposta = GetTurmasInscritas(jsonDecode(widget.user.body)[0]["id"]);
  resposta.then((value) {
    List<dynamic> respostaLista = jsonDecode(value.body) as List;
    for (var i =0; i<respostaLista.length;i++){
      print(respostaLista[i]);
    }
  }
);
    
    return Scaffold(
      body:Text("home Page"),
    );
  }
}