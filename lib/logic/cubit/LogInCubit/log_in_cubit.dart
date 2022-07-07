import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(UnsuccessfulLogin());

  void successfulLogIn(String email, String password) {
    if (email == "test@netcad.com" && password == "Ntest!*") {
      emit(SuccessfulLogin());
    }
  }
}
