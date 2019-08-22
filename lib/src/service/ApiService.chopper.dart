// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ApiService extends ApiService {
  _$ApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ApiService;

  Future<Response<BuiltList<User>>> getUser() {
    final $url = '/users';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<User>, User>($request);
  }

  Future<Response<User>> getSingleUser(int id) {
    final $url = '/users/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<User, User>($request);
  }
}
