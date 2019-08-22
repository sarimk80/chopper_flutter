import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_flutter/src/serializers/serializers.dart';

class BuiltValueConverter extends JsonConverter {
  final jsonSerializers =
      (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

  T _deserializer<T>(dynamic value) => jsonSerializers.deserializeWith(
        jsonSerializers.serializerForType(T),
        value,
      );

  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    final jsonRes = super.convertResponse(response);
    final body = _decode<Item>(jsonRes.body);
    return jsonRes.replace<ResultType>(body: body);
  }

  dynamic _decode<T>(entity) {
    if (entity is T) return entity;
    try {
      if (entity is List) return _deserializeListOf<T>(entity);
      return _deserializer<T>(entity);
    } catch (e) {
      print(e);
      return null;
    }
  }

  BuiltList<T> _deserializeListOf<T>(Iterable value) => BuiltList(
        value.map((value) => _deserializer<T>(value)).toList(growable: true),
      );
}
