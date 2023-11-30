import 'package:chamada_inteligente/models/aluno.dart';
import 'package:chamada_inteligente/models/professor.dart';
import 'package:chamada_inteligente/pages/chamadaProfessor.dart';
import 'package:chamada_inteligente/pages/chamadaPage.dart';
import 'package:chamada_inteligente/pages/home.dart';
import 'package:chamada_inteligente/pages/login.dart';
import 'package:chamada_inteligente/pages/perfil.dart';
import 'package:chamada_inteligente/pages/detalhesTurma.dart';
import 'package:chamada_inteligente/pages/turmas.dart';
import 'package:chamada_inteligente/pages/professor.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Routes {
  static const home = '/home';
  static const login = '/login';
  static const turmas = '/turmas';
  static const chamada = "/chamada";
  static const chamadaP = "/chamadaProfessor";
  static const perfil = '/perfil';

  static const detalhesTurma = "/detalhesTurma";


  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.login: (context) => const LoginPage(),
    Routes.perfil: (context){
      final user = ModalRoute.of(context)!.settings.arguments as dynamic;
      return Perfil(user: user);
    },
    Routes.turmas: (context) {
      final user = ModalRoute.of(context)!.settings.arguments as Aluno;
      return Turmas(user: user);
    },
    Routes.home: (context) {
      final user = ModalRoute.of(context)!.settings.arguments as dynamic;
      return Home(user: user);
    }
    ,
    Routes.chamada: (context) {
      final user = ModalRoute.of(context)!.settings.arguments as Aluno;
      return ChamadaPage(user: user);
    }
    ,
    Routes.chamadaP: (context) {
      final user = ModalRoute.of(context)!.settings.arguments as Professor;
      return ChamadaProfessor(user: user);
  },
  //   Routes.detalhesTurma: (context) {
  //     final user = ModalRoute.of(context)!.settings.arguments as dynamic;
  //     print(user);
  //     return DetalhesTurma(state: user);
  // },
};
}