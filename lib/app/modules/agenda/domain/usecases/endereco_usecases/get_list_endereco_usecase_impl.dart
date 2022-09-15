import 'package:dartz/dartz.dart';
import 'package:tivit_test/app/modules/agenda/domain/entities/endereco.dart';

import '../../errors/endereco_errors/errors_endereco.dart';
import '../../repositories/endereco_repository/i_get_list_endereco_repository.dart';

abstract class IGetListEnderecoUsecase {
  Future<Either<GetListEnderecoException, List<Endereco>>> call(
      {required int clientId});
}

class GetListEnderecoUsecaseImpl implements IGetListEnderecoUsecase {
  final IGetListEnderecoRepository _repository;

  GetListEnderecoUsecaseImpl(this._repository);

  @override
  Future<Either<GetListEnderecoException, List<Endereco>>> call(
      {required int clientId}) {
    return _repository.getEnderecos(clientId);
  }
}
