import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCastList extends StatefulWidget {
  final String castImage;
  final String castName;
  final double castPopularity;

  MovieCastList({this.castImage, this.castName, this.castPopularity});

  @override
  _MovieCastListState createState() => _MovieCastListState();
}

class _MovieCastListState extends State<MovieCastList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
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
              Positioned(
                  top: 15.0,
                  right: 10.0,
                  child: Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Text(
                          widget.castPopularity.toStringAsFixed(1),
                          style:
                              GoogleFonts.poppins(color: Colors.lightBlue[900]),
                        ),
                        Icon(
                          Icons.star_sharp,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            widget.castName,
            style: GoogleFonts.poppins(),
          ),
        ],
      ),
    );
  }
}
