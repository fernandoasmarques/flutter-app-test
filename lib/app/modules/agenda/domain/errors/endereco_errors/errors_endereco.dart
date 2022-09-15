class CreateEnderecoException implements Exception {
  final String message;

 CreateEnderecoException(this.message);

  @override
  String toString() => 'Erro ao criar/moficicar endereço. Mensagem: $message';
}

class GetListEnderecoException implements Exception {
  final String message;

 GetListEnderecoException(this.message);

  @override
  String toString() => 'Erro ao buscar endereços. Mensagem: $message';
}

class DeleteEnderecoException implements Exception {
  final String message;

 DeleteEnderecoException(this.message);

  @override
  String toString() => 'Erro ao buscar endereços. Mensagem: $message';
}
