import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/config/constants.dart';
import '../models/MovieModel.dart';

class ApiManager {
  final popularApiUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}";
  final upComingApiUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}";
  final topRatedApiUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}";
  final detailsApiUrl =
      "https://api.themoviedb.org/3/movie/{movie_id}?api_key=${Constants.apiKey}";
  final similarApiUrl =
      "https://api.themoviedb.org/3/movie/{movie_id}/similar?api_key=${Constants.apiKey}";
  final searchApiUrl =
      "https://api.themoviedb.org/3/search/movie?api_key=${Constants.apiKey}";
  final listApiUrl =
      "https://api.themoviedb.org/3/genre/movie/list?api_key=${Constants.apiKey}";
  final discoverMovieApiUrl =
      "https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}";

  Future<List<Movie>> getupComingMovies() async {
    final response = await http.get(Uri.parse(upComingApiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load New Releases movies');
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(popularApiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedApiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load Recommended movies');
    }
  }
  Future<Movie> getMovieDetails(int movieId) async {
    final response = await http.get(
      Uri.parse(detailsApiUrl),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Movie.fromJson(data);
    } else {
      throw Exception('Failed to load movie details');
    }
  }
  // Future<VideoResponse> getMovieVideos(int id) async {
  //   var params = {
  //     "api_key": apiKey,
  //   };
  //   try {
  //     Response response = await get(
  //         movieUrl + "/$id" + "/videos",
  //         queryParameters: params);
  //     return VideoResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occurred: $error stackTrace: $stacktrace");
  //     return VideoResponse.withError("$error");
  //   }
  // }

}
