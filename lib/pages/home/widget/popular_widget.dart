import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../models/MovieModel.dart';
import '../../../network/api_manager.dart';

class PopularWidget extends StatefulWidget {
  const PopularWidget({super.key});
  @override
  State<PopularWidget> createState() => _PopularWidgetState();
}

class _PopularWidgetState extends State<PopularWidget> {
  late Future<List<Movie>> popularMovies;

  @override
  void initState() {
    popularMovies = ApiManager().getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: popularMovies,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final movies = snapshot.data!;
        return CarouselSlider.builder(
          itemCount: movies.length,
          itemBuilder: (context, index, movieIndex) {
            final movie = movies[index];
            return Stack(
              children: [
                Image.network(
                  "https://image.tmdb.org/t/p/original/${movie.video}",
                  height: 217,
                  width: Constants.mediaQuery.width,
                  fit: BoxFit.cover,
                ),
                 SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              child:Stack(
                                children: [
                                  Image.network(
                                    "https://image.tmdb.org/t/p/original/${movie.poster}",
                                    height: 199,
                                    width: 129,
                                  ),
                                  const Positioned( // Position the icon at the top left corner
                                    top: 0,
                                    left: 0,
                                    child: Icon( // Add the icon
                                      Icons.bookmark_add_outlined,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(movie.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Text(movie.releaseDate,
                                        style: const TextStyle(
                                          color: Color(0xFFB5B4B4),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400
                                        ),
                                      ),
                                      const SizedBox(width: 4,),
                                      Text(movie.runtime as String,
                                        style: const TextStyle(
                                            color: Color(0xFFB5B4B4),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 1.4,
            autoPlayInterval: const Duration(seconds: 3),
          ),
        );
      },
    );
  }
}
