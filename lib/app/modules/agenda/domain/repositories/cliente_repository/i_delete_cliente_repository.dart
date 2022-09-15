import 'package:dartz/dartz.dart';

import '../../errors/cliente_errors/errors_cliente.dart';

abstract class IDeleteClienteRepository {
  Future<Either<DeleteClienteException, bool>> deleteCliente({required int idCliente});
}
