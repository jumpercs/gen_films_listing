import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen_films_listing/src/modules/home_list/domain/models/dtos/film_dto.dart';
import 'package:gen_films_listing/src/modules/home_list/domain/repositories/get_films_repository.dart';

import '../datasources/get_films_datasource.dart';

final $GetFilmsRepositoryImpl =
    Bind.singleton((i) => GetFilmsRepositoryImpl(i<GetFilmsDataSource>()));

class GetFilmsRepositoryImpl implements GetFilmsRepository {
  GetFilmsRepositoryImpl(this._getFilmDataSource);

  final GetFilmsDataSource _getFilmDataSource;

  @override
  Future<List<FilmDto>> call() async {
    try {
      var response = await _getFilmDataSource();
      List<FilmDto> films = [];
      for (var element in response) {
        films.add(FilmDto.fromMap(element));
      }
      return films;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<FilmDto>> getOnlineFilms() async {
    try {
      var response = await _getFilmDataSource.getOnlineFilms();
      List<FilmDto> films = [];
      for (var element in response) {
        try {
          films.add(FilmDto.fromMap(element));
        } catch (e) {
          print(e);
        }
      }
      return films;
    } catch (e) {
      rethrow;
    }
  }
}
