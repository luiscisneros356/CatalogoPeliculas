import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie.dart';
import 'package:peliculas_app/widgets/casting.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Movie movies = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        AppbarSilver(),
        SliverList(
          delegate: SliverChildListDelegate([
            PosterDetail(),
            Content(),
            CastingCard(
              movieId: movies.id!,
            ),
          ]),
        )
      ],
    ));
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Movie movies = ModalRoute.of(context)!.settings.arguments as Movie;
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        """${movies.overview}""",
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class PosterDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Movie movies = ModalRoute.of(context)!.settings.arguments as Movie;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Hero(
              tag: movies.id!,
              child: FadeInImage(
                placeholder: AssetImage(
                  "assets/loading.gif",
                ),
                fit: BoxFit.cover,
                height: 150,
                image: NetworkImage(
                  movies.fullposter,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: size.width - 200),
                  child: Text(
                    movies.title ?? "",
                    style: TextStyle(fontSize: 20),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Popularidad\n${movies.popularity.toString()}."),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AppbarSilver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Movie movies = ModalRoute.of(context)!.settings.arguments as Movie;
    return SliverAppBar(
      expandedHeight: 150,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movies.title ?? "",
          maxLines: 2,
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
        background: FadeInImage(
          image: NetworkImage(movies.fullbackdropPath),
          fit: BoxFit.cover,
          placeholder: AssetImage("assets/loading.gif"),
        ),
      ),
    );
  }
}
