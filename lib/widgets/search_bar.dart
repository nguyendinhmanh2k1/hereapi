import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function(String) onTextChanged;

  const SearchBar({required this.onTextChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search address...',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: onTextChanged,
      ),
    );
  }
}
