import 'package:chamada_inteligente/models/aluno.dart';
import 'package:chamada_inteligente/utils/page-utils.dart';
import 'package:chamada_inteligente/utils/card-horizontal.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Aluno user;

  const Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, String>> lista = [
    {'titulo': 'Card 1', 'descricao': 'Descrição do Card 1'},
    {'titulo': 'Card 2', 'descricao': 'Descrição do Card 2'},
    {'titulo': 'Card 3', 'descricao': 'Descrição do Card 3'},
    {'titulo': 'Card 4', 'descricao': 'Descrição do Card 4'},
    {'titulo': 'Card 5', 'descricao': 'Descrição do Card 5'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sua Aplicação'),
      ),
      body: HorizontalCardList(
          cardDataList: lista), // Usando o novo widget para a lista de cartões
      bottomNavigationBar:
          PageUtils.buildBottomNavigationBar(context, widget.user),
    );
  }
}
