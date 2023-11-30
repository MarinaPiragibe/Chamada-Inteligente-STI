import 'package:chamada_inteligente/models/aluno.dart';
import 'package:chamada_inteligente/models/professor.dart';
import 'package:chamada_inteligente/pages/home.dart';
import 'package:http/http.dart' as http;
import 'package:chamada_inteligente/pages/errors/errorsLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCustomClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // Define a região a ser cortada (neste caso, 100 pixels da parte superior)
    return Rect.fromLTWH(0, 100, size.width, size.height - 100);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}

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

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _email = TextEditingController();
final _senha = TextEditingController();
bool loginProfessor = false;
Widget buildEmail(context) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 60,
            child: TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width:
                          2.0), // Cor e espessura da borda quando o TextField estiver selecionado
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).hintColor,
                      width:
                          1.0), // Cor e espessura da borda quando o TextField estiver desativado
                ),
                contentPadding: EdgeInsets.only(top: 12),
                prefixIcon:
                    Icon(Icons.email, color: Theme.of(context).primaryColor),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black12),
              ),
            ))
      ]);
}

Widget buildPassword(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Senha',
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
      Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 60,
          child: TextFormField(
            controller: _senha,
            obscureText: true,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width:
                        2.0), // Cor e espessura da borda quando o TextField estiver selecionado
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).hintColor,
                    width:
                        1.0), // Cor e espessura da borda quando o TextField estiver desativado
              ),
              contentPadding: EdgeInsets.only(top: 12),
              prefixIcon:
                  Icon(Icons.key, color: Theme.of(context).primaryColor),
              hintText: 'Senha',
              hintStyle: TextStyle(color: Colors.black12),
            ),
          ))
    ],
  );
}

Widget buildForgotPassword() {
  return Container(
    alignment: Alignment.centerRight,
    child: Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(0),
            textStyle: const TextStyle(fontSize: 10),
          ),
          onPressed: () {},
          child: const Text('Esqueci a senha'),
        ),
      ],
    ),
  );
}

Widget buildLogin(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(15),
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: () async {
        verificarInputInserido(
            _email.text.toString(), _senha.text.toString(), context);
        if (loginProfessor) {
          Professor? professor = await Professor.verificarProfessor(
              _email.text.toString(), _senha.text.toString());
          if (professor != null) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home(user: professor)));
            _senha.clear();
            _email.clear();
          } else
            loginComFalha(context);
        } else {
          Aluno? aluno = await Aluno.verificarAluno(
              _email.text.toString(), _senha.text.toString());
          if (aluno != null) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home(user: aluno)));
            _senha.clear();
            _email.clear();
          } else
            loginComFalha(context);
        }
      },
      child: Text(
        'LOGIN',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

void verificarInputInserido(String email, String senha, BuildContext context) {
  //verifica se o campo email esta vazio
  if (email.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(snackBarEmailEmpty);
    throw ErrorDescription("email vazio!");
  }
  //verificar se o campo senha esta vazio
  if (senha.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(snackBarSenhaEmpty);
    throw ErrorDescription("senha vazia!");
  }
}

void loginComFalha(context) {
  ScaffoldMessenger.of(context).showSnackBar(snackBarErroLogin);
  _senha.clear();
}

Widget buildSingup() {
  return GestureDetector(
    onTap: () => print("Sing up pressed"),
    child: RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "Nao possui uma conta? ",
            style: TextStyle(fontSize: 12, color: Color.fromRGBO(126, 126, 126, 1))),
        TextSpan(
          text: " Cadastre-se",
          style: TextStyle(fontSize: 12,color: Color.fromRGBO(42, 105, 136, 1), fontWeight: FontWeight.w500,)
        )
      ]),
    ),
  );
}

class _LoginPageState extends State<LoginPage> {
  trocarEstadoLoginProfessor() {
    setState(() {
      loginProfessor = !loginProfessor;
    });
  }

  Widget botaoProfessor() {
    return TextButton(
      onPressed: () {
        trocarEstadoLoginProfessor();
      },
      style: TextButton.styleFrom(
        backgroundColor: loginProfessor ? Colors.green : Colors.red,
      ),
      child: Text(
        loginProfessor ? 'Professor' : 'Aluno',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color.fromRGBO(255,255,255,1),Color.fromRGBO(177, 246, 255, 0.52), Color.fromRGBO(168, 245, 255, 0.8177)],
                    ),
                  ),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                      children: [
                        Image.asset(
                        width: double.infinity,
                        'images/bg.png', 
                        fit: BoxFit.cover,

                      ),Positioned(
                        top: MediaQuery.of(context).size.height * 0.1,
                        left: MediaQuery.of(context).size.width * 0.1,
                        child:Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      )),],),
                      
                      
                      Container(child: buildEmail(context),padding: EdgeInsets.symmetric(horizontal: 25),),
                      Container(child: buildPassword(context),padding: EdgeInsets.symmetric(horizontal: 25),),
                      Container(child: buildForgotPassword(),padding: EdgeInsets.symmetric(horizontal: 25),),
                      Container(child: botaoProfessor(),padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),),
                      
                      SizedBox(
                        height: 10,
                      ),
                      Container(child: buildLogin(context),padding: EdgeInsets.symmetric(horizontal: 25)),
                      Container(child: buildSingup(),padding: EdgeInsets.symmetric(horizontal: 25),),
                      
                      
                    ],
                  ),
                ),
              )])
        ),
      ),
    );
  }
}
