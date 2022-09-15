import 'package:dartz/dartz.dart';

import '../../../infra/models/endereco_model.dart';
import '../../errors/endereco_errors/errors_endereco.dart';
import '../../repositories/endereco_repository/i_create_endereco_repository.dart';

abstract class ICreateEnderecoUsecase {
  Future<Either<CreateEnderecoException, bool>> call(
      {required EnderecoModel enderecoModel, int? id});
}

class CreateEnderecoUsecaseImpl implements ICreateEnderecoUsecase {
  final ICreateEnderecoRepository _repository;

  CreateEnderecoUsecaseImpl(this._repository);

  @override
  Future<Either<CreateEnderecoException, bool>> call(
      {required EnderecoModel enderecoModel, int? id}) {
    return _repository.createEndereco(enderecoModel, id);
  }
}
