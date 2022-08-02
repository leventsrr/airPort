import 'package:air_ports/logic/cubit/cityCubit/airport_cubit.dart';
import 'package:air_ports/logic/cubit/internetCubit/innternet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/map.dart';
import '../widgets/results_sheet.dart';
import '../widgets/search_bar.dart';
import '../widgets/warn_to_select_airport.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SearchBar(),
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected) {
                  return BlocBuilder<AirportCubit, AirportState>(
                    builder: (context, airportState) {
                      if (airportState is AirportSelected) {
                        return airportState.airportName == null
                            ? WarnToSelectAirport()
                            : MapPage(
                                airportSelected: airportState,
                              );
                      } else {
                        return WarnToSelectAirport();
                      }
                    },
                  );
                } else {
                  return Text('Internet Is Disconnected');
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: BlocBuilder<AirportCubit, AirportState>(
        builder: (context, state) {
          if (state is AirportSelected) {
            return state.airportName == null
                ? Container()
                : ResultsSheet(
                    airportState: state,
                  );
          }
          return Container();
        },
      ),
    );
  }
}
