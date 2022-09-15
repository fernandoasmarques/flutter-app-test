import 'package:dartz/dartz.dart';

import '../../../infra/models/cliente_model.dart';
import '../../errors/cliente_errors/errors_cliente.dart';
import '../../repositories/cliente_repository/i_create_cliente_repository.dart';

abstract class ICreateClienteUsecase {
  Future<Either<CreateClienteException, bool>> createCliente(
      {required ClienteModel clienteModel, int? id});
}

class CreateClienteUsecaseImpl implements ICreateClienteUsecase {
  final ICreateClienteRepository _repository;

  CreateClienteUsecaseImpl(this._repository);

  @override
  Future<Either<CreateClienteException, bool>> createCliente(
      {required ClienteModel clienteModel, int? id}) {
    return _repository.createCliente(clienteModel, id);
  }
}
