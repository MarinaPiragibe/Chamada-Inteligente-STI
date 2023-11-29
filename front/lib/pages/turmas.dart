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
import 'package:chamada_inteligente/utils/page-utils-aluno.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:chamada_inteligente/utils/card-horizontal-coluna.dart';

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
  int _page = 1;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
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
        'professor': '${professores![i].nome}\n',
        'dias': '${turmas[i].dias} \n',
        'horario': '${turmas[i].hora_inicio}:00 - ${turmas[i].hora_fim}:00',
      });
    }

    return lista;
  }



  @override
  Widget build(BuildContext context) {
    Widget buildCurvedNavigationBarItem(IconData icon, String label) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, size: 30, color: Colors.white,),
      Text(label,style: TextStyle(color: Colors.white),),
    ],
  );
}
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(6, 39, 80, 1),
        iconTheme: IconThemeData(
          size: 25,
          color: Colors.white, // Defina a cor desejada para a seta
  ),
        title: Text('Turmas',style:TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.w500),),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromRGBO(255,255,255,1),Color.fromRGBO(177, 246, 255, 0.52), Color.fromRGBO(168, 245, 255, 0.8177)],
          ),
          ),
        child: turmas == [] || turmas!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : HorizontalCardListColumn(
              cardDataList: listagemTurmas(turmas!, disciplinas!, professores!),
             
            ),),          
      bottomNavigationBar:
      CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 1,
          height: 60.0,
          items: <Widget>[
            buildCurvedNavigationBarItem(Icons.home, 'Ínicio'),
            Icon(Icons.list, size: 30,color: Color.fromRGBO(255, 255, 255, 1),),
            buildCurvedNavigationBarItem(Icons.person, 'Perfil'),
            buildCurvedNavigationBarItem(Icons.phone_enabled, 'Chamada'),
          ],
          color: Color.fromRGBO(6, 39, 80, 1),
          buttonBackgroundColor: Color.fromRGBO(6, 39, 80, 1),
          backgroundColor: Color.fromRGBO(168, 245, 255, 0.8177),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
            final routes = ['/home', '/turmas', '/login','/chamada'];
            Navigator.pushReplacementNamed(context, routes[index], arguments: widget.user);
          },
          letIndexChange: (index) => true,
        )
    );
  }
}
