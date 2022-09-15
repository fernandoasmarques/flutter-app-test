import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Cliente extends Equatable {
  final int? id;
  final String nome;
  final DateTime dataNascimento;
  final String telefone;
  final String email;

  const Cliente({
    required this.id,
    required this.nome,
    required this.dataNascimento,
    required this.telefone,
    required this.email,
  });

  @override
  List<Object?> get props => [nome, dataNascimento];

  int get idade {
    final hoje = DateTime.now();
    final mes = hoje.month - dataNascimento.month;
    var idade = hoje.year - dataNascimento.year;

    if (mes < 0 || (mes == 0 && hoje.day < dataNascimento.day)) idade--;
    return idade;
  }

  String get formattedDataNasc => DateFormat('dd/MM/yyyy').format(dataNascimento);
}
