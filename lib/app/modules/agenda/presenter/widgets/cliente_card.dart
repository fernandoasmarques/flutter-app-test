import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cliente_controller.dart';

class ClienteCard extends StatelessWidget {
  ClienteCard({Key? key, required this.index}) : super(key: key);

  final int index;
  final _controller = Get.find<ClienteController>();

  @override
  Widget build(BuildContext context) {
    final cliente = _controller.getClienteByIndex(index);

    return InkWell(
      onTap: () {
        _controller.setIndex = index;
        Get.toNamed("/enderecos");
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Nome: ${cliente.nome}'),
            const SizedBox(height: 5),
            Text('Nascimento: ${cliente.formattedDataNasc}'),
            const SizedBox(height: 5),
            Text('Idade: ${cliente.idade} anos'),
            const SizedBox(height: 5),
            Text('E-mail: ${cliente.email}'),
            const SizedBox(height: 5),
            Text('Telefone: ${cliente.telefone.substring(2)}'),
            const SizedBox(height: 5),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.toNamed("/clientes/form", arguments: cliente);
                    },
                    icon: const Icon(Icons.edit)),
                const SizedBox(width: 5),
                IconButton(
                    onPressed: () {
                      _controller.deleteCliente(cliente.id!);
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
