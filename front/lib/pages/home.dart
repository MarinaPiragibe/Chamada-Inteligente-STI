import 'package:chamada_inteligente/models/aluno.dart';
import 'package:chamada_inteligente/models/localizacao.dart';
import 'package:chamada_inteligente/models/turma.dart';
import 'package:chamada_inteligente/utils/page-utils.dart';
import 'package:chamada_inteligente/utils/card-horizontal.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// NavBar Ondulada

// class WavyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text('Wavy AppBar'),
//       flexibleSpace: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blue, Colors.purple],
//           ),
//         ),
//       ),
//       bottom: PreferredSize(
//         preferredSize: Size.fromHeight(20.0),
//         child: ClipPath(
//           clipper: WavyClipper(),
//           child: Container(
//             height: 20,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.white, Colors.white], // You can change the colors
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight + 20.0);
// }
// class WavyClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height - 20);
//     path.quadraticBezierTo(
//         size.width / 4, size.height, size.width / 2, size.height - 20);
//     path.quadraticBezierTo(
//         3 * size.width / 4, size.height - 40, size.width, size.height - 20);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
// class WavyAppBarShape extends ContinuousRectangleBorder {
//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     Path path = Path();
//     path.moveTo(rect.left, rect.top);
//     path.lineTo(rect.right, rect.top);
//     path.lineTo(rect.right, rect.bottom - 20);
//     path.quadraticBezierTo(
//         rect.right - 10, rect.bottom, rect.right - 10, rect.bottom - 10);
//     path.lineTo(rect.left + 20, rect.bottom - 20);
//     path.quadraticBezierTo(
//         rect.left + 5, rect.bottom, rect.left, rect.bottom - 40);
//     path.lineTo(rect.left, rect.top);
//     path.close();
//     return path;
//   }
// }
////////////////////////////////////////////////////////

class Home extends StatefulWidget {
  final dynamic user;
  const Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, String>> lista = [
    {'titulo': 'Card 1', 'descricao': 'Descrição do Card 1'},
    {'titulo': 'Card 2', 'descricao': 'Descrição do Card 2'},
    {'titulo': 'Card 3', 'descricao': 'Descrição do Card 3'},
    {'titulo': 'Card 4', 'descricao': 'Descrição do Card 4'},
    {'titulo': 'Card 5', 'descricao': 'Descrição do Card 5'}
  ];
  @override
  Widget build(BuildContext context) {

    pegarPosicao() async{
      Position? posicao = await Localizacao.posicaoAtual();
      print(posicao.latitude);
      print(posicao.altitude);
    }
    pegarPosicao();

    return Scaffold(
      //appBar: AppBar(
        //title: Text('teste'),
        // shape: WavyAppBarShape(),
        //),
      body: Column(
        children:[
          Row(children: [
            Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Círculo ao redor do ícone
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromRGBO(6, 39, 80, 1),
                ),
              ),
              // Ícone de pessoa sobreposto ao círculo
              Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
            ],),
            SizedBox(
              width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bem Vindo,',
                  style: TextStyle(
                    color: const Color.fromRGBO(6, 39, 80, 1),
                    fontSize: 12),),
                Text(
                  widget.user.nome,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(6, 39, 80, 1),
                    fontSize: 14),
                  )],)
            ],),
            HorizontalCardList(
              cardDataList: lista),
          ]),
      bottomNavigationBar:
        CurvedNavigationBar(
          color: Color.fromRGBO(6, 39, 80, 1),
          backgroundColor: Color.fromARGB(0, 1, 3, 8),
          items: <Widget>[
            Icon(Icons.add, size: 30,color: Colors.white,),
            Icon(Icons.list, size: 30,color: Colors.white,),
            Icon(Icons.compare_arrows, size: 30,color: Colors.white,),
          ],
          onTap: (index) {
    },)
          //widget.user is Aluno ? PageUtils.buildBottomNavigationBarAluno(context, widget.user) : PageUtils.buildBottomNavigationBarProfessor(context, widget.user),
    );
  }
}
