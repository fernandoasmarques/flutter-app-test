import 'package:tivit_test/app/modules/agenda/domain/errors/endereco_errors/errors_endereco.dart';

import 'package:tivit_test/app/modules/agenda/domain/entities/endereco.dart';

import 'package:dartz/dartz.dart';

import '../../../domain/repositories/endereco_repository/i_get_list_endereco_repository.dart';
import '../../datasources/endereco_datasources_interfaces/i_get_list_endereco_datasource.dart';

class GetListEnderecoRepositoryImpl implements IGetListEnderecoRepository {
  final IGetListEnderecoDatasource _datasource;

  GetListEnderecoRepositoryImpl(this._datasource);

  @override
  Future<Either<GetListEnderecoException, List<Endereco>>> getEnderecos(
      int clientId) async {
    try {
      return Right(await _datasource.getEnderecos(clientId));
    } on GetListEnderecoException catch (e) {
      return Left(e);
    }
  }
}
