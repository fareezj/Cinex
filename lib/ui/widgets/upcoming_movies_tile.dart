import 'package:flutter/material.dart';

class UpcomingMoviesTile extends StatefulWidget {
  final String movieImage;

  UpcomingMoviesTile({this.movieImage});

  @override
  _UpcomingMoviesTileState createState() => _UpcomingMoviesTileState();
}

class _UpcomingMoviesTileState extends State<UpcomingMoviesTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              image: NetworkImage(
                  "https://image.tmdb.org/t/p/original${widget.movieImage}"),
              fit: BoxFit.fill)),
    );
  }
}
