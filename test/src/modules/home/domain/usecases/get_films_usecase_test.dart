import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:gen_films_listing/src/modules/home_list/data/datasources/get_films_datasource.dart';
import 'package:gen_films_listing/src/modules/home_list/data/repositories/get_films_repository_impl.dart';
import 'package:gen_films_listing/src/modules/home_list/domain/models/dtos/film_dto.dart';
import 'package:gen_films_listing/src/modules/home_list/domain/repositories/get_films_repository.dart';
import 'package:gen_films_listing/src/modules/home_list/domain/usecases/get_films_usecase.dart';
import 'package:gen_films_listing/src/modules/home_list/domain/usecases/get_films_usecase_impl.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'films_mock.dart';
import 'get_films_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetFilmsDataSource>()])
void main() {
  final MockGetFilmsDataSource mockGetFilmsDataSource =
      MockGetFilmsDataSource();
  final GetFilmsRepository getFilmsRepository =
      GetFilmsRepositoryImpl(mockGetFilmsDataSource);
  final GetFilmsUseCase getFilmsUseCase =
      GetFilmsUseCaseImpl(getFilmsRepository);

  group(
    'Testes do caso de uso GetFilmsUseCase',
    () {
      test('Testar caso a requisição tenha sido concluida com sucesso',
          () async {
        when(mockGetFilmsDataSource()).thenAnswer(
            (_) async => mockJson['mcu'] as List<Map<String, dynamic>>);

        var result = await getFilmsUseCase();

        expect(result.status, isTrue);
        expect(result.data, isA<List<FilmDto>>());
        expect(result.message, isNull);
      });

      test('Testar caso a requisição tenha retornado algum erro', () async {
        when(mockGetFilmsDataSource()).thenThrow(Exception("ERROR"));

        var result = await getFilmsUseCase();

        expect(result.status, isFalse);
        expect(result.data, isNull);
        expect(result.message, isNotNull);
      });
    },
  );
}
