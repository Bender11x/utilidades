import 'package:flutter/material.dart';
import 'package:utilidades/src/controllers/clima_controller.dart';
import 'package:utilidades/src/models/clima_models.dart';

class TelaClima extends StatelessWidget {
  const TelaClima({super.key});

  @override
  Widget build(BuildContext context) {
    final climaController = ClimaController();
    final mediaTemperatura = ValueNotifier<double?>(null);
    final historicoTemperaturas = <ClimaModels>[];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Clima Agora"),
        // Removido o backgroundColor laranja, caso queira deixar padrão
        // Você pode personalizar aqui se quiser outra cor
      ),
      // Removido o drawer
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<ClimaModels>(
          future: climaController.carregarInicial(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final tempInicial = snapshot.data!.temperatura;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Temperatura atual: ${tempInicial.toStringAsFixed(1)}°C",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Atualizações em tempo real:",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),

                StreamBuilder<ClimaModels>(
                  stream: climaController.atualizarClima(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final climaAtual = snapshot.data!;
                      historicoTemperaturas.insert(0, climaAtual);

                      if (historicoTemperaturas.length > 10) {
                        historicoTemperaturas.removeLast();
                      }

                      return Text(
                        "${climaAtual.temperatura.toStringAsFixed(1)}°C",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepOrange,
                        ),
                      );
                    }

                    return const Text("Aguardando novos dados...");
                  },
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () async {
                    if (historicoTemperaturas.length < 10) return;

                    final media = await climaController.calcularMedia(
                      historicoTemperaturas.take(10).toList(),
                    );

                    mediaTemperatura.value = media;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 20,
                    ),
                  ),
                  child: const Text("Calcular média das últimas 10"),
                ),

                const SizedBox(height: 16),

                ValueListenableBuilder<double?>(
                  valueListenable: mediaTemperatura,
                  builder: (context, valor, _) {
                    if (valor == null) return const SizedBox();

                    return Text(
                      "Média das temperaturas: ${valor.toStringAsFixed(2)}°C",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
