import 'package:mobx/mobx.dart';
import 'package:fast_location_project/src/modules/home/model/address_model.dart';
import 'package:fast_location_project/src/modules/home/service/address_service.dart';
import 'package:map_launcher/map_launcher.dart'; // ✅ Importa o pacote para abrir mapas

part 'home_controller.g.dart';

/// Controller responsável por gerenciar o estado da tela Home.
/// Utiliza MobX para reatividade e integra o AddressService.
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AddressService _service = AddressService();

  /// CEP digitado pelo usuário.
  @observable
  String cepInput = '';

  /// Endereço retornado da consulta.
  @observable
  AddressModel? currentAddress;

  /// Lista de endereços salvos localmente.
  @observable
  ObservableList<AddressModel> addressHistory = ObservableList<AddressModel>();

  /// Indica se está carregando dados.
  @observable
  bool isLoading = false;

  /// Mensagem de erro (se houver).
  @observable
  String? errorMessage;

  /// Atualiza o valor do CEP digitado.
  @action
  void setCepInput(String value) {
    cepInput = value;
  }

  /// Realiza a consulta de endereço e atualiza o estado.
  @action
  Future<void> searchAddress() async {
    isLoading = true;
    errorMessage = null;

    // Validação básica do CEP
    final cep = cepInput.replaceAll(RegExp(r'[^0-9]'), '');
    if (cep.length != 8) {
      errorMessage = 'CEP inválido. Digite 8 números.';
      isLoading = false;
      return;
    }

    final address = await _service.searchAndSaveAddress(cep);

    if (address != null) {
      currentAddress = address;
      await loadHistory(); // Atualiza histórico após salvar
    } else {
      errorMessage = 'Endereço não encontrado ou CEP inválido.';
    }

    isLoading = false;
  }

  /// Carrega o histórico de endereços salvos.
  @action
  Future<void> loadHistory() async {
    final list = await _service.getSavedAddresses();
    addressHistory = ObservableList<AddressModel>.of(list);
  }

  /// Limpa o campo de CEP.
  @action
  void clearInput() {
    cepInput = '';
  }

  /// Abre o app de mapas com o endereço atual (coordenadas fictícias por enquanto)
  @action
  Future<void> launchMap() async {
    if (currentAddress == null) return;

    final availableMaps = await MapLauncher.installedMaps;

    if (availableMaps.isNotEmpty) {
      final map = availableMaps.first;

      await map.showDirections(
        destination: Coords(
          0, // TODO: Substituir por latitude real
          0, // TODO: Substituir por longitude real
        ),
        destinationTitle:
        '${currentAddress!.logradouro}, ${currentAddress!.localidade} - ${currentAddress!.uf}',
      );
    }
  }
}