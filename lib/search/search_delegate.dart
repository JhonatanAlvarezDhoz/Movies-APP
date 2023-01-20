import 'package:flutter/material.dart';
import 'package:practica/app_movies/helpers/utils.dart';
import 'package:practica/app_movies/provider/movies_provider.dart';
import 'package:practica/app_movies/screens/screens.dart';
import 'package:practica/models/models.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  //*Cambiar el place holder de la barra de busqueda
  //@override
  //String get searchFieldLabel => 'Buscar Peliculas';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('hola');
  }

  Widget _emptyContainer() {
    return const SizedBox(
      child: Center(
        child: Icon(
          Icons.movie_creation_outlined,
          size: 200,
          color: Colors.black38,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //*buildSuggestions el build suggestions siempre se va a disparra, Pero con la implementacion de el etream depende de la informacio que sera entraegada a este buildSuggestions proveniente de suggestionsStream en moviesProvider
    if (query.isEmpty) {
      return _emptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    moviesProvider.getSuggestionsByQuery(query);

    //! replace of futureBuilder for Stream builder and needed 1 stream, this stream was created in provider
    return StreamBuilder(
      stream: moviesProvider.suggestionStream,
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();

        final movies = snapshot.data!;

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (_, int index) => _MovieItem(movie: movies[index]),
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;

  const _MovieItem({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final Convert convert = Convert();
    movie.heroId = 'search-${movie.id}';

    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/images/no-image.jpg'),
          image: NetworkImage(movie.fullPathImg),
          width: 40,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(movie.title),
      subtitle: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Text('${convert.convert(movie.voteAverage / 2)}'),
        ],
      ),
      onTap: () {
        Navigator.of(context).pushNamed('details', arguments: movie);
      },
    );
  }
}
