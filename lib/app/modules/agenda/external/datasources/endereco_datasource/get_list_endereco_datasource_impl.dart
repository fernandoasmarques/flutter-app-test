import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../core/utils.dart';
import '../../../domain/errors/endereco_errors/errors_endereco.dart';
import '../../../infra/datasources/endereco_datasources_interfaces/i_get_list_endereco_datasource.dart';
import '../../../infra/models/endereco_model.dart';

class GetListEnderecoDatasourceImpl implements IGetListEnderecoDatasource {
  final http.Client _client;

  GetListEnderecoDatasourceImpl(this._client);

  @override
  Future<List<EnderecoModel>> getEnderecos(int clienteId) async {
    final response = await _client.get(
        Uri.parse('${Utils.baseUrl}/clientes/$clienteId/enderecos'),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Content-Type': 'application/json; charset=utf-8'
        }).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      return _createListEndereco(response.body);
    } else {
      throw GetListEnderecoException('Não foi possível realizar a requisição');
    }
  }

  List<EnderecoModel> _createListEndereco(String json) {
    return List<Map<String, dynamic>>.from(jsonDecode(json))
        .map((e) => EnderecoModel.fromMap(e))
        .toList();
  }
}
