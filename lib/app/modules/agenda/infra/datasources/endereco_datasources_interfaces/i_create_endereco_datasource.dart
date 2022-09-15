import '../../models/endereco_model.dart';

abstract class ICreateEnderecoDatasource {
  Future<bool> createEndereco(EnderecoModel enderecoModel, int? id);
}
