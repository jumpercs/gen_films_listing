import 'package:gen_films_listing/src/modules/home_list/shared/response/response_presentation.dart';

abstract class GetFilmsUseCase {
  Future<ResponseEither> call();

  Future<ResponseEither> getOnlineFilms();
}
