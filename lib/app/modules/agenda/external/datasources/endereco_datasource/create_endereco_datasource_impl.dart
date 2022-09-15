import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../core/utils.dart';
import '../../../domain/errors/endereco_errors/errors_endereco.dart';
import '../../../infra/datasources/endereco_datasources_interfaces/i_create_endereco_datasource.dart';
import '../../../infra/models/endereco_model.dart';

class CreateEnderecoDatasourceImpl implements ICreateEnderecoDatasource {
  final http.Client _client;

  CreateEnderecoDatasourceImpl(this._client);

  @override
  Future<bool> createEndereco(EnderecoModel enderecoModel, int? id) async {
    final response = id == null
        ? await _client
            .post(Uri.parse('${Utils.baseUrl}/enderecos'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(enderecoModel.toJson()))
            .timeout(const Duration(seconds: 10))
        : await _client
            .put(Uri.parse('${Utils.baseUrl}/enderecos/$id'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(enderecoModel.toJson()))
            .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw CreateEnderecoException(
          'Não foi possível criar/atualizar o endereco.');
    }
  }
}
