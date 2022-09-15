import 'package:dartz/dartz.dart';

import '../../../domain/entities/cliente.dart';
import '../../../domain/errors/cliente_errors/errors_cliente.dart';
import '../../../domain/repositories/cliente_repository/i_get_list_cliente_repository.dart';
import '../../datasources/cliente_datasources_interfaces/i_get_list_cliente_datasource.dart';

class GetListClienteRepositoryImpl implements IGetListClienteRepository {
  final IGetListClienteDatasource _datasource;

  GetListClienteRepositoryImpl(this._datasource);

  @override
  Future<Either<GetListClienteException, List<Cliente>>> getListCliente() async{
    try {
      return Right(await _datasource.getClientes());
    } on GetListClienteException catch (e) {
      return Left(e);
    }
  }
}
