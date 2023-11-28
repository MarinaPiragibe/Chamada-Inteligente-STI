import 'package:flutter/material.dart';

class cardExpandido extends StatelessWidget {
  final String titulo;
  final String descricao;

  const cardExpandido(
      {super.key, required this.titulo, required this.descricao});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ExpansionTile(
        textColor: Theme.of(context).primaryColor,
        title: Text(
          titulo,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            
          ),
        ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              descricao,
              style: TextStyle(fontSize: 16.0),
            ),
          )
        ],
      ),
    );
  }
}
