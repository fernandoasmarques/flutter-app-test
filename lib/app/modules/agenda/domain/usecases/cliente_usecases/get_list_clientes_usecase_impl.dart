import 'package:dartz/dartz.dart';
import 'package:tivit_test/app/modules/agenda/domain/entities/cliente.dart';

import '../../errors/cliente_errors/errors_cliente.dart';
import '../../repositories/cliente_repository/i_get_list_cliente_repository.dart';

abstract class IGetListClientesUsecase {
  Future<Either<GetListClienteException, List<Cliente>>> call();
}

class GetListClientesUsecaseImpl implements IGetListClientesUsecase {
  final IGetListClienteRepository _repository;

  GetListClientesUsecaseImpl(this._repository);

  @override
  Future<Either<GetListClienteException, List<Cliente>>> call() =>
      _repository.getListCliente();
}