import 'package:hive/hive.dart';
import 'package:fast_location_project/src/modules/home/model/address_model.dart';

/// Repositório responsável por salvar e recuperar endereços localmente usando Hive.
class AddressLocalRepository {
  static const String boxName = 'addressBox';

  /// Abre a box do Hive onde os endereços são armazenados.
  Future<Box<AddressModel>> _openBox() async {
    return await Hive.openBox<AddressModel>(boxName);
  }

  /// Salva um novo endereço na box.
  Future<void> saveAddress(AddressModel address) async {
    final box = await _openBox();
    await box.add(address);
  }

  /// Retorna todos os endereços salvos.
  Future<List<AddressModel>> getAllAddresses() async {
    final box = await _openBox();
    return box.values.toList();
  }

  /// Remove um endereço pelo índice.
  Future<void> deleteAddress(int index) async {
    final box = await _openBox();
    await box.deleteAt(index);
  }

  /// Limpa todos os endereços salvos.
  Future<void> clearAll() async {
    final box = await _openBox();
    await box.clear();
  }
}