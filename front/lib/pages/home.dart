import 'package:chamada_inteligente/models/aluno.dart';
import 'package:chamada_inteligente/models/localizacao.dart';
import 'package:chamada_inteligente/models/turma.dart';
import 'package:chamada_inteligente/utils/page-utils.dart';
import 'package:chamada_inteligente/utils/card-horizontal.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  final dynamic user;
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

    pegarPosicao() async{
      Position? posicao = await Localizacao.posicaoAtual();
      print(posicao.latitude);
      print(posicao.altitude);
    }
    pegarPosicao();

    return Scaffold(
      //appBar: AppBar(
        //title: Text('teste'),
        // shape: WavyAppBarShape(),
        //),
      body: Column(
        children:[
          Row(children: [
            Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Círculo ao redor do ícone
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromRGBO(6, 39, 80, 1),
                ),
              ),
              // Ícone de pessoa sobreposto ao círculo
              Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
            ],),
            SizedBox(
              width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bem Vindo,',
                  style: TextStyle(
                    color: const Color.fromRGBO(6, 39, 80, 1),
                    fontSize: 12),),
                Text(
                  widget.user.nome,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(6, 39, 80, 1),
                    fontSize: 14),
                  )],)
            ],),
            HorizontalCardList(
              cardDataList: lista),
          ]),
      bottomNavigationBar:
      widget.user is Aluno ? PageUtils.buildBottomNavigationBarAluno(context, widget.user) : PageUtils.buildBottomNavigationBarProfessor(context, widget.user),
    //     CurvedNavigationBar(
    //       color: Color.fromRGBO(6, 39, 80, 1),
    //       backgroundColor: Color.fromARGB(0, 1, 3, 8),
    //       items: <Widget>[
    //         Icon(Icons.home, size: 30,color: Colors.white,),
    //         Icon(Icons.list, size: 30,color: Colors.white,),
    //         Icon(Icons.add, size: 30,color: Colors.white,),
    //       ],
    //       onTap: (index) {
    // })
    
          
    );
  }
}
