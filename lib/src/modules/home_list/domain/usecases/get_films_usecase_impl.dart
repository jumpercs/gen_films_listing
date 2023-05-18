import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen_films_listing/src/modules/home_list/domain/models/dtos/film_dto.dart';
import 'package:gen_films_listing/src/modules/home_list/shared/response/response_presentation.dart';

import '../repositories/get_films_repository.dart';
import 'get_films_usecase.dart';

final $GetFilmsUseCaseImpl =
    Bind.singleton((i) => GetFilmsUseCaseImpl(i<GetFilmsRepository>()));

class GetFilmsUseCaseImpl implements GetFilmsUseCase {
  GetFilmsUseCaseImpl(this._repository);

  final GetFilmsRepository _repository;

  @override
  Future<ResponseEither> call() async {
    try {
      final List<FilmDto> films = await _repository();
      return ResponseEither.success(films);
    } catch (e, s) {
      return ResponseEither.error(e.toString(), s);
    }
  }

  @override
  Future<ResponseEither> getOnlineFilms() async {
    try {
      final List<FilmDto> films = await _repository.getOnlineFilms();
      return ResponseEither.success(films);
    } catch (e, s) {
      return ResponseEither.error(e.toString(), s);
    }
  }
}
