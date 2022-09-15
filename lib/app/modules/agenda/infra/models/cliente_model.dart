import 'dart:convert';

import '../../domain/entities/cliente.dart';

class ClienteModel extends Cliente {
  const ClienteModel(
      {super.id,
      required super.nome,
      required super.dataNascimento,
      required super.telefone,
      required super.email});

  factory ClienteModel.fromMap(Map<String, dynamic> map) {
    return ClienteModel(
      id: map['id'],
      nome: map['nome'],
      dataNascimento: DateTime.parse(map['dataNascimento']),
      telefone: map['telefone'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'nome': nome,
      'dataNascimento': '${dataNascimento.toIso8601String()}Z',
      'telefone': telefone,
      'email': email,
    };
  }

  factory ClienteModel.fromJson(String source) =>
      ClienteModel.fromMap(json.decode(source));
}
