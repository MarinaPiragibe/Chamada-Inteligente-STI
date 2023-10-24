import 'package:chamada_inteligente/models/disciplina.dart';

class Turma{
  Turma({required this.id, required this.cod_turma, required this.hora_inicio, required this.hora_final });
  final int id;
  final String cod_turma;
  final String hora_inicio;
  final String hora_final;
  // final Disciplina disciplina;



  factory Turma.fromJson(Map<String, dynamic> data){
    final id = data["id"];
    final  cod_turma = data["cod_turma"];
    final  hora_inicio = data["hora_inicio"];
    final  hora_final = data["hora_final"];
    return Turma(id: id, cod_turma: cod_turma, hora_inicio: hora_inicio, hora_final: hora_final);
  }

  


  
}