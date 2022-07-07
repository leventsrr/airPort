import 'package:air_ports/logic/cubit/internetCubit/innternet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/map.dart';
import '../widgets/results_sheet.dart';
import '../widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        children: [
          SearchBar(),
          BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
              if (state is InternetConnected) {
                return Map();
              } else {
                return Text('Internet Is Disconnected');
              }
            },
          ),
          ResultsSheet(),
        ],
      ),
    );
  }
}
