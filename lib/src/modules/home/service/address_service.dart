import 'package:fast_location_project/src/modules/home/model/address_model.dart';
import 'package:fast_location_project/src/modules/home/repositories/address_api_repository.dart';
import 'package:fast_location_project/src/modules/home/repositories/address_local_repository.dart';

/// Serviço responsável por aplicar regras de negócio relacionadas à consulta de endereços.
/// Integra os repositórios de API e armazenamento local.
class AddressService {
  final AddressApiRepository _apiRepository = AddressApiRepository();
  final AddressLocalRepository _localRepository = AddressLocalRepository();

  /// Consulta o endereço na API ViaCEP e salva localmente se encontrado.
  Future<AddressModel?> searchAndSaveAddress(String cep) async {
    final address = await _apiRepository.fetchAddressByCep(cep);

    if (address != null) {
      await _localRepository.saveAddress(address);
    }

    return address;
  }

  /// Retorna todos os endereços salvos localmente.
  Future<List<AddressModel>> getSavedAddresses() async {
    return await _localRepository.getAllAddresses();
  }

  /// Remove um endereço do histórico pelo índice.
  Future<void> deleteAddress(int index) async {
    await _localRepository.deleteAddress(index);
  }

  /// Limpa todo o histórico de endereços.
  Future<void> clearHistory() async {
    await _localRepository.clearAll();
  }
}