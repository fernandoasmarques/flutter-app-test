import 'package:flutter/material.dart';

class ListClienteError extends StatelessWidget {
  final String? exceptionMessage;
  const ListClienteError({Key? key, required this.exceptionMessage})
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
