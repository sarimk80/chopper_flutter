part of 'singleuser_bloc.dart';

@immutable
abstract class SingleuserEvent {}

class Fetch extends SingleuserEvent {
  final int id;

  Fetch({@required this.id});
}
