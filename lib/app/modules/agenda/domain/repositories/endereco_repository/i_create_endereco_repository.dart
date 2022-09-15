import 'package:dartz/dartz.dart';

import '../../../infra/models/endereco_model.dart';
import '../../errors/endereco_errors/errors_endereco.dart';

abstract class ICreateEnderecoRepository {
  Future<Either<CreateEnderecoException, bool>> createEndereco(
      EnderecoModel enderecoModel, int? id);
}
