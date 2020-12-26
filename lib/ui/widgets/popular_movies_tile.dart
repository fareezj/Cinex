import 'package:cinex/utils/image_filter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularMoviesTile extends StatefulWidget {
  final int movieId;
  final String movieTitle;
  final String showDate;
  final String movieImage;

  PopularMoviesTile({this.movieId, this.movieTitle, this.showDate, this.movieImage});

  @override
  _PopularMoviesTileState createState() => _PopularMoviesTileState();
}

class _PopularMoviesTileState extends State<PopularMoviesTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/movieDetails', arguments: <String, int> {
          'movieId': widget.movieId,
        });
      },
      child: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.8,
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ImageFilter(
                        brightness: -0.2,
                        hue: 0.0,
                        saturation: 0.0,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/original${widget.movieImage}"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 50.0,
                          left: 30.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.movieTitle,
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w600)),
                              Text(
                                widget.showDate,
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ],
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
