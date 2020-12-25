import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {

  final String movieTitle;
  final String movieImage;

  MovieDetails({this.movieTitle, this.movieImage});

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  var fetchTitle;
  var fetchImage;

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> arguments = ModalRoute.of(context).settings.arguments as Map;
    arguments.forEach((key, value) {
      if(key == 'movieTitle'){
        fetchTitle = value;
      }else if (key == 'movieImage'){
        fetchImage = value;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(fetchTitle),
      ),
      body: Image.network("https://image.tmdb.org/t/p/original${fetchImage}"),
    );
  }
}
