import 'package:flutter/material.dart';
import 'package:practica/app_movies/provider/movies_provider.dart';
import 'package:practica/app_movies/widgets/card_swiper.dart';
import 'package:practica/app_movies/widgets/movie_slider.dart';
import 'package:practica/search/search_delegate.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! Sedebe espesificar el tipo de provider que necesita o que debe buscar
    final providerMovie = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie On'),
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: MovieSearchDelegate()),
            icon: const Icon(Icons.search_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          //Principal Cardd
          CardSwiper(movies: providerMovie.onDisplayMovie),

          //Movie Row
          MovieSlider(
            movies: providerMovie.popularMovie,
            title: 'Populars',
            onNetxtPage: () {
              providerMovie.getPopularMovies();
            },
          ),
        ],
      )),
    );
  }
}
