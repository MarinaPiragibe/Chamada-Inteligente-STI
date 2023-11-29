import 'package:chamada_inteligente/models/aluno.dart';
import 'package:chamada_inteligente/models/professor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class PageUtils {
  static int selectedIndex = 0;

  static List<Widget> pages = [
    Center(child: Text("Início")),
    Center(child: Text("Turmas")),
    Center(child: Text("Perfil")),
  ];

static BottomNavigationBar buildBottomNavigationBarProfessor(
      BuildContext context, dynamic user) {
    return BottomNavigationBar(
      selectedLabelStyle: TextStyle(color: Colors.black),
      selectedIconTheme: IconThemeData(color: Colors.black),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Turmas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.phone_enabled),
          label: 'Chamada',
          
        ),
        // buildCurvedNavigationBarItem(Icons.home, 'Início'),
        // buildCurvedNavigationBarItem(Icons.list, 'Turmas'),
        // buildCurvedNavigationBarItem(Icons.person, 'Perfil'),
        // buildCurvedNavigationBarItem(Icons.phone_enabled, 'Chamada'),
      ],
      currentIndex: selectedIndex,
      onTap: (int index) {
        selectedIndex = index;
        final routes = ['/home', '/turmas', '/login','/chamada'];
        // Se o índice for 1 (Turmas), navegue para a rota 'turmas' com o parâmetro user
        print(routes[index]);
        Navigator.pushReplacementNamed(context, routes[index], arguments: user);
      },
    );
  }

  static Widget buildCurvedNavigationBarItem(IconData icon, String label) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, size: 30),
      Text(label),
    ],
  );
}
  static BottomNavigationBar buildBottomNavigationBarAluno(
      BuildContext context, dynamic user) {
    return BottomNavigationBar(
      selectedLabelStyle: TextStyle(color: Colors.black),
      selectedIconTheme: IconThemeData(color: Colors.black),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Turmas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.phone_enabled),
          label: 'Chamada',
          
        ),
        // buildCurvedNavigationBarItem(Icons.home, 'Início'),
        // buildCurvedNavigationBarItem(Icons.list, 'Turmas'),
        // buildCurvedNavigationBarItem(Icons.person, 'Perfil'),
        // buildCurvedNavigationBarItem(Icons.phone_enabled, 'Chamada'),
      ],
      currentIndex: selectedIndex,
      onTap: (int index) {
        selectedIndex = index;
        final routes = ['/home', '/turmas', '/login','/chamada'];
        // Se o índice for 1 (Turmas), navegue para a rota 'turmas' com o parâmetro user
        print(routes[index]);
        Navigator.pushReplacementNamed(context, routes[index], arguments: user);
      },
    );
  }
}