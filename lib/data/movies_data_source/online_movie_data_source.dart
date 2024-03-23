import 'package:movies_app/models/MovieModel.dart';

import '../../network/api_manager.dart';
import 'movies_data_source.dart';

class OnlineMoviesImp implements MoviesDataSource
{
  final ApiManager apiManager;
  OnlineMoviesImp(this.apiManager);

  @override
  Future<List<Movie>> getMovies(String sourceId) async{
    return await apiManager.getupComingMovies();
  }


}