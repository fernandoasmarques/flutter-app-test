import 'package:flutter/material.dart';

class ListEnderecoError extends StatelessWidget {
  final String? exceptionMessage;
  const ListEnderecoError({Key? key, required this.exceptionMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181c1f),
      body: Center(
        child: Text(
          exceptionMessage ?? 'Não foi possível o carregamento.',
        ),
      ),
    );
  }
}
