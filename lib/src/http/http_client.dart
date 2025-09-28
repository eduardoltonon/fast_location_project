import 'package:dio/dio.dart';

/// Classe responsável por configurar o cliente HTTP usando Dio.
/// Essa configuração será usada para fazer chamadas à API ViaCEP.
class HttpClient {
  /// Retorna uma instância configurada do Dio.
  static Dio getClient() {
    final dio = Dio(BaseOptions(
      baseUrl: 'https://viacep.com.br/ws/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      responseType: ResponseType.json,
    ));

    // Adiciona interceptadores se necessário (ex: logs, headers)
    dio.interceptors.add(LogInterceptor(responseBody: true));

    return dio;
  }
}