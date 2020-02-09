part of 'singleuser_bloc.dart';

@immutable
abstract class SingleuserState {}

class SingleuserInitial extends SingleuserState {}

class SingleuserLoading extends SingleuserState {}

class SingeluserLoaded extends SingleuserState {
  final Response<User> user;

  SingeluserLoaded({@required this.user});
}

class SingeluserError extends SingleuserState {}
