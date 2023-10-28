import 'dart:convert';
import 'package:chamada_inteligente/models/aluno.dart';
import 'package:chamada_inteligente/models/professors.dart';
import 'package:chamada_inteligente/models/turma.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
final String BaseUrl = 'http://127.0.0.1:3000';
class Chamada {
  Chamada(
      {required this.id,
      required this.aluno,
      required this.turma,
      required this.professor,
});
  final int id;
  final Aluno aluno;
  final Turma turma;
  final Professor professor;

 
  // final Disciplina disciplina;


 static Future<bool?> marcarPresenca(Chamada chamada_assinada, DateTime dia_assinado, DateTime hora_assinada) async{
try
{
     
  var response = await http.post(Uri.parse('$BaseUrl/presenca'),
  body: {'id': chamada_assinada.id.toString(),'professors_id': chamada_assinada.professor.id.toString(),'alunos_id': chamada_assinada.aluno.id.toString(),'turmas_id': chamada_assinada.turma.id.toString(), 'hora_assinada': DateFormat(DateFormat.HOUR24_MINUTE, 'pt_Br').format(hora_assinada).toString(),'dia_assinado':DateFormat(DateFormat.YEAR_NUM_MONTH_DAY, 'pt_Br').format(dia_assinado).toString() }
  );
  if(response.statusCode == 200){
    print("assinou na lista daquele dia");
    return true;
  }
  return false;


} catch(e){
  print(e.toString());
}



  
   
}
}