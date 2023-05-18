abstract class GetFilmsDataSource {
  Future<List<Map<String, dynamic>>> call();

  Future<List<Map<String, dynamic>>> getOnlineFilms();
}
