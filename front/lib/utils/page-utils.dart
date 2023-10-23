import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageUtils {
  static int selectedIndex = 0;

  static List<Widget> pages = [
    Center(child: Text("Início")),
    Center(child: Text("Turmas")),
    Center(child: Text("Perfil")),
  ];

  static BottomNavigationBar buildBottomNavigationBar(
      BuildContext context, http.Response user) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Turmas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      onTap: (int index) {
        selectedIndex = index;
        final routes = ['/home', '/turmas', '/login'];
        // Se o índice for 1 (Turmas), navegue para a rota 'turmas' com o parâmetro user
        print(routes[index]);
        Navigator.pushReplacementNamed(context, routes[index], arguments: user);
      },
    );
  }
}
