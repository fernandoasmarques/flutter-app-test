import 'package:tivit_test/app/modules/agenda/domain/errors/cliente_errors/errors_cliente.dart';
import 'package:dartz/dartz.dart';
import 'package:tivit_test/app/modules/agenda/domain/repositories/cliente_repository/i_create_cliente_repository.dart';
import 'package:tivit_test/app/modules/agenda/infra/datasources/cliente_datasources_interfaces/i_create_cliente_datasource.dart';
import 'package:tivit_test/app/modules/agenda/infra/models/cliente_model.dart';

class CreateClienteRepositoryImpl implements ICreateClienteRepository {
  final ICreateClienteDatasource _datasource;

  CreateClienteRepositoryImpl(this._datasource);

  @override
  Future<Either<CreateClienteException, bool>> createCliente(
      ClienteModel clienteModel, int? id) async {
    try {
      return Right(await _datasource.createCliente(clienteModel, id));
    } on CreateClienteException catch (e) {
      return Left(e);
    }
  }
}
