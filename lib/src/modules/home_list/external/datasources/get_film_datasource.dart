import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen_films_listing/src/modules/home_list/data/datasources/get_films_datasource.dart';
import 'package:gen_films_listing/src/modules/home_list/shared/http/http_client.dart';
import 'package:gen_films_listing/src/utils/constants.dart';

final $GetFilmsDataSourceImpl =
    Bind.singleton((i) => GetFilmsDataSourceImpl(i<HttpClientAdapter>()));

class GetFilmsDataSourceImpl implements GetFilmsDataSource {
  GetFilmsDataSourceImpl(this._client);

  final HttpClientAdapter _client;

  @override
  Future<List<Map<String, dynamic>>> call() async {
    try {
      final response = await _client.get(
          path:
              'https://mocki.io/v1/246679d2-5063-466f-84ef-6157bf334da2'); // JSON MOCK FORNECIDO NO TESTE HOSPEDADO ONLINE
      return List<Map<String, dynamic>>.from(response['mcu']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getOnlineFilms() async {
    try {
      final response =
          await _client.get(path: '$kApiBaseUrl/list/105614?api_key=$kApiKey');
      print(response);
      return List<Map<String, dynamic>>.from(response['items']);
    } catch (e) {
      rethrow;
    }
  }
}
