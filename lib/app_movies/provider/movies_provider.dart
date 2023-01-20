import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practica/app_movies/helpers/debouncer.dart';
import 'package:practica/models/models.dart';
import 'package:practica/models/search_movies.dart';

//!se debe extender de ChangeNotifier
class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'f19e8c1703406a723ec8061542e62c25';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'en-US';

  List<Movie> onDisplayMovie = [];
  List<Movie> popularMovie = [];

  //! Utilizamos un map para otorgar un enteri id ya que es unico y de esa forma seria mas rapido obtener los actores
  Map<int, List<Cast>> moviesCast = {};

  //*

  int _pagePopular = 0;

  final debouncer = Debouncer(duration: const Duration(milliseconds: 500));

  final StreamController<List<Movie>> _suggestionStreamController =
      new StreamController.broadcast();

  //! stream of search delegate
  Stream<List<Movie>> get suggestionStream =>
      _suggestionStreamController.stream;

  MoviesProvider() {
    _getMoviesNowPlaying();
    getPopularMovies();
  }
  //! var url = Uri.https(_baseUrl, '3/movie/now_playing = Segmento de la api ', {_apiKey, _baseUrl} = argumentos);

  Future<String> _getJsonData(edpoint, [int page = 1]) async {
    final url = Uri.https(
      _baseUrl,
      edpoint,
      {
        'api_key': _apiKey,
        'languaje': _language,
        'page': '$page',
      },
    );

    final response = await http.get(url);

    return response.body;
  }

  _getMoviesNowPlaying() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final data = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovie = data.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _pagePopular++;
    final jsonData = await _getJsonData('3/movie/popular', _pagePopular);
    final data = PupularResponse.fromJson(jsonData);

    //!popularMovie = [...popularMovie(destrucuramos y agragamos los datos que vienen en data.result), ...data.results]
    popularMovie = [...popularMovie, ...data.results];

    notifyListeners();
  }

  Future<List<Actor>> getMovieCast(int movieID) async {
    final jsonData = await _getJsonData('3/movie/$movieID/credits');
    final castResponse = Cast.fromJson(jsonData);

    moviesCast[movieID] = castResponse.cast.cast<Cast>();

    return castResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(
      _baseUrl,
      '3/search/movie',
      {
        'api_key': _apiKey,
        'languaje': _language,
        'query': query,
      },
    );

    final response = await http.get(url);
    final searchMovie = SearchMovies.fromJson(response.body);

    return searchMovie.results;
  }

  void getSuggestionsByQuery(String query) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      print(value);
      //!se realiza la petición nuevamente
      final results = await searchMovies(value);
      //! se agrega el evento a el _suggestionStreamController con .add()
      _suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = query;
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }
}
