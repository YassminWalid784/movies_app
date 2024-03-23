import 'package:flutter/material.dart';
import 'package:movies_app/pages/watchList/pages/watchlist_view.dart';

import '../../../models/MovieModel.dart';
import '../../../network/api_manager.dart';

class NewRealeaseWidget extends StatefulWidget {
  const NewRealeaseWidget({super.key});

  @override
  State<NewRealeaseWidget> createState() => _NewRealeaseWidgetState();
}

class _NewRealeaseWidgetState extends State<NewRealeaseWidget> {
  late Future<List<Movie>> upcomingMovies;
  bool isClicked = false;
  @override
  void initState() {
    upcomingMovies = ApiManager().getupComingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 200,
      child: FutureBuilder(
          future: upcomingMovies,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final movies = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return GestureDetector(
                  // Wrap with GestureDetector
                  onTap: () {
                    setState(() {
                      isClicked = !isClicked;
                    });
                    // Navigate to another page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WatchListView(),
                      ),
                    );
                  },
                  child: Container(
                    width: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                              "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                              height: 127.74,
                              width: 96.87,
                              fit: BoxFit.cover),
                        ),
                        Positioned(
                          child: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  isClicked = !isClicked;
                                },
                              );
                            },
                            icon: Icon(
                              isClicked ? Icons.add_box_rounded : Icons.add,
                              color: isClicked ? Colors.amber : Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
