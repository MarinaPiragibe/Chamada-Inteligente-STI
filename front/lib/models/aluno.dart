import 'dart:convert';
import 'package:http/http.dart' as http;
final String BaseUrl = 'http://127.0.0.1:3000';
class Aluno {
  Aluno(
      {required this.id,
      required this.nome,
      required this.cpf,
      required this.email,
});
  int id;
  final String nome;
  final String cpf;
  final String email;
  double latitude = 0;
  double longitude = 0;
  int online = 0;

  void setPosicaoAluno(double latitude, double longitude){
    this.latitude = latitude;
    this.longitude = longitude;
    this.online = 1;
    this.atualizarAluno(latitude, longitude, this.online);
  }
 
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

void atualizarAluno(double latitude, double longitude, int online)async {
     try
    { 
      var response = await http.post(
      Uri.parse('$BaseUrl/atualizarPosicaoAluno'),
      body: {'id': id.toString(),'online': online.toString(), 'latitude': latitude.toString(), 'longitude': longitude.toString()});

    if (response.statusCode == 200) {
      return;
    }
    } catch(e){
      print(e.toString());
    }
  }


//logout aluno
void logoutAluno(){
  this.online = 0;
  this.latitude = 0;
  this.longitude = 0;
  this.logoutAlunoApi();
}

  void logoutAlunoApi() async{
  try
    { 
      var response = await http.post(
      Uri.parse('$BaseUrl/logout'),
      body: {'id': id.toString()});

    if (response.statusCode == 200) {
      return;
    }
    } catch(e){
      print(e.toString());
    }
  }

//Login aluno
static Future<Aluno?> verificarAluno(String email, String senha) async{
    try
    { 
      var response = await http.post(
      Uri.parse('$BaseUrl/login'),
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