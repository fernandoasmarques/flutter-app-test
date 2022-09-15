import 'package:dartz/dartz.dart';

import '../../errors/endereco_errors/errors_endereco.dart';
import '../../repositories/endereco_repository/i_delete_endereco_repository.dart';

abstract class IDeleteEnderecoUsecase {
  Future<Either<DeleteEnderecoException, bool>> call(int id);
}

class DeleteEnderecoUsecaseImpl implements IDeleteEnderecoUsecase {
  final IDeleteEnderecoRepository _repository;

  DeleteEnderecoUsecaseImpl(this._repository);

  @override
  Future<Either<DeleteEnderecoException, bool>> call(int id) {
    return _repository.deleteEndereco(id);
  }
}
