import 'package:flutter/material.dart';
import 'package:peliculas_app/api/movies_provider.dart';

import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Peliculas'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //CardSwiper
            CardSwiper(
              movie: moviesProvider.displaymovie,
            ),

            // Listado horizontal
            CarrouselHorizontal(
              movies: moviesProvider.displaypopular,
              title: "Populares",
              nextPage: () => moviesProvider.getPopular(),
            ),
            CarrouselHorizontal(
              movies: moviesProvider.displaytoprated,
              nextPage: () => moviesProvider.getTopRated(),
              title: "Top Rated",
            ),
            CarrouselHorizontal(
              movies: moviesProvider.displaymovie,
              title: "Mejor Votadas",
              nextPage: () => moviesProvider.getNowPlaying(),
            ),
          ],
        ),
      ),
    );
  }
}
