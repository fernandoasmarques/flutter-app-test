import 'package:http/http.dart' as http;

import '../../../../../core/utils.dart';
import '../../../domain/errors/cliente_errors/errors_cliente.dart';
import '../../../infra/datasources/cliente_datasources_interfaces/i_delete_cliente_datasource.dart';

class DeleteClienteDatasourceImpl implements IDeleteClienteDatasource {
  final http.Client _client;

  DeleteClienteDatasourceImpl(this._client);

  @override
  Future<bool> deleteCliente({required int id}) async {
    final response =
        await _client.delete(Uri.parse('${Utils.baseUrl}/clientes/$id'), headers: {
      'Access-Control-Allow-Origin': '*',
    }).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw DeleteClienteException('Não foi possível deletar o cliente $id');
    }
  }
}
