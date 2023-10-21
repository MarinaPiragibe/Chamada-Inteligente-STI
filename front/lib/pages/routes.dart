import 'package:chamada_inteligente/pages/login.dart';
import 'package:chamada_inteligente/pages/turmas.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static const home = '/login';
  static const login = '/login';
  static const turmas = '/turmas';

  static Map<String, Widget Function(BuildContext)> routes = {
    //Routes.home: (context) => const Home(),
    Routes.login: (context) => const LoginPage(),
    Routes.turmas: (context) => Turmas(),
  };
}
