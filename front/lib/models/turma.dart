import 'dart:convert';
import 'package:http/http.dart' as http;
class Turma {
  Turma(
      {required this.id,
      required this.cod_turma,
      required this.hora_inicio,
      required this.hora_fim,
      required this.disciplinas_id,
      required this.professors_id});
  final int id;
  final String cod_turma;
  final String hora_inicio;
  final String hora_fim;
  final int disciplinas_id;
  final int professors_id;
  // final Disciplina disciplina;

  factory Turma.fromJson(Map<String, dynamic> data) {
    
    final id = data["id"];
    final cod_turma = data["cod_turma"];
    final hora_inicio = (data["hora_inicio"][11] + data["hora_inicio"][12]).toString();
    final hora_fim = (data["hora_fim"][11] + data["hora_fim"][12]).toString();
    final disciplinas_id = data["disciplinas_id"];
    final professors_id = data["professors_id"];

    return Turma(
        id: id,
        cod_turma: cod_turma,
        hora_inicio: hora_inicio,
        hora_fim: hora_fim,
        disciplinas_id: disciplinas_id,
        professors_id: professors_id);
  }
   static Future<List<Turma>?> getTurmas(int id) async{
    try
    {
      List<Turma> turmas=[];
       var response = await http.get(
      Uri.parse('http://127.0.0.1:3000/turmas/' + id.toString()),
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
