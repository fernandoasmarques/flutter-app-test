import 'package:get/get.dart';
import 'package:tivit_test/app/modules/agenda/domain/usecases/cliente_usecases/create_novo_cliente_usecase_impl.dart';
import 'package:tivit_test/app/modules/agenda/domain/usecases/cliente_usecases/delete_cliente_usecase_impl.dart';

import '../../domain/entities/cliente.dart';
import '../../domain/errors/cliente_errors/errors_cliente.dart';
import '../../domain/usecases/cliente_usecases/get_list_clientes_usecase_impl.dart';
import '../../infra/models/cliente_model.dart';

class ClienteController extends GetxController with StateMixin<List<Cliente>> {
  final IGetListClientesUsecase _getListClientesUsecase;
  final IDeleteClienteUsecase _deleteClienteUsecase;
  final ICreateClienteUsecase _clienteUsecase;
  final _listCliente = <Cliente>[].obs;
  final listSearch = <Cliente>[].obs;
  final _rxClienteIndex = 0.obs;
  final _rxDataNasc = DateTime.now().obs;

  ClienteController(this._getListClientesUsecase, this._deleteClienteUsecase,
      this._clienteUsecase);

  @override
  void onInit() {
    getListCliente();
    super.onInit();
  }

  set setIndex(int index) {
    _rxClienteIndex.value = index;
  }

  set setDate(DateTime? date) {
    _rxDataNasc.value = date ?? DateTime.now();
  }

  List<Cliente> get listClientes => _listCliente;

  DateTime get getDate {
    return _rxDataNasc.value;
  }

  void searchCliente(String query) {
    final listQuery = _listCliente.where((cliente) {
      final clienteNome = cliente.nome.toLowerCase();
      final search = query.toLowerCase();
      return clienteNome.contains(search);
    }).toList();

    listSearch.assignAll(listQuery);
  }

  int? get clienteId => _listCliente[_rxClienteIndex.value].id;
  String get clienteNome =>
      _listCliente[_rxClienteIndex.value].nome.split(' ').first;

  Cliente getClienteByIndex(int index) {
    return listSearch[index];
  }

  Future<void> getListCliente() async {
    final result = await _getListClientesUsecase();
    result.fold(_errorGetClientes, _successGetClientes);
  }

  Future<void> deleteCliente(int id) async {
    await _deleteClienteUsecase.deleteCliente(id: id);
    getListCliente();
  }

  void _successGetClientes(List<Cliente> clientes) {
    _listCliente.assignAll(clientes);
    listSearch.assignAll(clientes);
    change(_listCliente, status: RxStatus.success());
  }

  void _errorGetClientes(GetListClienteException exception) {
    change([], status: RxStatus.error(exception.message));
  }

  Future<void> createCliente(ClienteModel cliente, {int? id}) async {
    await _clienteUsecase.createCliente(clienteModel: cliente, id: id);
    getListCliente();
  }
}
