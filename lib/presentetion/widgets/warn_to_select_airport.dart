import 'package:flutter/material.dart';

class WarnToSelectAirport extends StatelessWidget {
  const WarnToSelectAirport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/airport.png'),
        Text('Please Select The Airport'),
      ],
    );
  }
}
