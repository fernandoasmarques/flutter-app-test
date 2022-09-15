import 'package:dartz/dartz.dart';
import 'package:tivit_test/app/modules/agenda/domain/errors/endereco_errors/errors_endereco.dart';
import 'package:tivit_test/app/modules/agenda/domain/repositories/endereco_repository/i_delete_endereco_repository.dart';

import '../../datasources/endereco_datasources_interfaces/i_delete_endereco_datasource.dart';

class DeleteEnderecoRepositoryImpl implements IDeleteEnderecoRepository {
  final IDeleteEnderecoDatasource _datasource;

  DeleteEnderecoRepositoryImpl(this._datasource);

  @override
  Future<Either<DeleteEnderecoException, bool>> deleteEndereco(int id) async {
    try {
      return Right(await _datasource.deleteEndereco(id));
    } on DeleteEnderecoException catch (e) {
      return Left(e);
    }
  }
}
