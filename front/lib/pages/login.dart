import 'dart:convert';
import 'dart:html';
import 'dart:js';
import 'package:chamada_inteligente/pages/home.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  

  @override
  State<LoginPage> createState() => _LoginPageState();
}
final _email = TextEditingController();
final _senha = TextEditingController();
Widget buildEmail(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Email',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 10,),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 5,
              offset: Offset(0,2)
            )
          ]
        ),
        height: 60,
        child: TextField(
          controller:_email,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 12),
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff0c3b6a)
            ),
            hintText: 'Email',
            hintStyle: TextStyle(
              color: Colors.black12
            )
          )
        ),
      )
    ],
  );
}
Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Senha',
        style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 10,),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black45,
                  blurRadius: 5,
                  offset: Offset(0,2)
              )
            ]
        ),
        height: 60,
        child: TextFormField(
            controller: _senha,
            obscureText: true,        
            style: TextStyle(
                color: Colors.black
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 12),
                prefixIcon: Icon(
                    Icons.key,
                    color: Color(0xff0c3b6a)
                ),
                hintText: 'Senha',
                hintStyle: TextStyle(
                    color: Colors.black12
                )
            ),
        ),
      )
    ],
  );
}
Widget buildForgotPassword(){
  return Container(
    alignment: Alignment.centerRight,
    child: Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
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
Widget buildLogin(BuildContext context){
  return Container(
    padding: EdgeInsets.symmetric(vertical:30),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(15),
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
        ),
      ),
      onPressed: () {
        Future<http.Response> respostaAlunoBack = verificarUsuario(_email.text.toString(), _senha.text.toString(), context);
        respostaAlunoBack.then((value) => {
          if(value.statusCode ==200){
            //Statuscode 200 deu bom
            Navigator.push(context,MaterialPageRoute(builder: (context) => Home(user: value)))
          } else if(value.statusCode == 400){
            //StatusCode não achou ninguem
            print("Email ou senha invalido!"),
            _senha.clear(),
            ScaffoldMessenger.of(context).showSnackBar(snackBar)
          }
        }
        );
      },
      child: Text(
        'LOGIN',
        style: TextStyle(
          color: Color(0xffa3deF8),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
final snackBar = SnackBar(content: Text(
  "email ou senha inválidos!",
  textAlign: TextAlign.center,
  ),
  backgroundColor: Colors.redAccent,
  duration: const Duration(seconds: 5),
  
  );
  final snackBarEmailEmpty = SnackBar(content: Text(
  "email vazio!",
  textAlign: TextAlign.center,
  ),
  backgroundColor: Colors.yellowAccent,
  duration: const Duration(seconds: 2),
  
  );
    final snackBarSenhaEmpty = SnackBar(content: Text(
  "SENHA vazia!",
  textAlign: TextAlign.center,
  ),
  backgroundColor: Colors.yellowAccent,
  duration: const Duration(seconds: 2),
  
  );


  Future<http.Response> verificarUsuario(String email, String senha, BuildContext context) async{
    if(senha.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(snackBarSenhaEmpty);
      throw ErrorDescription("senha vazia!");
    }
    if(email.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(snackBarEmailEmpty);
      throw ErrorDescription("email vazio!");
    }
    var respostaAlunoBack = await http.post(
      Uri.parse('http://127.0.0.1:3000/login'),
      body: {
        'email' : email,
        'senha' : senha
      }
    );
     return respostaAlunoBack;
  }



Widget buildSingup(){
  return GestureDetector(
    onTap: () => print("Sing up pressed"),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Nao possui uma conta? ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500
            )
          ),
          TextSpan(
            text: " Cadastre-se",
            style: TextStyle(
              color: Colors.white,
              fontSize:18,
              fontWeight: FontWeight.bold
            )
          )
        ]
      ),
    ),
  );
}

class _LoginPageState extends State<LoginPage>{
  @override

  Widget build(BuildContext context) {
   return Scaffold(
     body: AnnotatedRegion<SystemUiOverlayStyle>(
       value: SystemUiOverlayStyle.light,
       child: Stack(
         children: <Widget>[
           Container(
             height:double.infinity,
             width: double.infinity,
             decoration: BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [
                   Color(0x660c3b6a),
                   Color(0x990c3b6a),
                   Color(0xcc0c3b6a),
                   Color(0xff0c3b6a),
                 ]
               )
             ),
             child: SingleChildScrollView(
               physics: AlwaysScrollableScrollPhysics(),
               padding: EdgeInsets.symmetric(
                 horizontal: 25,
                 vertical: 120
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text(
                     'Sing In',
                     style: TextStyle(
                       color: Colors.white,
                       fontSize:30,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   SizedBox(height: 50),
                   buildEmail(),
                   SizedBox(height: 30),
                   buildPassword(),
                   buildForgotPassword(),
                   buildLogin(context),
                   buildSingup(),
                 ],
               ),
             ) ,
           )
         ],
       ),
     )
    );
  }

}


