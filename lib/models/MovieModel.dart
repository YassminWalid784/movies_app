class Movie {
  final String title;
  final String backDropPath;
  final String overview;
  final double popularity;
  final num rating;
  final String poster;
  final bool video;
  final String releaseDate;
  final int id;
  final int runtime;
  bool? adult;
  List<int>? genreIds;

  Movie(this.id, this.popularity, this.title, this.backDropPath, this.overview,
      this.rating, this.poster, this.releaseDate, this.runtime, this.video);

  Movie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        title = json["title"],
        backDropPath = json['backDropPath'],
        poster = json["poster_path"],
        overview = json["overview"],
        releaseDate = json['releaseDate'],
        runtime = json["runtime"],
        video = json["video"],
        rating = json["vote_average"].toDouble();
}
