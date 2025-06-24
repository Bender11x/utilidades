import 'dart:async';
import 'dart:math';

class ClimaService {
  final _random = Random();

  
  Future<double> buscarTemperaturaInicial() async {
    await Future.delayed(Duration(seconds: 2));
    return 15 + _random.nextDouble() * 15; 
  }

 
  Stream<double> gerarTemperaturas() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 2));
      yield 15 + _random.nextDouble() * 15;
    }
  }

 
  static Future<double> calcularMedia(List<double> temperaturas) async {
    
    double soma = 0;
    for (var t in temperaturas) {
      soma += t;
    }
    return soma / temperaturas.length;
  }
}
