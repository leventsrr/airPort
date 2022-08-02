part of 'innternet_cubit.dart';

@immutable
abstract class InternetState {}

class InnternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  InternetConnected({required this.connectionType});
}

class InnternetDisconnected extends InternetState {}
