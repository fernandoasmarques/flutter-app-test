import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cliente_controller.dart';
import 'states/listcliente_error.dart';
import 'states/listcliente_loading.dart';
import 'states/listcliente_success.dart';

class ClientePage extends StatelessWidget {
  ClientePage({
    Key? key,
  }) : super(key: key);

  final _controller = Get.find<ClienteController>();

  @override
  Widget build(BuildContext context) {
    return _controller.obx((listCliente) {
      return ListClienteSuccess();
    },
        onLoading: const ListClienteLoading(),
        onError: (errorMessage) =>
            ListClienteError(exceptionMessage: errorMessage));
  }
}
