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

Future<Map<String, dynamic>?> GetTurmasInscritas(int id) async {
  var response = await http.get(
    Uri.parse('http://127.0.0.1:3000/turmas/' + id.toString()),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body) as Map<String, dynamic>?;
  } else {
    return null; // Trate o erro de acordo com suas necessidades
  }
}

class _TurmasState extends State<Turmas> {
  List<Widget> listaTurmas(Map<String, dynamic>? turmas) {
    List<Widget> buttonsList = [];

    if (turmas != null && turmas.containsKey("dados")) {
      var dados = turmas["dados"] as List<dynamic>;

      for (var turma in dados) {
        buttonsList.add(
          Card(
            child: ListTile(
              title: Text(
                turma["nome"]
                    as String, // Suponha que a turma tenha um atributo "nome" do tipo String
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
    return FutureBuilder<Map<String, dynamic>?>(
      future: GetTurmasInscritas(jsonDecode(widget.user.body)[0]["id"]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else {
          if (snapshot.hasData) {
            Map<String, dynamic>? respostaMap = snapshot.data;

            return Scaffold(
              appBar: AppBar(
                title: Text('Turmas'),
              ),
              bottomNavigationBar:
                  PageUtils.buildBottomNavigationBar(context, widget.user),
              body: ListView(children: listaTurmas(respostaMap)),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Turmas'),
              ),
              body: Text("Nenhum dado disponível"),
              bottomNavigationBar:
                  PageUtils.buildBottomNavigationBar(context, widget.user),
            );
          }
        }
      },
    );
  }
}
