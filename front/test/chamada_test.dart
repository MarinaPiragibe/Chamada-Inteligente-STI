import 'package:chamada_inteligente/models/professor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('deve fazer logout do Professor', () async {
    final professor = Professor(id: 1, nome: 'Joao', cpf: '123456789');

    // Configurando um mock para a chamada http.post
    configureHttpTest(
      'POST',
      Uri.parse('http://127.0.0.1:3000/logout'),
      body: {'id': '1'},
      respondWith: http.Response('', 200),
    );

    professor.logoutProfessorApi();
  });

  test('deve atualizar Professor', () async {
    final professor = Professor(id: 1, nome: 'Joao', cpf: '123456789');
    const double latitude = 10.0;
    const double longitude = 20.0;
    const int online = 1;

    // Configurando um mock para a chamada http.post
    configureHttpTest(
      'POST',
      Uri.parse('http://127.0.0.1:3000/atualizarPosicaoProfessor'),
      body: {'id': '1', 'online': '1', 'latitude': '10.0', 'longitude': '20.0'},
      respondWith: http.Response('', 200),
    );

    professor.atualizarProfessor(latitude, longitude, online);
  });

  // Adicione mais testes para outros métodos conforme necessário
}

void configureHttpTest(String s, Uri parse,
    {required Map<String, String> body, required http.Response respondWith}) {}
