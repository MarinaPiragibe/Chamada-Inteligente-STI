import 'package:chamada_inteligente/pages/home.dart';
import 'package:chamada_inteligente/pages/login.dart';
import 'package:chamada_inteligente/pages/turmas.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Routes {
  static const home = '/home';
  static const login = '/login';
  static const turmas = '/turmas';

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.login: (context) => const LoginPage(),
    Routes.turmas: (context) {
      final user = ModalRoute.of(context)!.settings.arguments as http.Response;
      return Turmas(user: user);
    },
    Routes.home: (context) {
      final user = ModalRoute.of(context)!.settings.arguments as http.Response;
      return Home(user: user);
    },
  };
}
