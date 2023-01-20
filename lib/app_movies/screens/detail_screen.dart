import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:practica/app_movies/helpers/utils.dart';
import 'package:practica/app_movies/widgets/casting_card.dart';
import 'package:practica/library/components/theme%20/app_theme.dart';
import 'package:practica/models/models.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    print(movie.title);

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(
          movie: movie,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(
            movie: movie,
          ),
          _OverView(
            movie: movie,
          ),
          _OverView(
            movie: movie,
          ),
          _OverView(
            movie: movie,
          ),
          CastingCard(
            movieId: movie.id,
          ),
        ])),
      ],
    ));
  }
}

//Movie-Banner
class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar({
    required this.movie,
  });
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: AppTheme.primary,
        expandedHeight: 200,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: const EdgeInsets.all(0), //* retirar padding del texto
          title: Container(
            padding: const EdgeInsets.only(bottom: 10),
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black26,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          background: FadeInImage(
            placeholder: const AssetImage('assets/images/no-image.jpg'),
            image: NetworkImage(movie.fullbackdropPath),
            fit: BoxFit.cover,
            alignment: const Alignment(0.0, -0.7),
          ),
        ));
  }
}

//Poster-And-Title
class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle({
    required this.movie,
  });
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Convert convert = Convert();

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Hero(
          tag: movie.heroId!,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LayoutBuilder(builder: (context, c) {
                return FadeInImage(
                  placeholder: const AssetImage('assets/images/no-image.jpg'),
                  image: NetworkImage(movie.fullPathImg),
                  height: 200,
                  width: 120,
                  fit: BoxFit.cover,
                );
              })),
        ),
        const SizedBox(width: 20),
        ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 200),
          child: LayoutBuilder(builder: (context, c) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  movie.originalTitle,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: c.maxWidth * 0.8,
                  child: Row(
                    children: [
                      Text('${(convert.convert(movie.voteAverage / 2))}',
                          style: textTheme.caption),
                      const SizedBox(width: 4),
                      RatingBar.builder(
                        initialRating: convert.convert(movie.voteAverage / 2),
                        minRating: 2,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                        itemSize: 20,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                        ignoreGestures: true,
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ]),
    );
  }
}

//Description
class _OverView extends StatelessWidget {
  final Movie movie;

  const _OverView({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
//! listView.builder usar customScrollView con sliverList
