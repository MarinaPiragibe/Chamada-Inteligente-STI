import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HorizontalCardList extends StatelessWidget {
  final List<Map<String, String>> cardDataList;

  HorizontalCardList({super.key, required this.cardDataList});

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
        CarouselSlider.builder(
          disableGesture: false,
          itemCount: cardDataList.length, // Usar o tamanho da lista de dados
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: true,
            height: 300,
            viewportFraction: 0.5,
          ),
          itemBuilder: (context, index, realIndex) {
            final color = cardColors[index % cardColors.length];
            final cardData = cardDataList[index]; // Obter dados do cardDataList
            final titulo = cardData['titulo'];
            final descricao = cardData['descricao'];
            return Container(
              width: 200,
              margin: EdgeInsets.all(8),
              child: Card(
                color: color,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        titulo ?? 'Título',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        descricao ?? 'Descrição',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
