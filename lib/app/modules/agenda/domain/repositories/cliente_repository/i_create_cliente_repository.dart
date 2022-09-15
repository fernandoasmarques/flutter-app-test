import 'package:dartz/dartz.dart';

import '../../../infra/models/cliente_model.dart';
import '../../errors/cliente_errors/errors_cliente.dart';

abstract class ICreateClienteRepository {
  Future<Either<CreateClienteException, bool>> createCliente(
      ClienteModel clienteModel, int? id);
}
