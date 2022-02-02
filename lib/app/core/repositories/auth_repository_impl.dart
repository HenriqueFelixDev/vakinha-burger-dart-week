import 'dart:developer';

import 'iauth_repository.dart';
import '../rest_client/rest_client.dart';
import '../models/user_model.dart';
import '../exceptions/user_not_found_exception.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final RestClient _client;
  AuthRepositoryImpl(RestClient client)
    : _client = client;

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _client.post('/auth/', {
      'email': email,
      'password': password
    });

    if (result.hasError) {
      if (result.statusCode == 403) {
        log(
          'Usuário ou senha inválidos',
          error: result.statusText,
          stackTrace: StackTrace.current
        );
        throw UserNotFoundException();
      }

      log(
        'Erro ao autenticar o usuário: ${result.statusText}',
        error: result.statusText,
        stackTrace: StackTrace.current
      );

      throw RestClientException('Erro ao autenticar o usuário');
    }

    return UserModel.fromMap(result.body);
  }

  @override
  Future<UserModel> signUp(String name, String email, String password) async {
    final result = await _client.post('/auth/register', {
      'name': name,
      'email': email,
      'password': password
    });

    if (result.hasError) {
      var message = 'Erro ao registrar usuário';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }
      
      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current
      );
      throw RestClientException(message);
    }

    return login(email, password);
  }

}