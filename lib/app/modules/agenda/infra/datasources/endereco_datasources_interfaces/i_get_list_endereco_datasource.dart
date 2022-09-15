import '../../models/endereco_model.dart';

abstract class IGetListEnderecoDatasource {
  Future<List<EnderecoModel>> getEnderecos(int clienteId);
}
