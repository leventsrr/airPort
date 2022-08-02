import 'package:air_ports/logic/cubit/cityCubit/airport_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    Key? key,
  }) : super(key: key);
  TextEditingController _cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AirportCubit, AirportState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _cityController,
            decoration: InputDecoration(
                fillColor: Colors.transparent,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: () {
                      context
                          .read<AirportCubit>()
                          .selectAirport(_cityController.text);
                    },
                    icon: const Icon(Icons.search))),
          ),
        );
      },
    );
  }
}
