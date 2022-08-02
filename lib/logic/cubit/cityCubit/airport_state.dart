part of 'airport_cubit.dart';

@immutable
abstract class AirportState {}

class AirportNotSelected extends AirportState {}

class AirportSelected extends AirportState {
  List<Item>? airportName;
  List? airportDetails;
  AirportSelected({this.airportName, this.airportDetails});
}
