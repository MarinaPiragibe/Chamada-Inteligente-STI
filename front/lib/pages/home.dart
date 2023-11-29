// ignore_for_file: prefer_const_constructors

import 'package:chamada_inteligente/models/aluno.dart';
import 'package:chamada_inteligente/models/localizacao.dart';
import 'package:chamada_inteligente/models/turma.dart';
import 'package:chamada_inteligente/utils/page-utils.dart';
import 'package:chamada_inteligente/utils/card-horizontal.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class GradientPage extends StatelessWidget {
  final Widget child;

  GradientPage({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue[900]!, Colors.blue[1000]!],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: child,
      ),
    );
  }
}

class Home extends StatefulWidget {
  final dynamic user;
  const Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> with WidgetsBindingObserver {
  final List<Map<String, String>> lista = [
    {'titulo': 'Card 1', 'descricao': 'Descrição do Card 1'},
    {'titulo': 'Card 2', 'descricao': 'Descrição do Card 2'},
    {'titulo': 'Card 3', 'descricao': 'Descrição do Card 3'},
    {'titulo': 'Card 4', 'descricao': 'Descrição do Card 4'},
    {'titulo': 'Card 5', 'descricao': 'Descrição do Card 5'}
  ];

  @override
  initState() {
      super.initState();
      WidgetsBinding.instance.addObserver(this);
      _PegarPosicao();
    }
  _PegarPosicao() async{
     Position? posicao = await Localizacao.posicaoAtual();
      widget.user is Aluno? widget.user.setPosicaoAluno(posicao.latitude,posicao.longitude): print("213");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.detached){
      print("Fechou");  
    }
  }
  
  @override
  Widget build(BuildContext context) {
    
 

    return Scaffold(
      //appBar: AppBar(
        //title: Text('teste'),
        // shape: WavyAppBarShape(),
        //),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromRGBO(255,255,255,1),Color.fromRGBO(177, 246, 255, 0.52), Color.fromRGBO(168, 245, 255, 0.8177)],
          ),
          ),child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children:[Padding(padding: const EdgeInsets.only(left: 16.0),child: Row(children: [
            Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Círculo ao redor do ícone
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(6, 39, 80, 1),
                ),
              ),
              // Ícone de pessoa sobreposto ao círculo
              const Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
            ],),
            const SizedBox(
              width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bem Vindo,',
                  style: TextStyle(
                    color: Color.fromRGBO(6, 39, 80, 1),
                    fontSize: 12),),
                Text(
                  widget.user.nome,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(6, 39, 80, 1),
                    fontSize: 14),
                  )],)
            ],),),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: const Text(
                'Turmas',
                style: TextStyle(
                  color: Color.fromRGBO(6, 39, 80, 1),
                  fontSize:25,
                  fontWeight:FontWeight.bold),))
            ,
            HorizontalCardList(
              cardDataList: lista),
          ]),),
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
