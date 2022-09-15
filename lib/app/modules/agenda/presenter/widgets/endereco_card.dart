import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/endereco_controller.dart';

class EnderecoCard extends StatelessWidget {
  EnderecoCard({Key? key, required this.index}) : super(key: key);

  final int index;
  final _controller = Get.find<EnderecoController>();

  @override
  Widget build(BuildContext context) {
    final endereco = _controller.getEnderecoByIndex(index);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nome: ${endereco.nomeLocal}'),
              const SizedBox(height: 5),
              Text('Logradouro: ${endereco.logradouro}'),
              const SizedBox(height: 5),
              Text('Número: ${endereco.numero}'),
              const SizedBox(height: 5),
              Text('Bairro: ${endereco.bairro}'),
              const SizedBox(height: 5),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.toNamed("/enderecos/form", arguments: endereco);
                      },
                      icon: const Icon(Icons.edit)),
                  const SizedBox(width: 5),
                  IconButton(
                      onPressed: () {
                        _controller.deleteEndereco(endereco.id!);
                      },
                      icon: const Icon(Icons.delete))
                ],
              ),
            ]),
      ),
    );
  }
}
