import 'package:equatable/equatable.dart';

class Endereco extends Equatable {
  final int? id;
  final String nomeLocal;
  final String logradouro;
  final String numero;
  final bool possuiNumero;
  final String bairro;
  final int clienteId;

  const Endereco({
    this.id,
    required this.nomeLocal,
    required this.logradouro,
    required this.numero,
    required this.possuiNumero,
    required this.bairro,
    required this.clienteId,
  });

  @override
  List<Object?> get props =>
      [id, nomeLocal, logradouro, numero, possuiNumero, bairro];

  @override
  bool? get stringify => true;
}
