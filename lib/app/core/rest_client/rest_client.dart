import 'package:get/get.dart';

class RestClient extends GetConnect {
  static const _backendBaseURL = 'http://dartweek.academiadoflutter.com.br';
  RestClient() {
    httpClient.baseUrl = _backendBaseURL;
  }
}

class RestClientException implements Exception {
  final int? code;
  final String message;
  RestClientException(
    this.message, {
    this.code
  });

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
