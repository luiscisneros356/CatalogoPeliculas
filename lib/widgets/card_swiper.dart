import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movie;

  CardSwiper({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movie.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return Container(
      width: double.infinity,
      height: size.height * 0.48,
      child: Swiper(
        itemCount: movie.length,
        layout: SwiperLayout.STACK,
        itemHeight: size.width * 0.9,
        itemWidth: size.width * 0.6,
        itemBuilder: (context, int i) {
          final movies = movie[i];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "detail", arguments: movies);
            },
            child: Hero(
              tag: movie[i].id!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FadeInImage(
                  placeholder: AssetImage("assets/loading.gif"),
                  image: NetworkImage("${movies.fullposter}"),
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
