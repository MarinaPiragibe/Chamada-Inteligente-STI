import 'package:chamada_inteligente/models/professor.dart';
import 'package:chamada_inteligente/models/turma.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chamada_inteligente/pages/detalhesTurma.dart';

class HorizontalCardListColumnProfessor extends StatelessWidget {
  final List<Map<String, String>> cardDataList;
  final Professor professor;

  HorizontalCardListColumnProfessor({Key? key, required this.cardDataList, required this.professor}) : super(key: key);

  final List<Color?> cardColors = [
    Colors.orange[400], // Laranja mecânico
    Colors.blue[900], // Azul escuro
    Colors.purple[900], // Roxo escuro
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: cardDataList.length,
            itemBuilder: (context, index) {
              final color = cardColors[index % cardColors.length];
              final cardData = cardDataList[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: color,
                        margin: EdgeInsets.all(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cardData['titulo']!,
                                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Professor: ${cardData['professor']}',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${_formatDias(cardData['dias']!)}',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${cardData['horario']}',
                                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.cell_wifi),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalhesTurma(state:[professor,cardData['id']] ),
                          ),);
                        // Adicione a lógica que deseja executar ao clicar no botão
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  String _formatDias(String dias) {
    List<String> diasList = dias.split(',').map((dia) => dia.trim()).toList();
    return diasList.join(', ');
  }
}