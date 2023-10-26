import 'dart:convert';
import 'package:chamada_inteligente/models/aluno.dart';
import 'package:chamada_inteligente/models/professors.dart';
import 'package:chamada_inteligente/models/turma.dart';
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
      : user = Aluno(id: 0 ,nome: '', cpf: (0).toString(), email: ''),
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
   DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
   @override
  void initState() {
    super.initState();
    _PegarDados();
  }
  //Pegando turmas, disciplinas e professores
  void _PegarDados() async {
    turmas =(await Turma.getTurmas(widget.user.id))!;

     for(int i =0;i < turmas!.length; i++ ){
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
  

  List<Widget> listagemTurmas(List<Turma>? turmas, List<Disciplina>? disciplinas, List<Professor>? professores) {
    List<Widget> buttonsList = [];

    if (turmas == null) {
      return buttonsList; // Retorna uma lista vazia se 'turmas' for nulo
    }

    for (var i =0; i < turmas.length ;i++) {
      

        buttonsList.add(cardExpandido(
          titulo: turmas[i].cod_turma.toString() + " - " + disciplinas![i].nome,
          descricao:"Disciplina:" + disciplinas![i].nome + "\nProfessor: " + professores![i].nome + "\n"
          + "Horario de inicio:" + turmas[i].hora_inicio + " até as:" + " 16:00"
          ,
        ));
      
    }
    

    return buttonsList;
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
              appBar: AppBar(
                title: Text('Turmas'),
                
              ),
              body: turmas == []  ?
              const Center(
                child: CircularProgressIndicator(),
              )
              :
              
              ListView(children: listagemTurmas(turmas!,
               disciplinas!,
                professores!),
                ),
               bottomNavigationBar:
                    PageUtils.buildBottomNavigationBar(context, widget.user),

    );
  }
}
