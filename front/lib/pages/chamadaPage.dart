import 'dart:convert';
import 'package:chamada_inteligente/models/aluno.dart';
import 'package:chamada_inteligente/models/chamada.dart';
import 'package:chamada_inteligente/models/professor.dart';
import 'package:chamada_inteligente/models/turma.dart';
import 'package:chamada_inteligente/utils/card-horizontal.dart';
import 'package:chamada_inteligente/utils/card-utils.dart';
import 'package:chamada_inteligente/utils/page-utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chamada_inteligente/models/disciplina.dart';
import 'package:intl/intl.dart';

class ChamadaPage extends StatefulWidget {
  final Aluno user;

  const ChamadaPage({Key? key, required this.user}) : super(key: key);

  //ChamadaPage.empty({Key? key})
    //  : user = Aluno(id: 0, nome: '', cpf: (0).toString(), email: ''),
      //  super(key: key);

  @override
  State<ChamadaPage> createState() => _ChamadaPageState();
}

class _ChamadaPageState extends State<ChamadaPage> {
  //inicializando dados
  Turma? turma;
  Professor? professor;

  final String diaSemana = DateFormat(DateFormat.WEEKDAY, 'pt_Br').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    _PegarDados();
  }

  //Pegando turmas, disciplinas e professores
  void _PegarDados() async {
    turma = (await Turma.getChamadaAula(widget.user.id));
    turma != null ? professor = (await Professor.getProfessor(turma!.professors_id)) : professor = null;

    setState(() {
      turma = turma;
      professor = professor;
    });
  }


  //Se estiver no horario chama a funcao de marcarPresenca


  @override
  Widget build(BuildContext context) {
        return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chamadas ativas'),
        ),
        body: turma != null ?  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${professor!.nome}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // Adiciona um espaço entre o texto e o botão
            ElevatedButton(
              onPressed: () {
                assinarAula(turma, professor);
              },
              child: Text('Assinar Aula'),
            ),
          ],
        )) : Text("Sem chamada, verifique o horário!"),
        bottomNavigationBar:
          PageUtils.buildBottomNavigationBarAluno(context, widget.user),
      ),
    );


  }
  void assinarAula(turma, professor) async{
    final dia_hoje = DateFormat(DateFormat.YEAR_NUM_MONTH_DAY, 'pt_Br').format(DateTime.now()).toString();
    bool? validarAssinatura = await Chamada.verificarAssinaturaAluno(widget.user.id, turma.id, dia_hoje);
    if(validarAssinatura != true){
      print("Já assinou nesse dia");
      return;
    }
   if(int.parse(turma.hora_inicio) <= DateTime.now().hour &&  DateTime.now().hour < int.parse(turma.hora_fim)){ 
      final chamadas_ativas = new Chamada(id: 1,aluno: widget.user, turma: turma, professor: professor);
      print(DateFormat(DateFormat.YEAR_NUM_MONTH_DAY, 'pt_Br').toString());
      Chamada.marcarPresenca(chamadas_ativas, DateTime.now(), DateTime.now());
      }
  }
}