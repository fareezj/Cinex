import 'package:flutter/material.dart';
import 'package:cinex/utils/image_filter.dart';

class CategoryMoviesTile extends StatefulWidget {

  final String movieImage;
  final String movieTitle;

  CategoryMoviesTile({this.movieImage, this.movieTitle});

  @override
  _CategoryMoviesTileState createState() => _CategoryMoviesTileState();
}

class _CategoryMoviesTileState extends State<CategoryMoviesTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        ],
      ),
    );
  }
}
