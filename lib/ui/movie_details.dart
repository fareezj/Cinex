import 'package:cinex/ui/widgets/movie_cast_list.dart';
import 'package:cinex/viewmodel/movie_details_view_model.dart';
import 'package:cinex/viewmodel/movie_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  var vm = MovieDetailsViewModel();

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
    vm = Provider.of<MovieDetailsViewModel>(context, listen: true);

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                height: MediaQuery.of(context).size.height / 2,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/original${vm.movieDetails[0].backdropPath}"),
                          fit: BoxFit.fill)),
                ),
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
        Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      vm.movieDetails[0].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: 20.0,
                          color: Colors.lightBlue[800],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      vm.movieDetails[0].voteAverage.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 20.0,
                          color: Colors.lightBlue[800],
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                height: 50.0,
                margin: EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: vm.genreList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        '${vm.genreList[index].name}, ',
                        style: GoogleFonts.poppins(),
                      );
                    }),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Description',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    fontSize: 18.0,
                    color: Colors.lightBlue[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                vm.movieDetails[0].overview.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  color: Colors.lightBlue[900],
                ),
              ),
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'The Cast',
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue[900],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: vm.movieCastsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MovieCastList(
                          castId: vm.movieCastsList[index].id,
                          castImage: vm.movieCastsList[index].profilePath,
                          castName: vm.movieCastsList[index].name,
                          castPopularity: vm.movieCastsList[index].popularity,
                        );
                      }),
                ),
              )
            ],
          ),
        )
      ]),
    ));
  }
}

// "https://image.tmdb.org/t/p/original${vm.movieDetails[0].backdropPath}"
