// ============================
// Página: HomePage
// Finalidade: Tela principal com busca de endereços e histórico
// ============================

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fast_location_project/src/modules/home/controller/home_controller.dart';
import 'package:fast_location_project/src/modules/home/components/address_list_component.dart';
import 'package:fast_location_project/src/modules/home/components/last_address_component.dart';
import 'package:fast_location_project/src/modules/home/components/empty_search_component.dart';
import 'package:fast_location_project/src/shared/colors/colors.dart';
import 'package:fast_location_project/src/shared/metrics/metrics.dart';
import 'package:fast_location_project/src/routes/routes.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  // Construtor recebe o controller como parâmetro
  const HomePage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('FastLocation'),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              // Navega para a página de histórico
              Navigator.pushNamed(context, AppRoutes.history);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppMetrics.paddingMedium),
        child: Column(
          children: [
            // Campo de busca de CEP
            TextField(
              decoration: const InputDecoration(
                labelText: 'Digite o CEP',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                controller.setCepInput(value);
              },
            ),
            const SizedBox(height: AppMetrics.componentSpacing),

            // Botão para buscar endereço
            ElevatedButton(
              onPressed: () async {
                await controller.searchAddress();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                minimumSize: const Size.fromHeight(AppMetrics.buttonHeight),
              ),
              child: const Text('Buscar Endereço'),
            ),
            const SizedBox(height: AppMetrics.componentSpacing),

            // Exibe o último endereço buscado
            Observer(
              builder: (_) {
                if (controller.currentAddress != null) {
                  return LastAddressComponent(address: controller.currentAddress!);
                } else {
                  return const EmptySearchComponent();
                }
              },
            ),
            const SizedBox(height: AppMetrics.componentSpacing),

            // Lista de endereços salvos
            Expanded(
              child: Observer(
                builder: (_) {
                  return AddressListComponent(addresses: controller.addressHistory);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.success,
        child: const Icon(Icons.map),
        onPressed: () {
          // Ação para traçar rota no mapa
          // (Você pode implementar isso no controller)
        },
      ),
    );
  }
}