import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_bindings.dart';
import 'modules/agenda/agenda_bindings.dart';
import 'modules/agenda/presenter/pages/cliente_page/cliente_page.dart';
import 'modules/agenda/presenter/pages/cliente_page/cliente_page_form.dart';
import 'modules/agenda/presenter/pages/endereco_page/endereco_page.dart';
import 'modules/agenda/presenter/pages/endereco_page/endereco_page_form.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      initialRoute: '/clientes',
      getPages: [
        GetPage(
          name: '/clientes',
          page: () => ClientePage(),
          binding: AgendaBindings(),
          children: [
            GetPage(
                name: '/form',
                page: () => ClientePageForm(),
                binding: AgendaBindings())
          ],
          transition: Transition.downToUp,
        ),
        GetPage(
          name: '/enderecos',
          page: () => EnderecoPage(),
          children: [
            GetPage(
                name: '/form',
                page: () => EnderecoPageForm(),
                binding: AgendaBindings())
          ],
          transition: Transition.downToUp,
          binding: AgendaBindings(),
        ),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
