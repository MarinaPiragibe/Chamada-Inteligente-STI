import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Disciplina{
  Disciplina({required this.id, required this.cod_disciplina, required this.nome });
  final int id;
  final String cod_disciplina;
  final String nome;


  factory Disciplina.fromJson(Map<String, dynamic> data){
    final id = data["id"];
    final  cod_disciplina = data["cod_disciplina"];
    final  nome = data["nome"];
    return Disciplina(id: id, cod_disciplina: cod_disciplina, nome: nome);
  }

  


  static Future GetDisciplina(int id) async {

  http.Response response = await http.get(
    Uri.parse('http://127.0.0.1:3000/disciplinas/' + id.toString()),
  );

if(response.statusCode == 200){
   var data = json.decode(response.body);
  late Disciplina disc = Disciplina.fromJson(data[0]);
  print(disc.nome);
 }


  return response;
}
  
}