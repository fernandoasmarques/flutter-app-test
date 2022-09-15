import 'package:get/get.dart';

import 'domain/repositories/cliente_repository/i_create_cliente_repository.dart';
import 'domain/repositories/cliente_repository/i_delete_cliente_repository.dart';
import 'domain/repositories/cliente_repository/i_get_list_cliente_repository.dart';
import 'domain/repositories/endereco_repository/i_create_endereco_repository.dart';
import 'domain/repositories/endereco_repository/i_delete_endereco_repository.dart';
import 'domain/repositories/endereco_repository/i_get_list_endereco_repository.dart';
import 'domain/usecases/cliente_usecases/create_novo_cliente_usecase_impl.dart';
import 'domain/usecases/cliente_usecases/delete_cliente_usecase_impl.dart';
import 'domain/usecases/cliente_usecases/get_list_clientes_usecase_impl.dart';
import 'domain/usecases/endereco_usecases/create_endereco_usecase_impl.dart';
import 'domain/usecases/endereco_usecases/delete_endereco_usecase_impl.dart';
import 'domain/usecases/endereco_usecases/get_list_endereco_usecase_impl.dart';
import 'external/datasources/cliente_datasource/create_cliente_datasource_impl.dart';
import 'external/datasources/cliente_datasource/delete_cliente_datasource_impl.dart';
import 'external/datasources/cliente_datasource/get_list_cliente_datasource_impl.dart';
import 'external/datasources/endereco_datasource/create_endereco_datasource_impl.dart';
import 'external/datasources/endereco_datasource/delete_endereco_datasource_impl.dart';
import 'external/datasources/endereco_datasource/get_list_endereco_datasource_impl.dart';
import 'infra/datasources/cliente_datasources_interfaces/i_create_cliente_datasource.dart';
import 'infra/datasources/cliente_datasources_interfaces/i_delete_cliente_datasource.dart';
import 'infra/datasources/cliente_datasources_interfaces/i_get_list_cliente_datasource.dart';
import 'infra/datasources/endereco_datasources_interfaces/i_create_endereco_datasource.dart';
import 'infra/datasources/endereco_datasources_interfaces/i_delete_endereco_datasource.dart';
import 'infra/datasources/endereco_datasources_interfaces/i_get_list_endereco_datasource.dart';
import 'infra/repositories/cliente_repositories/create_cliente_repository_impl.dart';
import 'infra/repositories/cliente_repositories/delete_cliente_repository_impl.dart';
import 'infra/repositories/cliente_repositories/get_list_cliente_repository_impl.dart';
import 'infra/repositories/endereco_repositories/create_endereco_repository_impl.dart';
import 'infra/repositories/endereco_repositories/delete_endereco_repository_impl.dart';
import 'infra/repositories/endereco_repositories/get_list_endereco_repository_impl.dart';
import 'presenter/controllers/cliente_controller.dart';
import 'presenter/controllers/endereco_controller.dart';

class AgendaBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClienteController(Get.find(), Get.find(), Get.find()));
    Get.lazyPut(() => EnderecoController(Get.find(), Get.find(), Get.find()));
    //
    Get.lazyPut<IGetListClientesUsecase>(
        () => GetListClientesUsecaseImpl(Get.find()));
    Get.lazyPut<IGetListClienteRepository>(
        () => GetListClienteRepositoryImpl(Get.find()));
    Get.lazyPut<IGetListClienteDatasource>(
        () => GetListClienteDatasource(Get.find()));
    //
    Get.lazyPut<IDeleteClienteUsecase>(
        () => DeleteClienteUsecaseImpl(Get.find()));
    Get.lazyPut<IDeleteClienteRepository>(
        () => DeleteClienteRepositoryImpl(Get.find()));
    Get.lazyPut<IDeleteClienteDatasource>(
        () => DeleteClienteDatasourceImpl(Get.find()));
    //
    Get.lazyPut<ICreateClienteUsecase>(
        () => CreateClienteUsecaseImpl(Get.find()));
    Get.lazyPut<ICreateClienteRepository>(
        () => CreateClienteRepositoryImpl(Get.find()));
    Get.lazyPut<ICreateClienteDatasource>(
        () => CreateClienteDatasourceImpl(Get.find()));
    //
    Get.lazyPut<IGetListEnderecoUsecase>(
        () => GetListEnderecoUsecaseImpl(Get.find()));
    Get.lazyPut<IGetListEnderecoRepository>(
        () => GetListEnderecoRepositoryImpl(Get.find()));
    Get.lazyPut<IGetListEnderecoDatasource>(
        () => GetListEnderecoDatasourceImpl(Get.find()));
    //
    Get.lazyPut<IDeleteEnderecoUsecase>(
        () => DeleteEnderecoUsecaseImpl(Get.find()));
    Get.lazyPut<IDeleteEnderecoRepository>(
        () => DeleteEnderecoRepositoryImpl(Get.find()));
    Get.lazyPut<IDeleteEnderecoDatasource>(
        () => DeleteEnderecoDatasourceImpl(Get.find()));
    //
    Get.lazyPut<ICreateEnderecoUsecase>(
        () => CreateEnderecoUsecaseImpl(Get.find()));
    Get.lazyPut<ICreateEnderecoRepository>(
        () => CreateEnderecoRepositoryImpl(Get.find()));
    Get.lazyPut<ICreateEnderecoDatasource>(
        () => CreateEnderecoDatasourceImpl(Get.find()));
  }
}
