import 'dart:convert';
import 'package:http/http.dart' as http;
class Professor {
  Professor(
      {required this.id,
      required this.nome,
      required this.cpf,
});
  final int id;
  final String nome;
  final String cpf;
 
  // final Disciplina disciplina;

  factory Professor.fromJson(Map<String, dynamic> data) {
    final id = data["id"];
    final nome = data["nome"];
    final cpf = data["cpf"];

    return Professor(
        id: id,
        nome: nome,
        cpf: cpf,);
  }


  
     static Future<Professor?> getProfessor(int id) async{
    try
    {
       var response = await http.get(
      Uri.parse('http://127.0.0.1:3000/professors/' + id.toString()),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Professor prof = Professor.fromJson(data[0]);
      return prof;
    }
    } catch(e){
      print(e.toString());
    }
  }
}
