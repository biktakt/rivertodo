import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() => Dio(
    BaseOptions(
      baseUrl: 'https://my-json-server.typicode.com/biktakt/todomockdb',
      headers: {'Content-Type': 'application/json'},
    ),
  );
}
