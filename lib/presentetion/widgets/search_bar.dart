import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            fillColor: Colors.transparent,
            border: const OutlineInputBorder(),
            suffixIcon:
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))),
      ),
    );
  }
}
