import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCastList extends StatefulWidget {
  final String castImage;
  final String castName;

  MovieCastList({this.castImage, this.castName});

  @override
  _MovieCastListState createState() => _MovieCastListState();
}

class _MovieCastListState extends State<MovieCastList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.lightBlue,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/original${widget.castImage}"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Text(widget.castName, style: GoogleFonts.poppins(),),
        ],
      ),
    );
  }
}
