import 'dart:convert';

import 'package:chamada_inteligente/utils/page-utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Turmas extends StatefulWidget {
  final http.Response user;

  const Turmas({Key? key, required this.user}) : super(key: key);

  Turmas.empty({Key? key})
      : user = http.Response('', 200),
        super(key: key);

  @override
  State<Turmas> createState() => _TurmasState();
}

Future<http.Response> GetTurmasInscritas(int id) async {
  var response = await http.get(
    Uri.parse('http://127.0.0.1:3000/turmas/' + id.toString()),
  );

  return response;
}

class _TurmasState extends State<Turmas> {
  List<Widget> listaTurmas(List<dynamic>? turmas) {
    List<Widget> buttonsList = [];

    if (turmas == null) {
      return buttonsList; // Retorna uma lista vazia se 'turmas' for nulo
    }

    for (var turma in turmas) {
      if (turma != null && turma["cod_turma"] != null) {
        buttonsList.add(
          Card(
            child: ListTile(
              title: Text(
                turma["cod_turma"] as String,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Faça algo quando o item da lista for clicado
              },
            ),
          ),
        );
      }
    }

    return buttonsList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: GetTurmasInscritas(jsonDecode(widget.user.body)[0]["id"]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Exibir um indicador de carregamento enquanto a Future está sendo resolvida.
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else {
          if (snapshot.hasData) {
            final dynamic data = jsonDecode(snapshot.data!.body);

            if (data is List) {
              // É uma lista, você pode tratar como uma lista
              List<dynamic> respostaLista = data;
              return Scaffold(
                appBar: AppBar(
                  title: Text('Turmas'),
                ),
                bottomNavigationBar:
                    PageUtils.buildBottomNavigationBar(context, widget.user),
                body: ListView(children: listaTurmas(respostaLista)),
              );
            }
          }
          return Scaffold(
              appBar: AppBar(
                title: Text('Turmas'),
              ),
              bottomNavigationBar:
                  PageUtils.buildBottomNavigationBar(context, widget.user),
              body: Text('Nenhum dado disponível.'));
        }
      },
    );
  }
}
