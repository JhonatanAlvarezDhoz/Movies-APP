import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica/models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final Function onNetxtPage;

  const MovieSlider({
    super.key,
    this.title,
    required this.movies,
    required this.onNetxtPage,
  });

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNetxtPage();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 230,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (widget.title != null)
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(widget.title!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold))),
        Expanded(
          child: ListView.builder(
            controller: scrollController, //! asociamos el escroll
            scrollDirection: Axis.horizontal,
            itemCount: widget.movies.length,
            itemBuilder: (BuildContext context, int index) => _MoviePicture(
                movie: widget.movies[index],
                heroId:
                    'heroId-${widget.title}-$index-${widget.movies[index].id}'),
          ),
        ),
      ]),
    );
  }
}

class _MoviePicture extends StatelessWidget {
  final Movie movie;
  final String heroId;
  const _MoviePicture({
    required this.movie,
    required this.heroId,
  });

  @override
  Widget build(BuildContext context) {
    movie.heroId = heroId;
    return Container(
        width: 130,
        height: 120,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (() =>
                    Navigator.pushNamed(context, 'details', arguments: movie)),
                child: Hero(
                  tag: movie.heroId!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder:
                          const AssetImage('assets/images/no-image.jpg'),
                      image: NetworkImage(movie.fullPathImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }
}
