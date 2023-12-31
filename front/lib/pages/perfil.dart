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
import 'package:chamada_inteligente/pages/chamadaProfessor.dart';


class Perfil extends StatefulWidget {
  final dynamic user;

  const Perfil({Key? key, required this.user}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}



class _PerfilState extends State<Perfil> with WidgetsBindingObserver{
  int _page = 2;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  
  @override
  Widget build(BuildContext context) {

    // Barra de navegação curvada
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
    
    // Barra de navegação
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient:LinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255,255,255,1),
              Color.fromRGBO(177, 246, 255, 0.52),
              Color.fromRGBO(168, 245, 255, 0.8177)
            ],
          ),
        ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
              // imagem de perfil
                Stack(
                  children: <Widget>[
                    // Círculo ao redor do ícone
                    Container(
                      width: 210,
                      height: 210,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(6, 39, 80, 1),
                      ),
                    ),
                    // Ícone de pessoa sobreposto ao círculo
                    const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 210,
                    ),
                  ],
                ),
              // Nome + edit
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.user.nome,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(6, 39, 80, 1),
                        fontSize: 25),
                    
                  ),
                  const Icon(
                    Icons.edit,
                    color: Color.fromRGBO(6, 39, 80, 1),
                    size: 25,
                  )
                ],
              ),
              Text(
                'Alterar dados de cadastro',
                style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(6, 39, 80, 1),
                fontSize: 25),
                
              ),
              Text(
                'Configurações',
                style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(6, 39, 80, 1),
                fontSize: 25),
                
              ),
              Text(
                'Sair',
                style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(200, 0, 0, 1),
                fontSize: 25),
        
                      ),
        ],
  ),
  ),

      bottomNavigationBar:
            //BottomNavBar(user:widget.user),
            widget.user is Aluno
                ? CurvedNavigationBar(
                    key: _bottomNavigationKey,
                    index: 2,
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
                      final routes = ['/home', '/turmas', '/perfil', '/chamada'];
                      Navigator.pushReplacementNamed(context, routes[index],
                          arguments: widget.user);
                    },
                    letIndexChange: (index) => true,
                  )
                : CurvedNavigationBar(
                    key: _bottomNavigationKey,
                    index: 2,
                    height: 60.0,
                    items: <Widget>[
                      Icon(
                        Icons.home,
                        size: 30,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      buildCurvedNavigationBarItem(Icons.list, 'Admin'),
                      buildCurvedNavigationBarItem(Icons.person, 'Perfil'),
                      //buildCurvedNavigationBarItem(Icons.phone_enabled, 'Chamada')
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
                      final routes = ['/home', '/chamadaProfessor', '/perfil'];
                      Navigator.pushReplacementNamed(context, routes[index],
                          arguments: widget.user);
                    },
                    letIndexChange: (index) => true,
                  )
    //widget.user is Aluno ? PageUtils.buildBottomNavigationBarAluno(context, widget.user) : PageUtils.buildBottomNavigationBarProfessor(context, widget.user),
      );
    }
}