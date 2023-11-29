import 'package:chamada_inteligente/models/chamada.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Deve fazer algo na chamada', () {
    var resposta = Chamada.verificarAssinaturaAluno(1, 1, "29/11/2023");
    expect(resposta, false);
  });
}
