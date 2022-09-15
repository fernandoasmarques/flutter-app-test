class GetListClienteException implements Exception {
  final String message;

  GetListClienteException(this.message);

  @override
  String toString() => 'Erro ao buscar a lista de Clientes. Mensagem: $message';
}

class DeleteClienteException implements Exception {
  final String message;

  DeleteClienteException(this.message);

  @override
  String toString() => 'Erro ao deletar cliente. Mensagem: $message';
}

class CreateClienteException implements Exception {
  final String message;

  CreateClienteException(this.message);

  @override
  String toString() => 'Erro ao criar novo cliente. Mensagem: $message';
}
