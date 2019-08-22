import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_flutter/src/model/User.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserState extends Equatable {
  UserState([List props = const []]) : super(props);
}

class InitialUserState extends UserState {}

class LoadingUserState extends UserState {}

class LoadedUserState extends UserState {
  final Response<BuiltList<User>> user;

  LoadedUserState({@required this.user});
}

class ErrorUserSate extends UserState {}
