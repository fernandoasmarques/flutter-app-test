import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tivit_test/app/modules/agenda/infra/datasources/cliente_datasources_interfaces/i_create_cliente_datasource.dart';
import 'package:tivit_test/app/modules/agenda/infra/models/cliente_model.dart';

import '../../../../../core/utils.dart';
import '../../../domain/errors/cliente_errors/errors_cliente.dart';

class CreateClienteDatasourceImpl implements ICreateClienteDatasource {
  final http.Client _client;

  CreateClienteDatasourceImpl(this._client);

  @override
  Future<bool> createCliente(ClienteModel clienteModel, int? id) async {
    final response = id == null
        ? await _client
            .post(Uri.parse('${Utils.baseUrl}/clientes'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(clienteModel.toJson()))
            .timeout(const Duration(seconds: 10))
        : await _client
            .put(Uri.parse('${Utils.baseUrl}/clientes/$id'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(clienteModel.toJson()))
            .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw CreateClienteException(
          'Não foi possível criar/atualizar o cliente.');
    }
  }
}
