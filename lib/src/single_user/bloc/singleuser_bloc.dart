import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_flutter/src/model/User.dart';
import 'package:chopper_flutter/src/service/ApiService.dart';
import 'package:meta/meta.dart';

part 'singleuser_event.dart';
part 'singleuser_state.dart';

class SingleuserBloc extends Bloc<SingleuserEvent, SingleuserState> {
  @override
  SingleuserState get initialState => SingleuserInitial();

  @override
  Stream<SingleuserState> mapEventToState(SingleuserEvent event) async* {
    if (event is Fetch) {
      yield SingleuserLoading();

      try {
        final Response<User> user =
            await ApiService.create().getSingleUser(event.id);
        yield SingeluserLoaded(user: user);
      } catch (_) {
        yield SingeluserError();
      }
    }
  }
}
