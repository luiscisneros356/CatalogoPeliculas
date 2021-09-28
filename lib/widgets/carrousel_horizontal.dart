import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie.dart';

class CarrouselHorizontal extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final Function nextPage;

  CarrouselHorizontal(
      {required this.movies, this.title, required this.nextPage});

  @override
  _CarrouselHorizontalState createState() => _CarrouselHorizontalState();
}

class _CarrouselHorizontalState extends State<CarrouselHorizontal> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          this.widget.nextPage();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (this.widget.title != null)
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                this.widget.title!,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
              ),
            ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(5),
              itemCount: widget.movies.length,
              itemBuilder: (context, i) {
                final movie = widget.movies[i];
                return Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 160,
                  width: 130,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "detail",
                              arguments: movie);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage(
                            placeholder: AssetImage("assets/loading.gif"),
                            image: NetworkImage(movie.fullposter),
                            fit: BoxFit.cover,
                            height: 140,
                            width: 110,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        movie.title ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
