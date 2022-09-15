import 'dart:convert';

import '../../domain/entities/endereco.dart';

class EnderecoModel extends Endereco {
  const EnderecoModel({
    super.id,
    required super.nomeLocal,
    required super.logradouro,
    required super.numero,
    required super.possuiNumero,
    required super.bairro,
    required super.clienteId,
  });

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      id: map['id'],
      nomeLocal: map['nomeLocal'],
      logradouro: map['logradouro'],
      numero: map['numero'],
      possuiNumero: map['possuiNumero'],
      bairro: map['bairro'],
      clienteId: map['clienteId']
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'nomeLocal': nomeLocal,
      'logradouro': logradouro,
      'numero': numero,
      'possuiNumero': possuiNumero,
      'bairro': bairro,
      'clienteId': clienteId,
    };
  }

  factory EnderecoModel.fromJson(String source) =>
      EnderecoModel.fromMap(json.decode(source));
}
