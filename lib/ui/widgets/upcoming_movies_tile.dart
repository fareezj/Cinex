import 'package:flutter/material.dart';

class UpcomingMoviesTile extends StatefulWidget {
  final int movieId;
  final String movieImage;

  UpcomingMoviesTile({this.movieId, this.movieImage});

  @override
  _UpcomingMoviesTileState createState() => _UpcomingMoviesTileState();
}

class _UpcomingMoviesTileState extends State<UpcomingMoviesTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/movieDetails', arguments: <String, int> {
          'movieId': widget.movieId,
        });
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
                image: NetworkImage(
                    "https://image.tmdb.org/t/p/original${widget.movieImage}"),
                fit: BoxFit.fill)),
      ),
    );
  }
}
