part of 'city_cubit.dart';

@immutable
abstract class AirportState {}

class AirportNotSelected extends AirportState {}

class AirportSelected extends AirportState {
  List<Item>? airportName;
  AirportSelected({required this.airportName});
}
