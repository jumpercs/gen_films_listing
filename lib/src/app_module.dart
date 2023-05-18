import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen_films_listing/src/modules/home_list/shared/http/http_client.dart';

import 'modules/home_list/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    $HttpClientAdapter,
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
  ];
}
