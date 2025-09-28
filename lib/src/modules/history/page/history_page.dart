// ============================
// Página: HistoryPage
// Finalidade: Exibir histórico de endereços consultados
// ============================

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fast_location_project/src/modules/history/controller/history_controller.dart';
import 'package:fast_location_project/src/shared/colors/colors.dart';
import 'package:fast_location_project/src/shared/metrics/metrics.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final controller = HistoryController();

  @override
  void initState() {
    super.initState();
    controller.loadHistory(); // Carrega os dados ao abrir a tela
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Endereços'),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            tooltip: 'Limpar histórico',
            onPressed: () async {
              await controller.clearHistory();
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.addressHistory.isEmpty) {
            return const Center(child: Text('Nenhum endereço salvo.'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(AppMetrics.paddingMedium),
            itemCount: controller.addressHistory.length,
            separatorBuilder: (_, __) => const SizedBox(height: AppMetrics.componentSpacing),
            itemBuilder: (context, index) {
              final address = controller.addressHistory[index];
              return ListTile(
                title: Text('${address.logradouro}, ${address.bairro}'),
                subtitle: Text('${address.localidade} - ${address.uf}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await controller.deleteAddress(index);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}