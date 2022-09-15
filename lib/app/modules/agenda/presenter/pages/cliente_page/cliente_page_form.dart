import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../infra/models/cliente_model.dart';
import '../../controllers/cliente_controller.dart';

class ClientePageForm extends StatelessWidget {
  ClientePageForm({Key? key})
      : cliente = Get.arguments,
        super(key: key);

  final ClienteModel? cliente;
  final _formKey = GlobalKey<FormState>();
  final _controllerCliente = Get.find<ClienteController>();

  @override
  Widget build(BuildContext context) {
    final listControllers = <String, TextEditingController>{
      "Nome": TextEditingController(text: cliente?.nome ?? ''),
      "Nascimento": TextEditingController(
          text: formatDate(cliente?.dataNascimento ?? DateTime.now())),
      "E-mail": TextEditingController(text: cliente?.email ?? ''),
      "Telefone": TextEditingController(text: cliente?.telefone ?? ''),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(cliente?.nome ?? 'Novo cliente'),
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
                  child: index == 1
                      ? TextFormField(
                          readOnly: true,
                          onTap: () async {
                            _controllerCliente.setDate = await showDatePicker(
                              context: context,
                              initialDate:
                                  cliente?.dataNascimento ?? DateTime.now(),
                              firstDate: DateTime(1920),
                              lastDate: DateTime(2025),
                            );
                            listControllers.values.elementAt(1).text =
                                formatDate(_controllerCliente.getDate);
                          },
                          controller: listControllers.values.elementAt(index),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: listControllers.keys.elementAt(index),
                          ),
                        )
                      : TextFormField(
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
                      _controllerCliente.createCliente(
                          ClienteModel(
                            nome: listControllers.values.elementAt(0).text,
                            dataNascimento: _controllerCliente.getDate,
                            email: listControllers.values.elementAt(2).text,
                            telefone: listControllers.values.elementAt(3).text,
                          ),
                          id: cliente?.id);
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

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
