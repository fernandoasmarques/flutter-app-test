import 'package:flutter/material.dart';

class ListEnderecoLoading extends StatelessWidget {
  const ListEnderecoLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
