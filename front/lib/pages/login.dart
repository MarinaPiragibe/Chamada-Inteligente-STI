import 'package:chamada_inteligente/models/aluno.dart';
import 'package:chamada_inteligente/pages/home.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _email = TextEditingController();
final _senha = TextEditingController();
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
        verificarUsuario(_email.text.toString(), _senha.text.toString(), context);
        Aluno? aluno = await Aluno.verificarAluno(_email.text.toString(), _senha.text.toString());
        if(aluno != null){
           Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(user: aluno)));
        } else
        ScaffoldMessenger.of(context).showSnackBar(snackBarErroLogin);
        _senha.clear();

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

final snackBarErroLogin = SnackBar(
  content: Text(
    "email ou senha inválidos!",
    textAlign: TextAlign.center,
  ),
  backgroundColor: Colors.redAccent,
  duration: const Duration(seconds: 5),
);
final snackBarEmailEmpty = SnackBar(
  content: Text(
    "email vazio!",
    textAlign: TextAlign.center,
  ),
  backgroundColor: Color.fromARGB(255, 216, 80, 1),
  duration: const Duration(seconds: 2),
);
final snackBarSenhaEmpty = SnackBar(
  content: Text(
    "senha vazia!",
    textAlign: TextAlign.center,
  ),
  backgroundColor: Color.fromARGB(255, 216, 80, 1),
  duration: const Duration(seconds: 2),
);

void verificarUsuario(String email, String senha, BuildContext context)  {
    if (email.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(snackBarEmailEmpty);
    throw ErrorDescription("email vazio!");
  }
  if (senha.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(snackBarSenhaEmpty);
    throw ErrorDescription("senha vazia!");
  }


}

Widget buildSingup() {
  return GestureDetector(
    onTap: () => print("Sing up pressed"),
    child: RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "Nao possui uma conta? ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        TextSpan(
          text: " Cadastre-se",
        )
      ]),
    ),
  );
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/logo.png', // Substitua 'seu_logo.png' pelo caminho da imagem
                    width: 150, // Defina a largura desejada
                    height: 150, // Defina a altura desejada
                  ),
                  Text(
                    'Sing In',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  buildEmail(context),
                  buildPassword(context),
                  buildForgotPassword(),
                  SizedBox(
                    height: 10,
                  ),
                  buildLogin(context),
                  buildSingup(),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
