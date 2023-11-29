// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chamada_inteligente/models/aluno.dart';
import 'package:chamada_inteligente/models/localizacao.dart';
import 'package:chamada_inteligente/models/turma.dart';
import 'package:chamada_inteligente/pages/routes.dart';
import 'package:chamada_inteligente/pages/turmas.dart';
import 'package:chamada_inteligente/utils/card-horizontal-coluna.dart';
import 'package:chamada_inteligente/utils/page-utils.dart';
import 'package:chamada_inteligente/utils/card-horizontal.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:chamada_inteligente/utils/page-utils-aluno.dart';


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

class _HomeState extends State<Home> with WidgetsBindingObserver{
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
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
        widget.user is Aluno? widget.user.setPosicaoAluno(posicao.latitude,posicao.longitude): widget.user.setPosicaoProfessor(posicao.latitude,posicao.longitude);
    }

    @override
    void didChangeAppLifecycleState(AppLifecycleState state){
      super.didChangeAppLifecycleState(state);
      if(state == AppLifecycleState.detached){
        widget.user is Aluno? widget.user.logoutAluno(): widget.user.logoutProfessor();

      }
    }

  @override
  Widget build(BuildContext context) {
    Widget buildCurvedNavigationBarItem(IconData icon, String label) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ],
      );
    }



    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(177, 246, 255, 0.52),
                Color.fromRGBO(168, 245, 255, 0.8177)
              ],
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 20,bottom: 20),
              child: Row(
                children: [
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
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bem Vindo,',
                        style: TextStyle(
                            color: Color.fromRGBO(6, 39, 80, 1), fontSize: 12),
                      ),
                      Text(
                        widget.user.nome,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(6, 39, 80, 1),
                            fontSize: 14),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),

  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Turmas(user: widget.user)),
      );
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Turmas',
          style: TextStyle(
            color: Color.fromRGBO(6, 39, 80, 1),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Text(
              'Ver todas',
              style: TextStyle(
                color: Color.fromRGBO(42, 105, 136, 1),
                fontSize: 12,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Color.fromRGBO(42, 105, 136, 1),
              size: 12,
            ),
          ],
        ),
      ],
    ),
  ),
),

            HorizontalCardList(cardDataList: lista),
          ]),
        ),
        bottomNavigationBar:
            //BottomNavBar(user:widget.user),
            widget.user is Aluno
                ? CurvedNavigationBar(
                    key: _bottomNavigationKey,
                    index: 0,
                    height: 60.0,
                    items: <Widget>[
                      Icon(
                        Icons.home,
                        size: 30,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      buildCurvedNavigationBarItem(Icons.list, 'Turmas'),
                      buildCurvedNavigationBarItem(Icons.person, 'Perfil'),
                      buildCurvedNavigationBarItem(
                          Icons.phone_enabled, 'Chamada'),
                    ],
                    color: Color.fromRGBO(6, 39, 80, 1),
                    buttonBackgroundColor: Color.fromRGBO(6, 39, 80, 1),
                    backgroundColor: Color.fromRGBO(168, 245, 255, 0.8177),
                    animationCurve: Curves.easeInOut,
                    animationDuration: Duration(milliseconds: 600),
                    onTap: (index) {
                      setState(() {
                        _page = index;
                      });
                      final routes = ['/home', '/turmas', '/login', '/chamada'];
                      Navigator.pushReplacementNamed(context, routes[index],
                          arguments: widget.user);
                    },
                    letIndexChange: (index) => true,
                  )
                : CurvedNavigationBar(
                    key: _bottomNavigationKey,
                    index: 0,
                    height: 60.0,
                    items: <Widget>[
                      Icon(
                        Icons.home,
                        size: 30,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      buildCurvedNavigationBarItem(Icons.list, 'Admin'),
                      buildCurvedNavigationBarItem(Icons.person, 'Perfil'),
                    ],
                    color: Color.fromRGBO(6, 39, 80, 1),
                    buttonBackgroundColor: Color.fromRGBO(6, 39, 80, 1),
                    backgroundColor: Color.fromRGBO(168, 245, 255, 0.8177),
                    animationCurve: Curves.easeInOut,
                    animationDuration: Duration(milliseconds: 600),
                    onTap: (index) {
                      setState(() {
                        _page = index;
                      });
                      final routes = ['/home', '/admin', '/login'];
                      Navigator.pushReplacementNamed(context, routes[index],
                          arguments: widget.user);
                    },
                    letIndexChange: (index) => true,
                  )
        //widget.user is Aluno ? PageUtils.buildBottomNavigationBarAluno(context, widget.user) : PageUtils.buildBottomNavigationBarProfessor(context, widget.user),
        );
  }
}
