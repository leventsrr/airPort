import 'package:air_ports/logic/cubit/cityCubit/city_cubit.dart';
import 'package:flutter/material.dart';

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
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
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
