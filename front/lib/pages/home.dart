import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final http.Response user;

  const Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

Future<http.Response> GetTurmasInscritas(int id) async {
  var response = await http.get(
    Uri.parse('http://127.0.0.1:3000/turmas/' + id.toString()),
  );

  return response;
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  // Lista de telas correspondentes a cada item do menu
  final List<Widget> _pages = [
    const Placeholder(), // Tela Inicial
    const Placeholder(), // Tela Minhas Turmas
    const Placeholder(), // Tela Perfil
  ];

  Widget menuInferior() {
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Cor do item selecionado
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    Future<http.Response> resposta =
        GetTurmasInscritas(jsonDecode(widget.user.body)[0]["id"]);
    resposta.then((value) {
      List<dynamic> respostaLista = jsonDecode(value.body) as List;
      for (var i = 0; i < respostaLista.length; i++) {
        print(respostaLista[i]);
      }
    });

    return Scaffold(
        appBar: AppBar(
          title: Text('Sua Aplicação'),
        ),
        body: _pages[
            _selectedIndex], // Exibe a tela atual com base no índice selecionado
        bottomNavigationBar: menuInferior());
  }
}
