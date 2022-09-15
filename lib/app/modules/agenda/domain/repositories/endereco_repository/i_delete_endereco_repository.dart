import 'package:dartz/dartz.dart';

import '../../errors/endereco_errors/errors_endereco.dart';

abstract class IDeleteEnderecoRepository {
  Future<Either<DeleteEnderecoException, bool>> deleteEndereco(int id);
}
