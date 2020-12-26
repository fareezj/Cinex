import 'package:cinex/models/movie_details_model.dart';
import 'package:cinex/viewmodel/movie_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatefulWidget {
  final String movieTitle;
  final String movieImage;

  MovieDetails({this.movieTitle, this.movieImage});

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  var movieId;
  var vm = MovieViewModel();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final Map<String, dynamic> arguments =
          ModalRoute.of(context).settings.arguments as Map;
      arguments.forEach((key, value) {
        if (key == 'movieId') {
          movieId = value;
        }
      });
      vm.getMovieDetailsData(movieId);
      print(movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    vm = Provider.of<MovieViewModel>(context, listen: true);

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/original${vm.movieDetails[0].backdropPath}"),
                        fit: BoxFit.fill)),
              ),
            ),
            SafeArea(
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded),
                color: Colors.white,
                iconSize: 40.0,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}

// "https://image.tmdb.org/t/p/original${vm.movieDetails[0].backdropPath}"
