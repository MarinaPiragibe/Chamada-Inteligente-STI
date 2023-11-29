import 'dart:convert';
import 'package:http/http.dart' as http;
final String BaseUrl = 'http://127.0.0.1:3000';
class Professor {
  Professor(
      {required this.id,
      required this.nome,
      required this.cpf,
});
  int id;
  final String nome;
  final String cpf;
  double latitude = 0;
  double longitude = 0;
  int online = 0;

    
  void setPosicaoProfessor(double latitude, double longitude){
    this.latitude = latitude;
    this.longitude = longitude;
    this.online = 1;
    atualizarProfessor( latitude,  longitude,  online);
  }


  void atualizarProfessor(double latitude, double longitude, int online)async {
     try
    { 
      var response = await http.post(
      Uri.parse('$BaseUrl/atualizarPosicaoProfessor'),
      body: {'id': id.toString(),'online': online.toString(), 'latitude': latitude.toString(), 'longitude': longitude.toString()});

    if (response.statusCode == 200) {
      return;
    }
    } catch(e){
      print(e.toString());
    }
  }


  factory Professor.fromJson(Map<String, dynamic> data) {
    final id = data["id"];
    final nome = data["nome"];
    final cpf = data["cpf"];

    return Professor(
        id: id,
        nome: nome,
        cpf: cpf,);
  }


//Recupera um professor
static Future<Professor?> getProfessor(int id) async{
  try
  {
      var response = await http.get(
    Uri.parse('$BaseUrl/professor/' + id.toString()),
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

//Login professor
static Future<Professor?> verificarProfessor(String email, String senha) async{
    try
    {
      
      var response = await http.post(
      Uri.parse('$BaseUrl/loginProfessor'),
      body: {'email': email, 'senha': senha});

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Professor professor = Professor.fromJson(data[0]);
      return professor;
    }
    } catch(e){
      print(e.toString());
    }
  }


}
