import '../../models/cliente_model.dart';

abstract class IGetListClienteDatasource {
  Future<List<ClienteModel>> getClientes();
}
