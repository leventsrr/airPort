part of 'city_cubit.dart';

@immutable
abstract class CityState {}

class CityNotSelected extends CityState {}

class CitySelected extends CityState {
  final String airportName;
  CitySelected({required this.airportName});
}
