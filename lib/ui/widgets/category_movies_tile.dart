import 'package:flutter/material.dart';
import 'package:cinex/utils/image_filter.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryMoviesTile extends StatefulWidget {
  final int movieId;
  final String movieImage;
  final String movieTitle;

  CategoryMoviesTile({this.movieId, this.movieImage, this.movieTitle});

  @override
  _CategoryMoviesTileState createState() => _CategoryMoviesTileState();
}

class _CategoryMoviesTileState extends State<CategoryMoviesTile> {
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
              child: ImageFilter(
                brightness: -0.2,
                hue: 0.0,
                saturation: 0.0,
                child: Container(
                  height: MediaQuery.of(context).size.height / 4.5,
                  width: MediaQuery.of(context).size.width / 2.5,
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
                  child: ClipRRect(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/original${widget.movieImage}"),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Text(
                  widget.movieTitle,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ),
    );
  }
}
