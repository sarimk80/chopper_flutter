import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_flutter/src/model/User.dart';
import 'package:chopper_flutter/src/service/BuiltValueConverter.dart';

part 'ApiService.chopper.dart';

@ChopperApi(baseUrl: '/users')
abstract class ApiService extends ChopperService {
  @Get()
  Future<Response<BuiltList<User>>> getUser();

  @Get(path: '/users/{id}')
  Future<Response<User>> getSingleUser(@Path('id') int id);

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [_$ApiService()],
      converter: BuiltValueConverter(),
      errorConverter: BuiltValueConverter(),
    );
    return _$ApiService(client);
  }
}

//flutter packages pub run build_runner build