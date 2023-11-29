// ignore_for_file: prefer_const_constructors

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
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ChamadaProfessor extends StatefulWidget {
  final Professor user;

  const ChamadaProfessor({Key? key, required this.user}) : super(key: key);

  @override
  State<ChamadaProfessor> createState() => _ChamadaProfessorState();
}

class _ChamadaProfessorState extends State<ChamadaProfessor> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  //inicializando dados
  Turma? turma;
  Professor? professor;

  final String diaSemana =
      DateFormat(DateFormat.WEEKDAY, 'pt_Br').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    _PegarDados();
  }

  //Pegando turmas, disciplinas e professores
  void _PegarDados() async {
    turma = (await Turma.getChamadaAula(widget.user.id));
    turma != null
        ? professor = (await Professor.getProfessor(turma!.professors_id))
        : professor = null;

    setState(() {
      turma = turma;
      professor = professor;
    });
  }

  //Se estiver no horario chama a funcao de marcarPresenca

  @override
  Widget build(BuildContext context) {
    Widget buildCurvedNavigationBarItem(IconData icon, String label) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ],
      );
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
        backgroundColor: Color.fromRGBO(6, 39, 80, 1),
        iconTheme: IconThemeData(
          size: 25,
          color: Colors.white, // Defina a cor desejada para a seta
  ),
        title: Text('Chamadas Ativas',style:TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.w500),),
      ),
          body: Container(
            decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(177, 246, 255, 0.52),
                Color.fromRGBO(168, 245, 255, 0.8177)
              ],
            ),
          ),
            child: turma != null
                ? Center(
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
                      SizedBox(
                          height:
                              20), // Adiciona um espaço entre o texto e o botão
                      ElevatedButton(
                        onPressed: () {
                          assinarAula(turma, professor);
                        },
                        child: Text('Assinar Aula'),
                      ),
                    ],
                  ))
                : Text("Sem chamada, verifique o horário!"),
          ),
          bottomNavigationBar: widget.user is Aluno
              ? CurvedNavigationBar(
                  key: _bottomNavigationKey,
                  index: 3,
                  height: 60.0,
                  items: <Widget>[
                    buildCurvedNavigationBarItem(Icons.home, 'Inicio'),
                    buildCurvedNavigationBarItem(Icons.list, 'Turmas'),
                    buildCurvedNavigationBarItem(Icons.person, 'Perfil'),
  
                    Icon(
                      Icons.phone_enabled,
                      size: 30,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
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
                    final routes = ['/home', '/turmas', '/login', '/chamadaProfessor'];
                    Navigator.pushReplacementNamed(context, routes[index],
                        arguments: widget.user);
                  },
                  letIndexChange: (index) => true,
                )
              : CurvedNavigationBar(
                  key: _bottomNavigationKey,
                  index: 1,
                  height: 60.0,
                  items: <Widget>[
                    buildCurvedNavigationBarItem(Icons.home, 'Inicio'),
                    Icon(
                      Icons.list,
                      size: 30,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    buildCurvedNavigationBarItem(Icons.person, 'Perfil'),
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
                    final routes = ['/home', '/admin', '/login'];
                    Navigator.pushReplacementNamed(context, routes[index],
                        arguments: widget.user);
                  },
                  letIndexChange: (index) => true,
                )),
    );
  }

  void assinarAula(turma, professor) async {
    final dia_hoje = DateFormat(DateFormat.YEAR_NUM_MONTH_DAY, 'pt_Br')
        .format(DateTime.now())
        .toString();
    bool? validarAssinatura = await Chamada.verificarAssinaturaAluno(
        widget.user.id, turma.id, dia_hoje);
    if (validarAssinatura != true) {
      print("Já assinou nesse dia");
      return;
    }
    if (int.parse(turma.hora_inicio) <= DateTime.now().hour &&
        DateTime.now().hour < int.parse(turma.hora_fim)) {
      final chamadas_ativas = new Chamada(
          id: 1, professor: widget.user, turma: turma, aluno: professor);
      print(DateFormat(DateFormat.YEAR_NUM_MONTH_DAY, 'pt_Br').toString());
      Chamada.marcarPresenca(chamadas_ativas, DateTime.now(), DateTime.now());
    }
  }
}
