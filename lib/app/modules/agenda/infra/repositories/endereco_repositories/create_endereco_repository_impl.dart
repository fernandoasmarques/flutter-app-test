import 'package:dartz/dartz.dart';

import '../../../domain/errors/endereco_errors/errors_endereco.dart';
import '../../../domain/repositories/endereco_repository/i_create_endereco_repository.dart';
import '../../datasources/endereco_datasources_interfaces/i_create_endereco_datasource.dart';
import '../../models/endereco_model.dart';

class CreateEnderecoRepositoryImpl implements ICreateEnderecoRepository {
  final ICreateEnderecoDatasource _datasource;

  CreateEnderecoRepositoryImpl(this._datasource);

  @override
  Future<Either<CreateEnderecoException, bool>> createEndereco(
      EnderecoModel enderecoModel, int? id) async {
    try {
      return Right(await _datasource.createEndereco(enderecoModel, id));
    } on CreateEnderecoException catch (e) {
      return Left(e);
    }
  }
}
