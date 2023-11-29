import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HorizontalCardListColumn extends StatelessWidget {
  final List<Map<String, String>> cardDataList;

  HorizontalCardListColumn({super.key, required this.cardDataList});

  // Cores correspondentes para os cartões
  final List<Color?> cardColors = [
    Colors.orange[400], // Laranja mecânico
    Colors.blue[900], // Azul escuro
    Colors.purple[900], // Roxo escuro
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: ListView.builder(
          itemCount: cardDataList.length,
          itemBuilder: (context, index) {
            final color = cardColors[index % cardColors.length];
            final cardData = cardDataList[index]; // Obter dados do cardDataList
            final titulo = cardData['titulo'];
            final descricao = cardData['descricao'];
            return Card(
              color: color,
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cardDataList[index]['titulo']!,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.w500),),
                    Text(cardDataList[index]['descricao']!),
                  ],
              ),)
            );
          },
        ),)
        
      ],
    );
  }
}
