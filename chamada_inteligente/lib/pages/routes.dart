import 'package:chamada_inteligente/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'login.dart';


class Routes {
  static const home = '/login';
  static const login = '/login';


  static Map<String, Widget Function(BuildContext)> routes = {
    //Routes.home: (context) => const Home(),
    Routes.login: (context) => const LoginPage(),
  };

}