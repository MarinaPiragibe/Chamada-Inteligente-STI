import 'dart:convert';
import 'package:http/http.dart' as http;
class Aluno {
  Aluno(
      {required this.id,
      required this.nome,
      required this.cpf,
      required this.email,
});
  final int id;
  final String nome;
  final String cpf;
  final String email;
 
  // final Disciplina disciplina;

  factory Aluno.fromJson(Map<String, dynamic> data) {
    print(data);
    final id = data["id"];
    final nome = data["nome"];
    final cpf = data["cpf"].toString();
    final email = data["email"];

    return Aluno(
        id: id,
        nome: nome,
        cpf: cpf,
        email: email);
  }


  
     static Future<Aluno?> verificarAluno(String email, String senha) async{
    try
    {
      
      var response = await http.post(
      Uri.parse('http://127.0.0.1:3000/login'),
      body: {'email': email, 'senha': senha});

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Aluno aluno = Aluno.fromJson(data[0]);
      return aluno;
    }
    } catch(e){
      print(e.toString());
    }
  }
}