import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_flutter/src/model/User.dart';
import 'package:chopper_flutter/src/service/ApiService.dart';
import './bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => InitialUserState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is Fetch) {
      yield LoadingUserState();
    }
    try {
      final Response<BuiltList<User>> user =
          await ApiService.create().getUser();
      yield LoadedUserState(user: user);
    } catch (_) {
      yield ErrorUserSate();
    }
  }
}
