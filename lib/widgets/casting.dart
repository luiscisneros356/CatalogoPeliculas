import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/api/movies_provider.dart';
import 'package:peliculas_app/models/credits.dart';

import 'package:provider/provider.dart';

class CastingCard extends StatelessWidget {
  final int movieId;

  const CastingCard({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<MovieProvider>(context, listen: false);

    return FutureBuilder(
      future: movies.getMovieCast(movieId),
      builder: (BuildContext context, AsyncSnapshot movie) {
        if (!movie.hasData) {
          return Container(
            margin: EdgeInsets.only(left: 15),
            height: 180,
            width: 130,
            child: CupertinoActivityIndicator(),
          );
        }
        final List cast = movie.data;
        return Container(
          width: double.infinity,
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Casting"),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(10),
                  itemCount: cast.length,
                  itemBuilder: (context, i) {
                    return _CastingCard(
                      actor: cast[i],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CastingCard extends StatelessWidget {
  const _CastingCard({
    Key? key,
    required this.actor,
  }) : super(key: key);

  final Cast actor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      height: 180,
      width: 130,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage("assets/loading.gif"),
              fit: BoxFit.cover,
              image: NetworkImage(actor.fullpProfilePath),
              height: 160,
              width: 130,
            ),
          ),
          Text(
            actor.name!,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
