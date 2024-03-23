import '../../models/MovieModel.dart';

abstract class MoviesDataSource {
  Future<List<Movie>> getMovies(String sourceId);
}