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

class Turmas extends StatefulWidget {
  final Aluno user;

  const Turmas({Key? key, required this.user}) : super(key: key);

  Turmas.empty({Key? key})
      : user = Aluno(id: 0, nome: '', cpf: (0).toString(), email: ''),
        super(key: key);

  @override
  State<Turmas> createState() => _TurmasState();
}

class _TurmasState extends State<Turmas> {
  //inicializando dados
  List<Disciplina>? disciplinas = [];
  Disciplina? disc;
  Professor? prof;
  List<Turma>? turmas = [];
  List<Professor>? professores = [];

  List<Chamada> chamadas_ativas = [];
  final String diaSemana = DateFormat(DateFormat.WEEKDAY, 'pt_Br').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    _PegarDados();
  }

  //Pegando turmas, disciplinas e professores
  void _PegarDados() async {
    turmas = (await Turma.getTurmasAlunos(widget.user.id))!;

    for (int i = 0; i < turmas!.length; i++) {
      disc = await Disciplina.getDisciplinas(turmas![i].disciplinas_id);
      disciplinas!.add(disc!);
      prof = await Professor.getProfessor(turmas![i].professors_id);
      professores!.add(prof!);
    }

    setState(() {
      disciplinas = disciplinas;
      turmas = turmas;
      professores = professores;
    });
  }

  List<Map<String, String>> listagemTurmas(List<Turma>? turmas,List<Disciplina>? disciplinas, List<Professor>? professores) {
    List<Map<String, String>> lista = [];
    
    if (turmas == null) {
      return lista; // Retorna uma lista vazia se 'turmas' for nulo
    }

    for (var i = 0; i < turmas.length; i++) {
      lista.add({
        'titulo': '${turmas[i].cod_turma} - ${disciplinas![i].nome}',
        'descricao': 'Disciplina: ${disciplinas[i].nome}\n'
            'Professor: ${professores![i].nome}\n'
            'Dias da aula: ${turmas[i].dias} \n'
            'Horario de inicio: ${turmas[i].hora_inicio} até as ${turmas[i].hora_fim}',
      });
    }

    return lista;
  }

  //Se estiver no horario chama a funcao de marcarPresenca
  //  if(int.parse(turmas[i].hora_inicio) <= DateTime.now().hour &&  DateTime.now().hour < int.parse(turmas[i].hora_fim)){ print("Está no horario da chamada");
    // chamadas_ativas.add(Chamada(id: i,aluno: widget.user, turma: turmas![i], professor: professores![i]));
    //   Chamada.marcarPresenca(chamadas_ativas[0], DateTime.now(), DateTime.now());
  //     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Turmas'),
      ),
      body: turmas == [] || turmas!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : HorizontalCardList(
              cardDataList: listagemTurmas(turmas!, disciplinas!, professores!),
            ),          
      bottomNavigationBar:
          PageUtils.buildBottomNavigationBar(context, widget.user),
    );
  }
}
