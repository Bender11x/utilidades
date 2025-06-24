import 'package:utilidades/src/models/clima_models.dart';
import 'package:utilidades/src/services/clima_services.dart';


class ClimaController {
  final _servico = ClimaService();

  Future<ClimaModels> carregarInicial() async {
    final valor = await _servico.buscarTemperaturaInicial();
    return ClimaModels(valor);
  }

  Stream<ClimaModels> atualizarClima() {
    return _servico.gerarTemperaturas().map((t) => ClimaModels(t));
  }

  Future<double> calcularMedia(List<ClimaModels> dados) async {
    final temp = dados.map((e) => e.temperatura).toList();
    return await ClimaService.calcularMedia(temp);
  }
}