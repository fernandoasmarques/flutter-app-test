import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/cliente_controller.dart';
import '../../../controllers/endereco_controller.dart';
import '../../../widgets/endereco_card.dart';
import '../../../widgets/search_textfield.dart';

class ListEnderecoSuccess extends StatelessWidget {
  ListEnderecoSuccess({
    Key? key,
  }) : super(key: key);

  final _controller = Get.find<EnderecoController>();
  final _controllerCliente = Get.find<ClienteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Endereços de ${_controllerCliente.clienteNome}'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.toNamed("/enderecos/form");
        },
      ),
      body: Obx(() {
        return Column(
          children: [
            SearchTextfield(
              hint: 'Logradouro',
              onChange: _controller.searchEndereco,
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: CustomScrollBehavior(),
                child: RefreshIndicator(
                  onRefresh: _controller.getListEndereco,
                  child: ListView.builder(
                    itemCount: _controller.listSearch.length,
                    itemBuilder: (context, index) {
                      return EnderecoCard(index: index);
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
