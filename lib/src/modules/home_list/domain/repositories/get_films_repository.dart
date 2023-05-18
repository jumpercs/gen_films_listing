import 'package:gen_films_listing/src/modules/home_list/domain/models/dtos/film_dto.dart';

abstract class GetFilmsRepository {
  Future<List<FilmDto>> call();

  Future<List<FilmDto>> getOnlineFilms();
}
