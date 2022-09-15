import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../domain/entities/endereco.dart';
import '../../domain/errors/endereco_errors/errors_endereco.dart';
import '../../domain/usecases/endereco_usecases/create_endereco_usecase_impl.dart';
import '../../domain/usecases/endereco_usecases/delete_endereco_usecase_impl.dart';
import '../../domain/usecases/endereco_usecases/get_list_endereco_usecase_impl.dart';
import '../../infra/models/endereco_model.dart';
import 'cliente_controller.dart';

class EnderecoController extends GetxController
    with StateMixin<Tuple2<List<Endereco>, bool?>> {
  final _listEndereco = <Endereco>[].obs;
  final listSearch = <Endereco>[].obs;
  final IGetListEnderecoUsecase _getListEnderecoUsecase;
  final ICreateEnderecoUsecase _createEnderecoUsecase;
  final IDeleteEnderecoUsecase _deleteEnderecoUsecase;
  final clienteController = Get.find<ClienteController>();

  EnderecoController(
    this._getListEnderecoUsecase,
    this._createEnderecoUsecase,
    this._deleteEnderecoUsecase,
  );

  @override
  void onInit() {
    getListEndereco();
    super.onInit();
  }

  Endereco getEnderecoByIndex(int index) {
    return listSearch[index];
  }

  void searchEndereco(String query) {
    final listQuery = _listEndereco.where((endereco) {
      final logradouro = endereco.logradouro.toLowerCase();
      final search = query.toLowerCase();
      return logradouro.contains(search);
    }).toList();

    listSearch.assignAll(listQuery);
  }

  Future<void> getListEndereco() async {
    final result = await _getListEnderecoUsecase(
      clientId: clienteController.clienteId!,
    );
    result.fold(_errorGetEnderecos, _successGetEnderecos);
  }

  Future<void> createEndereco(EnderecoModel endereco, {int? id}) async {
    final result =
        await _createEnderecoUsecase.call(enderecoModel: endereco, id: id);
    result.fold(_errorCreateEndereco, _successCreateEndereco);
    getListEndereco();
  }

  Future<void> deleteEndereco(int id) async {
    await _deleteEnderecoUsecase(id);
    getListEndereco();
  }

  void _successGetEnderecos(List<Endereco> enderecos) {
    _listEndereco.assignAll(enderecos);
    listSearch.assignAll(enderecos);
    change(Tuple2(enderecos, null), status: RxStatus.success());
  }

  void _errorGetEnderecos(GetListEnderecoException exception) {
    change(const Tuple2([], null), status: RxStatus.error(exception.message));
  }

  void _successCreateEndereco(bool state) {
    change(Tuple2(_listEndereco, state), status: RxStatus.success());
  }

  void _errorCreateEndereco(CreateEnderecoException exception) {
    change(Tuple2(_listEndereco, null),
        status: RxStatus.error(exception.message));
  }
}
