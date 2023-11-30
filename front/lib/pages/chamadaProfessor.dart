// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:chamada_inteligente/models/aluno.dart';
import 'package:chamada_inteligente/models/chamada.dart';
import 'package:chamada_inteligente/models/professor.dart';
import 'package:chamada_inteligente/models/turma.dart';
import 'package:chamada_inteligente/utils/card-horizontal-coluna.dart';
import 'package:chamada_inteligente/utils/card-horizontal-professor.dart';
import 'package:chamada_inteligente/utils/card-horizontal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chamada_inteligente/models/disciplina.dart';
import 'package:intl/intl.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ChamadaProfessor extends StatefulWidget {
  final Professor user;

  const ChamadaProfessor({Key? key, required this.user}) : super(key: key);

  //ChamadaPage.empty({Key? key})
  //  : user = Aluno(id: 0, nome: '', cpf: (0).toString(), email: ''),
  //  super(key: key);

  @override
  State<ChamadaProfessor> createState() => _ChamadaProfessorState();
}

class _ChamadaProfessorState extends State<ChamadaProfessor> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  //inicializando dados
  List<Turma>? turmasProfessor;


  final String diaSemana =
      DateFormat(DateFormat.WEEKDAY, 'pt_Br').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    _PegarDados();
  }

  //Pegando turmas, disciplinas e professores
  void _PegarDados() async {
    turmasProfessor = (await Turma.getTurmasProfessor(widget.user.id))!;
    

    setState(() {
      turmasProfessor = turmasProfessor;
      
    });
  }

    List<Map<String, String>> listagemTurmas(List<Turma>? turmas, Professor? professor) {
    List<Map<String, String>> lista = [];

    if (turmas == null) {
      return lista; // Retorna uma lista vazia se 'turmas' for nulo
    }

    for (var i = 0; i < turmas.length; i++) {
      lista.add({
        'id': '${turmas[i].id}',
        'titulo': '${turmas[i].cod_turma} -',
        'professor': '${professor!.nome}\n',
        'dias': '${turmas[i].dias} \n',
        'horario': '${turmas[i].hora_inicio}:00 - ${turmas[i].hora_fim}:00',
      });
    }

    return lista;
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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(6, 39, 80, 1),
          iconTheme: IconThemeData(
            size: 25,
            color: Colors.white, // Defina a cor desejada para a seta
          ),
          title: Text(
            'Turmas',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
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
          child: turmasProfessor == [] 
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : HorizontalCardListColumnProfessor(
                  cardDataList: 
                      listagemTurmas(turmasProfessor, widget.user),
                      professor: widget.user,
                ),
        ),
         bottomNavigationBar:
            //BottomNavBar(user:widget.user),
            widget.user is Aluno
                ? CurvedNavigationBar(
                    key: _bottomNavigationKey,
                    index: 0,
                    height: 60.0,
                    items: <Widget>[
                      Icon(
                        Icons.home,
                        size: 30,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      buildCurvedNavigationBarItem(Icons.list, 'Turmas'),
                      buildCurvedNavigationBarItem(Icons.person, 'Perfil'),
                      buildCurvedNavigationBarItem(
                          Icons.phone_enabled, 'Chamada'),
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
                      final routes = ['/home', '/turmas', '/perfil', '/chamada'];
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
                      Icon(
                        Icons.home,
                        size: 30,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      buildCurvedNavigationBarItem(Icons.list, 'Admin'),
                      buildCurvedNavigationBarItem(Icons.person, 'Perfil'),
                      //buildCurvedNavigationBarItem(Icons.phone_enabled, 'Chamada')
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
                      final routes = ['/home', '/chamadaProfessor', '/perfil'];
                      Navigator.pushReplacementNamed(context, routes[index],
                          arguments: widget.user);
                    },
                    letIndexChange: (index) => true,
                  )
    );
  }

}
