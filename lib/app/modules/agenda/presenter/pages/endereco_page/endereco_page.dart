import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/endereco_controller.dart';
import 'states/listendereco_error.dart';
import 'states/listendereco_loading.dart';
import 'states/listendereco_success.dart';

class EnderecoPage extends StatelessWidget {
  EnderecoPage({
    Key? key,
  }) : super(key: key);

  final _controller = Get.find<EnderecoController>();

  @override
  Widget build(BuildContext context) {
    return _controller.obx((state) {
      return ListEnderecoSuccess();
    },
        onLoading: const ListEnderecoLoading(),
        onError: (errorMessage) =>
            ListEnderecoError(exceptionMessage: errorMessage));
  }
}
