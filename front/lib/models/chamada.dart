import 'dart:convert';
import 'package:chamada_inteligente/models/aluno.dart';
import 'package:chamada_inteligente/models/professor.dart';
import 'package:chamada_inteligente/models/turma.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
final String BaseUrl = 'http://127.0.0.1:3000';
class Chamada {
  Chamada(
      {
      required this.aluno,
      required this.turma,
      required this.professor,
});
  final Aluno aluno;
  final Turma turma;
  final Professor professor;

 
  // final Disciplina disciplina;
static Future<bool?> verificarAssinaturaAluno(int id,int turma_id, String data) async{
try{
  var response = await http.post(Uri.parse('$BaseUrl/verificarAssinaturaAluno/' + id.toString()+'/'+ turma_id.toString() +'/' + data));
  if(response.statusCode == 200){
    print("Liberado para assinar!");
    return true;
  }
  return false;
} catch(e){
  print(e.toString());
}
}

 static Future<bool?> marcarPresenca(Chamada chamada_assinada, DateTime dia_assinado, DateTime hora_assinada) async{
try
{
     
  var response = await http.post(Uri.parse('$BaseUrl/presenca'),
  body: {'professors_id': chamada_assinada.professor.id.toString(),'alunos_id': chamada_assinada.aluno.id.toString(),'turmas_id': chamada_assinada.turma.id.toString(), 'hora_assinada': DateFormat(DateFormat.HOUR24_MINUTE, 'pt_Br').format(hora_assinada).toString(),'dia_assinado':DateFormat(DateFormat.YEAR_NUM_MONTH_DAY, 'pt_Br').format(dia_assinado).toString() }
  );
  print(response.body);
  if(response.statusCode == 200){
    print("assinou na lista daquele dia");
    return true;
  }
  return false;


} catch(e){
  print(e.toString());
}
 }

static Future<List<Aluno>?> assinaturasTurma(String id) async{
try
{
  List<Aluno> alunos = [];
  var response = await http.get(Uri.parse('$BaseUrl/alunosChamada/' + id.toString()) );
  if(response.statusCode == 200){
    var data = json.decode(response.body);
      for (int i = 0; i < data.length; i++) {
          alunos.add(Aluno.fromJson(data[i]));
        }
  }
  return alunos;


} catch(e){
  print(e.toString());
}
}



  
   

}