import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen_films_listing/src/modules/home_list/domain/models/dtos/film_dto.dart';
import 'package:gen_films_listing/src/utils/constants.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final controller = Modular.get<HomeController>();
  late final ScrollController _scrollController;
  bool isOnline = false;

  @override
  void initState() {
    super.initState();
    getData();
    _scrollController = ScrollController();
  }

  void getData() async {
    isOnline
        ? await controller.getFilmsOnline()
        : await controller.getFilmsMock();
    setState(() {});
  }

  bool sort = false;
  void sortByRating() {
    sort
        ? controller.films
            .sort((a, b) => a.voteAverage.compareTo(b.voteAverage))
        : controller.films
            .sort((a, b) => b.voteAverage.compareTo(a.voteAverage));
    sort = !sort;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isOnline ? Colors.blue : Colors.red,
        title: Text(isOnline ? 'DC' : 'Marvel'),
        actions: [
          IconButton(
            onPressed: sortByRating,
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          isOnline = !isOnline;
          getData();
        },
        label: Text(isOnline ? 'Mudar para o Mock' : 'Mudar para online'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                isOnline ? 'assets/dc_logo.png' : 'assets/marvel_logo.png'),
            opacity: 0.1,
            fit: BoxFit.fitWidth,
          ),
        ),
        child: controller.films.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.films.length,
                padding: const EdgeInsets.all(8),
                controller: _scrollController,
                itemBuilder: (context, index) {
                  FilmDto film = controller.films[index];
                  String dateFormatted =
                      film.releaseDate.split('-').reversed.join('/');
                  return ExpansionTile(
                    leading: Image.network(
                      kImageBaseUrl + film.posterPath,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.low,
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                              ? child
                              : const CircularProgressIndicator(),
                    ),
                    title: Text(film.title),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(film.voteAverage.toString()),
                        const SizedBox(width: 5),
                        ...controller.getStars(
                          rating: film.voteAverage,
                          starSize: 20,
                        ),
                      ],
                    ),
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showPoster(context, film);
                              },
                              child: Image.network(
                                kImageBaseUrl + film.posterPath,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.low,
                              ),
                            ),
                            ExpandedCard(
                              film: film,
                              dateFormatted: dateFormatted,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }

  Future<dynamic> showPoster(BuildContext context, FilmDto film) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Image.network(
          kImageBaseUrlOriginalSize + film.posterPath,
          fit: BoxFit.scaleDown,
          loadingBuilder: (context, child, loadingProgress) =>
              loadingProgress == null
                  ? child
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
        ),
      ),
    );
  }
}

class ExpandedCard extends StatelessWidget {
  const ExpandedCard({
    Key? key,
    required this.film,
    required this.dateFormatted,
  }) : super(key: key);

  final FilmDto film;
  final String dateFormatted;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54.withAlpha(200),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(film.title, style: const TextStyle(fontSize: 16)),
          ],
        ),
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Título original: ${film.originalTitle}',
                style: const TextStyle(fontSize: 12)),
            Text('Ano de lançamento: $dateFormatted',
                style: const TextStyle(fontSize: 12)),
            Text('Popularidade: ${film.popularity}',
                style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 10),
            ExpansionTile(
              title: const Text('Sinopse'),
              children: [
                Text(film.overview),
              ],
            ),
            const SizedBox(height: 10),
            ExpansionTile(title: const Text('Ver imagem de fundo'), children: [
              Image.network(
                kImageBaseUrl + film.backdropPath,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.low,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ])
          ],
        ),
      ),
    );
  }
}
