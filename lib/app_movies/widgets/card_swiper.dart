import 'package:flutter/material.dart';
import 'package:practica/models/movie.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({
    super.key,
    required this.movies,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      width: size.width, //! Layout.builder ***
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.9,
        itemBuilder: (BuildContext context, int index) {
          //! Creamos un una instancia de movia con cada indice en la lista
          final movie = movies[index];
          movie.heroId = 'swiper-${movie.id}';

          //?GestureDetector: funciona para navegar a un screen cuando se aga tap sobre el objeto
          return GestureDetector(
            onTap: (() =>
                Navigator.pushNamed(context, 'details', arguments: movie)),
            //*ClipRRect:se utilza para permitir colocar un borde en fadeInImage
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/images/no-image.jpg'),
                  image: NetworkImage(movie.fullPathImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
