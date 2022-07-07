import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit() : super(CityNotSelected());

  void selectCity(String _selectedCity) =>
      emit(CitySelected(cityName: _selectedCity));
}
