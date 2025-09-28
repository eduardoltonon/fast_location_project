import 'package:hive/hive.dart';

part 'address_model.g.dart'; // Arquivo gerado automaticamente

/// Modelo de dados para armazenar endereços consultados.
/// Será usado para salvar no Hive (banco local).
@HiveType(typeId: 0)
class AddressModel extends HiveObject {
  @HiveField(0)
  final String cep;

  @HiveField(1)
  final String logradouro;

  @HiveField(2)
  final String bairro;

  @HiveField(3)
  final String localidade;

  @HiveField(4)
  final String uf;

  AddressModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });
}