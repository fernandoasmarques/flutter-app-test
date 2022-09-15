import 'package:flutter/material.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield(
      {Key? key, required this.hint, required this.onChange})
      : super(key: key);

  final String hint;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onChange,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black)),
        ),
      ),
    );
  }
}
