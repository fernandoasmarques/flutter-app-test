import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infra/models/endereco_model.dart';
import '../../controllers/cliente_controller.dart';
import '../../controllers/endereco_controller.dart';

class EnderecoPageForm extends StatelessWidget {
  EnderecoPageForm({Key? key})
      : endereco = Get.arguments,
        super(key: key);

  final EnderecoModel? endereco;
  final _formKey = GlobalKey<FormState>();
  final _controllerEndereco = Get.find<EnderecoController>();
  final _controllerCliente = Get.find<ClienteController>();

  @override
  Widget build(BuildContext context) {
    final listControllers = <String, TextEditingController>{
      "Nome Local": TextEditingController(text: endereco?.nomeLocal ?? ''),
      "Logradouro": TextEditingController(text: endereco?.logradouro ?? ''),
      "Número": TextEditingController(text: endereco?.numero ?? ''),
      "Bairro": TextEditingController(text: endereco?.bairro ?? ''),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(endereco?.nomeLocal ?? 'Novo endereço'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ...List.generate(
                listControllers.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite algum texto';
                      }
                      return null;
                    },
                    controller: listControllers.values.elementAt(index),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: listControllers.keys.elementAt(index),
                    ),
                  ),
                ),
                growable: false,
              ),
              SizedBox(
                width: double.maxFinite,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Salvo!')),
                      );
                      _controllerEndereco.createEndereco(
                          EnderecoModel(
                              clienteId: _controllerCliente.clienteId!,
                              nomeLocal:
                                  listControllers.values.elementAt(0).text,
                              logradouro:
                                  listControllers.values.elementAt(1).text,
                              numero: listControllers.values.elementAt(2).text,
                              possuiNumero: true,
                              bairro: listControllers.values.elementAt(3).text),
                          id: endereco?.id);
                      Get.back();
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
