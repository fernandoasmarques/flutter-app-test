import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tivit_test/app/modules/agenda/presenter/widgets/search_textfield.dart';

import '../../../controllers/cliente_controller.dart';
import '../../../widgets/cliente_card.dart';

class ListClienteSuccess extends StatelessWidget {
  ListClienteSuccess({
    Key? key,
  }) : super(key: key);

  final _controller = Get.find<ClienteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.person_add_rounded),
        onPressed: () {
          Get.toNamed("/clientes/form");
        },
      ),
      body: Obx(() {
        return Column(
          children: [
            SearchTextfield(
              hint: 'Nome cliente',
              onChange: _controller.searchCliente,
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: CustomScrollBehavior(),
                child: RefreshIndicator(
                  onRefresh: _controller.getListCliente,
                  child: ListView.builder(
                    itemCount: _controller.listSearch.length,
                    itemBuilder: (context, index) {
                      return ClienteCard(index: index);
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
