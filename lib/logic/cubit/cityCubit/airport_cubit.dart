import 'package:air_ports/data/models/airport_details_model.dart';
import 'package:air_ports/data/models/airport_model.dart';
import 'package:air_ports/presentetion/screens/airpot_details_page.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/services/get_airport.dart';

part 'airport_state.dart';

class AirportCubit extends Cubit<AirportState> {
  AirPortRequest _airPortRequest = AirPortRequest();

  AirportCubit() : super(AirportNotSelected());

  void selectAirport(String _selectedAirport) async {
    if (!_selectedAirport.isEmpty) {
      List<Item>? _airPorts =
          await _airPortRequest.getAirportInformation(_selectedAirport);

      emit(AirportSelected(airportName: _airPorts));
    }
  }

  void getAirportDetails(String icaoCode) async {
    List? airPortDetails = await _airPortRequest.getAirportDetails(icaoCode);

    emit(AirportSelected(airportDetails: airPortDetails));
  }
}
