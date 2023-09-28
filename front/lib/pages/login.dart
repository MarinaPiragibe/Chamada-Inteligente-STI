import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
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
Widget buildPassword(){
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
        child: TextField(
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
            )
        ),
      )
    ],
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
