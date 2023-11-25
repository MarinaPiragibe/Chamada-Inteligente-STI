
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Erro do login do back
final snackBarErroLogin = SnackBar(
  content: Text(
    "email ou senha inválidos!",
    textAlign: TextAlign.center,
  ),
  backgroundColor: Colors.redAccent,
  duration: const Duration(seconds: 5),
);


//Erro email vazia
final snackBarEmailEmpty = SnackBar(
  content: Text(
    "email vazio!",
    textAlign: TextAlign.center,
  ),
  backgroundColor: Color.fromARGB(255, 216, 80, 1),
  duration: const Duration(seconds: 2),
);

//Erro senha vazia
final snackBarSenhaEmpty = SnackBar(
  content: Text(
    "senha vazia!",
    textAlign: TextAlign.center,
  ),
  backgroundColor: Color.fromARGB(255, 216, 80, 1),
  duration: const Duration(seconds: 2),
);