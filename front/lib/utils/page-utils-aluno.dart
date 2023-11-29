import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavBar extends StatefulWidget {
  final dynamic user;

  const BottomNavBar({Key? key, required this.user}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.list, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
          Icon(Icons.phone_enabled, size: 30, color: Colors.white),
        ],
        color: Colors.blueAccent,
        // buttonBackgroundColor: Colors.blueAccent,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
          final routes = ['/home', '/turmas', '/login','/chamada'];
        // Se o índice for 1 (Turmas), navegue para a rota 'turmas' com o parâmetro user
        print(routes[index]);
        // Navigator.pushReplacementNamed(context, routes[index], arguments: widget.user);
        },
        letIndexChange: (index) => true,
      ),

    );
  }
}
