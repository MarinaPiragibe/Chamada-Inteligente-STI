
import 'package:chamada_inteligente/models/aluno.dart';
import 'package:chamada_inteligente/models/chamada.dart';
import 'package:chamada_inteligente/models/turma.dart';
import 'package:flutter/material.dart';


class DetalhesTurma extends StatefulWidget {
  final dynamic state;

  DetalhesTurma({Key? key,required this.state}) : super(key: key);
   @override
  State<DetalhesTurma> createState() => _DetalhesTurmaState();
}



class _DetalhesTurmaState extends State<DetalhesTurma> {
  List<Aluno>? alunosChamadaAssinada=[];
   @override
  void initState() {
    super.initState();
    _pegarDados();
  }

  _pegarDados() async{
      alunosChamadaAssinada = (await Chamada.assinaturasTurma(widget.state[1]))!;
      
      setState(() {
        alunosChamadaAssinada = alunosChamadaAssinada;
      });
    }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Turma'),
      ),
      body: Column(
        children: [
          // Adicione aqui o conteúdo da tela, como informações sobre a turma
          // ...
          alunosChamadaAssinada!.isEmpty? Text("Sem assinaturas"):
          Expanded(
            child:
             ListView.builder(
                    itemCount: alunosChamadaAssinada!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(alunosChamadaAssinada![index].nome),
                        // Adicione outras informações do aluno, se necessário
                      );
                    },
                  ),
          ),
          // Botões para ligar e desligar chamada
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Lógica para ligar a chamada
                  Turma.ligarChamada(widget.state[1]);
                },
                child: Text('Ligar Chamada'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Lógica para desligar a chamada
                  Turma.desligarChamada(widget.state[1]);
                },
                child: Text('Desligar Chamada'),
              ),
            
            ],
          ),
        ],
      ),
    );
  }
}