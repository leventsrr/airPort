import 'package:flutter/material.dart';
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
          Map(),
          ResultsSheet(),
        ],
      ),
    );
  }
}
