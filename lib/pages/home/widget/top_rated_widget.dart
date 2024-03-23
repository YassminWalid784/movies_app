import'package:flutter/material.dart';

import '../../../models/MovieModel.dart';
import '../../../network/api_manager.dart';
class TopRatedWidget extends StatefulWidget {
  const TopRatedWidget({super.key});

  @override
  State<TopRatedWidget> createState() => _TopRatedWidgetState();
}

class _TopRatedWidgetState extends State<TopRatedWidget> {
  late Future<List<Movie>> topRatedMovies;

  @override
  void initState() {
    topRatedMovies = ApiManager().getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:  const EdgeInsets.symmetric(vertical: 20),
      height: 200,
      child: SingleChildScrollView(
        child: FutureBuilder(
            future: topRatedMovies,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return  const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final movies = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Container(
                    width: 150,
                    margin:  const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                              "https://image.tmdb.org/t/p/original/${movie.poster}",
                              height: 175,
                              width: 97,
                              fit: BoxFit.cover),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFFFBB3B),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "rating",
                                  // movie.rating as String,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "title",
                                // movie.title,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "date",
                                    // movie.releaseDate,
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFB5B4B4),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "runtime",
                                    // movie.runtime as String,
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFB5B4B4),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}