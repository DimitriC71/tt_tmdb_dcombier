import 'package:flutter/material.dart';

import '../../core/manager/movie_manager.dart';
import '../../core/model/movie.dart';

class FavoriteListPage extends StatefulWidget {
  const FavoriteListPage({super.key});

  @override
  State<FavoriteListPage> createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {
  @override
  Widget build(BuildContext context) {
    String baseUrlPoster = "https://image.tmdb.org/t/p/w500";
    String errorUrlPoster = "https://demofree.sirv.com/nope-not-here.jpg";

    return Scaffold(
      body: FutureBuilder(
        future: MovieManager().loadMovie(),
        builder: (context, snapshot) {
          List<Movie>? movies = MovieManager().getMovie();

          if (snapshot.hasData) {
            return Center(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: movies?.length,
                    itemBuilder: (BuildContext context, int index) {
                      Movie movie = movies![index];
                      return InkWell(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 0.3),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12.0),
                                      )),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            movie.poster_path != null
                                                ? baseUrlPoster +
                                                    movie.poster_path!
                                                : errorUrlPoster,
                                            width: 100,
                                          )),
                                      const SizedBox(width: 10),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(movie.title ?? "",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                IconButton(
                                                    onPressed: () {
                                                      MovieManager()
                                                          .favoriteCliked(
                                                              movie);
                                                      setState(() {});
                                                    },
                                                    icon: MovieManager()
                                                            .isFavorite(movie)
                                                        ? const Icon(
                                                            Icons.favorite)
                                                        : const Icon(Icons
                                                            .favorite_border))
                                              ],
                                            ),
                                            Text(movie.release_date.toString(),
                                                style: const TextStyle(
                                                    color: Colors.grey)),
                                            Container(
                                                width: 200,
                                                child: Text(
                                                  movie.overview ?? "",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ))
                                          ]),
                                    ],
                                  ))));
                    }));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
