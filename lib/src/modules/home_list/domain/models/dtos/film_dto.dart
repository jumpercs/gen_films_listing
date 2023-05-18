class FilmDto {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const FilmDto({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory FilmDto.fromMap(Map<String, dynamic> map) => FilmDto(
        adult: map['adult'] as bool,
        backdropPath: map['backdrop_path'] as String,
        genreIds:
            (map['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
        id: map['id'] as int,
        originalLanguage: map['original_language'] as String,
        originalTitle: map['original_title'] as String,
        overview: map['overview'] as String,
        popularity: (map['popularity'] as num).toDouble(),
        posterPath: map['poster_path'] as String,
        releaseDate: map['release_date'] as String,
        title: map['title'] as String,
        video: map['video'] as bool,
        voteAverage: (map['vote_average'] as num).toDouble(),
        voteCount: map['vote_count'] as int,
      );

  Map<String, dynamic> toMap() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': genreIds,
        'id': id,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}
