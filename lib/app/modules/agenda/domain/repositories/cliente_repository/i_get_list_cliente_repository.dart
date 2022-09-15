import 'package:dartz/dartz.dart';

import '../../entities/cliente.dart';
import '../../errors/cliente_errors/errors_cliente.dart';

abstract class IGetListClienteRepository {
  Future<Either<GetListClienteException, List<Cliente>>> getListCliente();
}