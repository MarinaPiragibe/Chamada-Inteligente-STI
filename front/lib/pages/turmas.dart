import 'package:chamada_inteligente/utils/page-utils.dart';
import 'package:flutter/material.dart';

class Turmas extends StatefulWidget {
  @override
  State<Turmas> createState() => _TurmasState();
}

class _TurmasState extends State<Turmas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Turmas'),
        ),
        backgroundColor: Colors.pink,
        bottomNavigationBar: PageUtils.buildBottomNavigationBar(context));
  }
}
