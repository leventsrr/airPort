import 'package:air_ports/logic/cubit/cityCubit/airport_cubit.dart';
import 'package:air_ports/presentetion/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AirportDetails extends StatelessWidget {
  String icaoCode;
  AirportDetails({required this.icaoCode});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AirportCubit>(context).getAirportDetails(icaoCode);
    return BlocBuilder<AirportCubit, AirportState>(
      builder: (context, state) {
        return state is AirportSelected
            ? Scaffold(
                appBar: AppBar(
                  title: Text('You Can Visit Those Airport From Here'),
                  automaticallyImplyLeading: false,
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (builder) => HomePage()),
                    );
                  },
                  child: (Icon(Icons.close)),
                ),
                body: state.airportDetails == null
                    ? Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.local_airport),
                                  title: Text(state
                                      .airportDetails![index].destination.name),
                                  subtitle: Text(state.airportDetails![index]
                                      .destination.municipalityName),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(state.airportDetails![index]
                                        .destination.countryCode),
                                    const SizedBox(width: 8),
                                    Text(
                                        'Daily Avarage Flights:${state.airportDetails![index].averageDailyFlights}'),
                                    const SizedBox(width: 8),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemCount: state.airportDetails!.length))
            : Center(
                child: Text('Selecet the airport'),
              );
      },
    );
  }
}
