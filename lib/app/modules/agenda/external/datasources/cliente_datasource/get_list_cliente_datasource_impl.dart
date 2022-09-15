import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../core/utils.dart';
import '../../../domain/errors/cliente_errors/errors_cliente.dart';
import '../../../infra/datasources/cliente_datasources_interfaces/i_get_list_cliente_datasource.dart';
import '../../../infra/models/cliente_model.dart';

class GetListClienteDatasource implements IGetListClienteDatasource {
  final http.Client _client;

  GetListClienteDatasource(this._client);

  @override
  Future<List<ClienteModel>> getClientes() async {
    final response =
        await _client.get(Uri.parse('${Utils.baseUrl}/clientes'), headers: {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json; charset=utf-8'
    }).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      return _createListCliente(response.body);
    } else {
      throw GetListClienteException('Não foi possível realizar a requisição');
    }
  }

  List<ClienteModel> _createListCliente(String json) {
    return List<Map<String, dynamic>>.from(jsonDecode(json))
        .map((e) => ClienteModel.fromMap(e))
        .toList();
  }
}
