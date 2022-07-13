import 'package:air_ports/logic/cubit/LogInCubit/log_in_cubit.dart';
import 'package:air_ports/logic/cubit/cityCubit/airport_cubit.dart';
import 'package:air_ports/presentetion/screens/home_page.dart';
import 'package:air_ports/presentetion/screens/log_in_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/internetCubit/innternet_cubit.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  const MyApp({required this.connectivity});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(connectivity: connectivity)),
        BlocProvider<AirportCubit>(create: (context) => AirportCubit()),
        BlocProvider<LogInCubit>(create: (context) => LogInCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider.value(
          value: LogInCubit(),
          child: LogInPage(),
        ),
      ),
    );
  }
}
