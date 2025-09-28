// ============================
// Arquivo: history_controller.dart
// Finalidade: Controlar a tela de histórico com MobX
// ============================

import 'package:mobx/mobx.dart';
import 'package:fast_location_project/src/modules/home/model/address_model.dart';
import 'package:fast_location_project/src/modules/home/service/address_service.dart';

part 'history_controller.g.dart';

/// Controller responsável por carregar e gerenciar o histórico de endereços.
class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  final AddressService _service = AddressService();

  /// Lista de endereços salvos localmente.
  @observable
  ObservableList<AddressModel> addressHistory = ObservableList<AddressModel>();

  /// Indica se os dados estão sendo carregados.
  @observable
  bool isLoading = false;

  /// Carrega os endereços salvos no Hive.
  @action
  Future<void> loadHistory() async {
    isLoading = true;
    final list = await _service.getSavedAddresses();
    addressHistory = ObservableList<AddressModel>.of(list);
    isLoading = false;
  }

  /// Remove um endereço do histórico pelo índice.
  @action
  Future<void> deleteAddress(int index) async {
    await _service.deleteAddress(index);
    await loadHistory(); // Atualiza a lista após exclusão
  }

  /// Limpa todo o histórico de endereços.
  @action
  Future<void> clearHistory() async {
    await _service.clearHistory();
    await loadHistory(); // Atualiza a lista após limpeza
  }
}