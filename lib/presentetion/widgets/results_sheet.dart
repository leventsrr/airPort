import 'package:air_ports/logic/cubit/cityCubit/airport_cubit.dart';
import 'package:air_ports/presentetion/screens/airpot_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsSheet extends StatelessWidget {
  AirportSelected airportState;

  ResultsSheet({required this.airportState});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => BlocProvider.value(
                              value: BlocProvider.of<AirportCubit>(context),
                              child: AirportDetails(
                                  icaoCode:
                                      airportState.airportName![index].icao),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 9,
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(airportState.airportName![index].name),
                                  SizedBox(width: 10),
                                  Icon(Icons.airplanemode_active),
                                ],
                              ),
                              Text(airportState.airportName![index].countryCode)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: airportState.airportName!.length),
            );
          },
        );
      },
      child: const Icon(Icons.local_airport),
    );
  }
}
