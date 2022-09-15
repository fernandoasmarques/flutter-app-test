import 'package:http/http.dart' as http;

import '../../../../../core/utils.dart';
import '../../../domain/errors/endereco_errors/errors_endereco.dart';
import '../../../infra/datasources/endereco_datasources_interfaces/i_delete_endereco_datasource.dart';

class DeleteEnderecoDatasourceImpl implements IDeleteEnderecoDatasource {
  final http.Client _client;

  DeleteEnderecoDatasourceImpl(this._client);

  @override
  Future<bool> deleteEndereco(int id) async {
    final response = await _client
        .delete(Uri.parse('${Utils.baseUrl}/enderecos/$id'), headers: {
      'Access-Control-Allow-Origin': '*',
    }).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw DeleteEnderecoException('Não foi possível deletar o endereço $id');
    }
  }
}
