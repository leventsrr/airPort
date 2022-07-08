import 'package:air_ports/data/models/airport_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/services/get_airport.dart';

part 'city_state.dart';

class AirportCubit extends Cubit<AirportState> {
  AirPortRequest _airPortRequest = AirPortRequest();
  AirportCubit() : super(AirportNotSelected());

  void selectCity(String _selectedCity) async {
    if (!_selectedCity.isEmpty) {
      List<Item>? _airPorts =
          await _airPortRequest.getAirportInformation(_selectedCity);
      emit(AirportSelected(airportName: _airPorts));
    }
  }
}
