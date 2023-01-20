import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica/app_movies/provider/movies_provider.dart';
import 'package:practica/library/components/theme%20/app_theme.dart';
import 'package:practica/models/models.dart';
import 'package:provider/provider.dart';

class CastingCard extends StatelessWidget {
  final int movieId;

  const CastingCard({super.key, required this.movieId});
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Actor>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 50),
            height: 200,
            child: const CupertinoActivityIndicator(
              color: AppTheme.primary,
            ),
          );
        }

        final List<Actor> actor = snapshot.data!;
        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: actor.length,
            itemBuilder: (BuildContext context, int index) {
              return _CastCard(movieId: movieId, actor: actor, index: index);
            },
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final int movieId;
  final List<Actor> actor;
  final int index;

  const _CastCard({
    required this.movieId,
    required this.actor,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    print(actor[index].fullprofilephat);

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
        width: 110,
        height: 100,
        child: Column(
          children: [
            Expanded(
              //* Si rebasa el tamaño de la imagen (mayor a el conetenedor padre colocamos expanded para que esta se amolde a su padre de preferencia usar en colum y rows
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/images/no-image.jpg'),
                  image: NetworkImage(actor[index].fullprofilephat),
                  height: 140,
                  width: 100,
                  fit: BoxFit.cover,
                  alignment: const Alignment(0.0, -0.8),
                ),
              ),
            ),
            Text(
              actor[index].originalName,
              style: textTheme.subtitle2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
