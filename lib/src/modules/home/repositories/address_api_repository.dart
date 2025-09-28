import 'package:dio/dio.dart';
import 'package:fast_location_project/src/http/http_client.dart';
import 'package:fast_location_project/src/modules/home/model/address_model.dart';

/// Repositório responsável por buscar dados de endereço na API ViaCEP.
class AddressApiRepository {
  final Dio _dio = HttpClient.getClient();

  /// Consulta a API ViaCEP usando o CEP informado.
  /// Retorna um modelo AddressModel com os dados recebidos.
  Future<AddressModel?> fetchAddressByCep(String cep) async {
    try {
      final response = await _dio.get('$cep/json');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;

        // Cria e retorna o modelo de endereço com os dados da API
        return AddressModel(
          cep: data['cep'] ?? '',
          logradouro: data['logradouro'] ?? '',
          bairro: data['bairro'] ?? '',
          localidade: data['localidade'] ?? '',
          uf: data['uf'] ?? '',
        );
      }
    } catch (e) {
      print('Erro ao consultar CEP: $e');
    }

    return null; // Retorna null em caso de erro ou dados inválidos
  }
}