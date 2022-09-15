import 'package:tivit_test/app/modules/agenda/domain/errors/cliente_errors/errors_cliente.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/repositories/cliente_repository/i_delete_cliente_repository.dart';
import '../../datasources/cliente_datasources_interfaces/i_delete_cliente_datasource.dart';


class DeleteClienteRepositoryImpl implements IDeleteClienteRepository {
  final IDeleteClienteDatasource _datasource;

  DeleteClienteRepositoryImpl(this._datasource);

  @override
  Future<Either<DeleteClienteException, bool>> deleteCliente(
      {required int idCliente}) async {
    try {
      return Right(await _datasource.deleteCliente(id: idCliente));
    } on DeleteClienteException catch (e) {
      return Left(e);
    }
  }
}
