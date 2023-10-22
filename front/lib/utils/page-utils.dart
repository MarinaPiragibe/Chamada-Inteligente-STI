import 'package:flutter/material.dart';

class PageUtils {
  static int selectedIndex = 0;

  static List<Widget> pages = [
    Center(child: Text("Início")),
    Center(child: Text("Turmas")),
    Center(child: Text("Perfil")),
  ];

  static BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
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
      selectedItemColor: Colors.blue,
      onTap: (int index) {
        selectedIndex = index;
        final routes = ['/login', '/turmas', '/login'];
        Navigator.pushReplacementNamed(context, routes[index]);
      },
    );
  }
}
