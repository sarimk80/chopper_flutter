import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'User.g.dart';

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  int get id; //": 1,
  String get name; //": "Leanne Graham",
  String get username; //": "Bret",
  String get email; //": "Sincere@april.biz",
  Address get address;

  String get phone; //": "1-770-736-8031 x56442",
  String get website; //": "hildegard.org",
  Company get company;

  User._();

  factory User([void Function(UserBuilder) updates]) = _$User;
}

abstract class Address implements Built<Address, AddressBuilder> {
  static Serializer<Address> get serializer => _$addressSerializer;

  String get street; //": "Kulas Light",
  String get suite; //": "Apt. 556",
  String get city; //": "Gwenborough",
  String get zipcode; //": "92998-3874",
  Geo get geo;

// ": {
//  "lat": "-37.3159",
//  "lng": "81.1496"
  Address._();

  factory Address([void Function(AddressBuilder) updates]) = _$Address;
}

abstract class Geo implements Built<Geo, GeoBuilder> {
  static Serializer<Geo> get serializer => _$geoSerializer;

  String get lat; //": "-37.3159",
  String get lng; //": "81.1496"
  Geo._();

  factory Geo([void Function(GeoBuilder) updates]) = _$Geo;
}

abstract class Company implements Built<Company, CompanyBuilder> {

  static Serializer<Company> get serializer => _$companySerializer;

  String get name; //": "Romaguera-Crona",
  String get catchPhrase; //": "Multi-layered client-server neural-net",
  String get bs; //": "harness real-time e-markets"
  Company._();

  factory Company([void Function(CompanyBuilder) updates]) = _$Company;
}
