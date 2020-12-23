import 'package:cinex/ui/widgets/coming_soon_tile.dart';
import 'package:cinex/viewmodel/movie_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var vm = MovieViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    vm = Provider.of<MovieViewModel>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          title: Text('Cinex'),
        ),
        body: Container(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 20.0),
              child: Row(
                children: [
                  Text(
                    'Coming soon',
                    style: GoogleFonts.poppins(
                        fontSize: 25.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        vm.getMoviesData();
                      }),
                ],
              ),
            ),
            Container(
              height: Platform.isIOS ? MediaQuery.of(context).size.height / 2.4
                  : MediaQuery.of(context).size.height / 2.35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ComingSoonTile(
                    movieTitle: vm.movies[index].title,
                    showDate: vm.movies[index].releaseDate,
                    movieImage: vm.movies[index].posterPath,
                  );
                },
                itemCount: vm.movies.length,
              ),
            ),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 10.0),
                    child: Text(
                      'Movies',
                      style: GoogleFonts.poppins(
                          fontSize: 25.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            ),
            Container(
              child: Expanded(
                child: DefaultTabController(
                  length: 5,
                  child: Scaffold(
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(59.0),
                      child: AppBar(
                        elevation: 0.0,
                        backgroundColor: Colors.white,
                        bottom: TabBar(
                          isScrollable: true,
                          labelPadding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 0.0),
                          tabs: [
                            Text('Cat1', style: GoogleFonts.poppins(color: Colors.blue),),
                            Text('Cat1', style: GoogleFonts.poppins(color: Colors.blue),),
                            Text('Cat1', style: GoogleFonts.poppins(color: Colors.blue),),
                            Text('Cat1', style: GoogleFonts.poppins(color: Colors.blue),),
                            Text('Cat1', style: GoogleFonts.poppins(color: Colors.blue),),
                          ],
                        ),
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        Text('Cat1'),
                        Text('Cat1'),
                        Text('Cat1'),
                        Text('Cat1'),
                        Text('Cat1'),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        )));
  }
}
