import 'package:dartz/dartz.dart';

import '../../errors/cliente_errors/errors_cliente.dart';
import '../../repositories/cliente_repository/i_delete_cliente_repository.dart';

abstract class IDeleteClienteUsecase {
  Future<Either<DeleteClienteException, bool>> deleteCliente({required int id});
}

class DeleteClienteUsecaseImpl implements IDeleteClienteUsecase {
  final IDeleteClienteRepository _repository;

  DeleteClienteUsecaseImpl(this._repository);

  @override
  Future<Either<DeleteClienteException, bool>> deleteCliente(
      {required int id}) {
    return _repository.deleteCliente(idCliente: id);
  }
}
