import 'package:air_ports/logic/cubit/cityCubit/city_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    Key? key,
  }) : super(key: key);
  TextEditingController _cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityCubit, CityState>(
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
                          .read<CityCubit>()
                          .selectCity(_cityController.text);
                    },
                    icon: const Icon(Icons.search))),
          ),
        );
      },
    );
  }
}
