import 'dart:convert';
import 'package:http/http.dart' as http;
final String BaseUrl = 'http://127.0.0.1:3000';
class Turma {
  Turma(
      {required this.id,
      required this.cod_turma,
      required this.hora_inicio,
      required this.hora_fim,
      required this.disciplinas_id,
      required this.professors_id,
      required this.dias});
  final int id;
  final String cod_turma;
  final String hora_inicio;
  final String hora_fim;
  final int disciplinas_id;
  final int professors_id;
  final List<String> dias;
  // final Disciplina disciplina;

  factory Turma.fromJson(Map<String, dynamic> data) {
    final id = data["id"];
    final cod_turma = data["cod_turma"];
    final hora_inicio = data["hora_inicio"];
    final hora_fim = data["hora_fim"];
    final disciplinas_id = data["disciplinas_id"];
    final professors_id = data["professors_id"];
    final dias = (json.decode(data["dias"]) as List<dynamic>)
    .map((element) => element.toString())
    .toList();

    return Turma(
        id: id,
        cod_turma: cod_turma,
        hora_inicio: hora_inicio,
        hora_fim: hora_fim,
        disciplinas_id: disciplinas_id,
        professors_id: professors_id,
        dias: dias);
  }
   static Future<List<Turma>?> getTurmas(int id) async{
    try
    {
      List<Turma> turmas=[];
       var response = await http.get(
      Uri.parse('$BaseUrl/turmas/' + id.toString()),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      for(int i =0; i< data.length ; i++){
        turmas.add(Turma.fromJson(data[i]));

      }
    return turmas;
    }
    } catch(e){
      print(e.toString());
    }
  }
}
