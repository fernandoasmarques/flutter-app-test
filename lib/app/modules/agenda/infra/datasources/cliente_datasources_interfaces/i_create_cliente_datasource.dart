import '../../models/cliente_model.dart';

abstract class ICreateClienteDatasource {
  Future<bool> createCliente(ClienteModel clienteModel, int? id);
}
