import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit() : super(CityNotSelected());

  void selectCity(String _selectedCity) {
    if (!_selectedCity.isEmpty) {
      emit(CitySelected(airportName: _selectedCity));
    }
  }
}
