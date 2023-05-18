import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen_films_listing/src/modules/home_list/domain/models/dtos/film_dto.dart';
import 'package:gen_films_listing/src/modules/home_list/domain/usecases/get_films_usecase.dart';
import 'package:gen_films_listing/src/utils/widgets/icon_star.dart';

import '../../shared/response/response_presentation.dart';

final $HomeController =
    Bind.singleton((i) => HomeController(i<GetFilmsUseCase>()));

class HomeController {
  HomeController(this._getFilmsUseCase);

  final GetFilmsUseCase _getFilmsUseCase;

  List<FilmDto> films = [];

  Future<void> getFilmsMock() async {
    films.clear();
    ResponseEither response = await _getFilmsUseCase();
    response.status == false
        ? throw Exception(response.message)
        : films = response.data as List<FilmDto>;
    print('mock: ${films.length}');
  }

  Future<void> getFilmsOnline() async {
    films.clear();
    ResponseEither response = await _getFilmsUseCase.getOnlineFilms();
    print(response);
    response.status == false
        ? throw Exception('${response.message!} - ${response.stackTrace}')
        : films = response.data as List<FilmDto>;
    print('online: ${films.length}');
  }

  List<Widget> getStars({required double? rating, required double starSize}) {
    List<StarIcon> temp = [];
    if (rating != null) {
      for (var i = 0; i < rating ~/ 2; i++) {
        temp.add(StarIcon(
          icon: Icons.star,
          size: starSize,
        ));
      }
      if (rating > 0 && rating % 2 != 0) {
        temp.add(StarIcon(
          icon: Icons.star_half,
          size: starSize,
        ));
      }
      while (temp.length < 5) {
        temp.add(StarIcon(
          icon: Icons.star_border,
          size: starSize,
        ));
      }
    }
    return temp;
  }
}
