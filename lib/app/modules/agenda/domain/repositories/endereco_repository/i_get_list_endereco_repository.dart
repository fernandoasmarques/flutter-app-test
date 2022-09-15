import 'package:dartz/dartz.dart';
import 'package:tivit_test/app/modules/agenda/domain/errors/endereco_errors/errors_endereco.dart';

import '../../entities/endereco.dart';

abstract class IGetListEnderecoRepository {
  Future<Either<GetListEnderecoException, List<Endereco>>> getEnderecos(int clientId);
}
