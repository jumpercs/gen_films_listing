import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen_films_listing/src/modules/home_list/data/repositories/get_films_repository_impl.dart';
import 'package:gen_films_listing/src/modules/home_list/domain/usecases/get_films_usecase_impl.dart';
import 'package:gen_films_listing/src/modules/home_list/external/datasources/get_film_datasource.dart';
import 'package:gen_films_listing/src/modules/home_list/presentation/home/home_controller.dart';

import 'presentation/home/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // External
    $GetFilmsDataSourceImpl,

    // Data
    $GetFilmsRepositoryImpl,

    // Domain
    $GetFilmsUseCaseImpl,

    // Presentation
    $HomeController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
