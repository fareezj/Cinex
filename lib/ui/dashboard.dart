import 'package:cinex/ui/upcoming_movies.dart';
import 'package:cinex/ui/widgets/coming_soon_tile.dart';
import 'package:cinex/ui/widgets/tab_bar_title.dart';
import 'package:cinex/viewmodel/movie_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'widgets/tab_bar_view_item.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      vm.getPopularMoviesData();
      vm.getCategoryMoviesData(27);
    });
  }

  @override
  Widget build(BuildContext context) {
    vm = Provider.of<MovieViewModel>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          title: Text('Cinex'),
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            DrawerHeader(
              child: Text('Cinex'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('View All Movies'),
              onTap: () {
                Navigator.pushNamed(context, '/upcoming');
              },
            ),
          ],
        )),
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Popular',
                          style: GoogleFonts.poppins(
                              fontSize: 25.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: Platform.isIOS
                        ? MediaQuery.of(context).size.height / 2.4
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
                          'Genres',
                          style: GoogleFonts.poppins(
                              fontSize: 25.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )),
                  Container(
                    child: Expanded(
                      child: DefaultTabController(
                          length: 10,
                          child: Builder(builder: (BuildContext context) {
                            final TabController tabController =
                                DefaultTabController.of(context);
                            tabController.addListener(() {
                              if (!tabController.indexIsChanging) {
                                switch (tabController.index) {
                                  case 0:
                                    {
                                      vm.getCategoryMoviesData(28);
                                    } //ACTION
                                    break;
                                  case 1:
                                    {
                                      vm.getCategoryMoviesData(12);
                                    } //ADVENTURE
                                    break;
                                  case 2:
                                    {
                                      vm.getCategoryMoviesData(16);
                                    } //ANIMATION
                                    break;
                                  case 3:
                                    {
                                      vm.getCategoryMoviesData(35);
                                    } //COMEDY
                                    break;
                                  case 4:
                                    {
                                      vm.getCategoryMoviesData(80);
                                    } //CRIME
                                    break;
                                  case 5:
                                    {
                                      vm.getCategoryMoviesData(99);
                                    } //DOCUMENTARY
                                    break;
                                  case 6:
                                    {
                                      vm.getCategoryMoviesData(18);
                                    } //DRAMA
                                    break;
                                  case 7:
                                    {
                                      vm.getCategoryMoviesData(10751);
                                    } //FAMILY
                                    break;
                                  case 8:
                                    {
                                      vm.getCategoryMoviesData(14);
                                    } //FANTASY
                                    break;
                                  case 9:
                                    {
                                      vm.getCategoryMoviesData(10752);
                                    } //WAR
                                    break;
                                }
                              }
                            });
                            return Scaffold(
                              appBar: PreferredSize(
                                preferredSize: Size.fromHeight(59.0),
                                child: AppBar(
                                  elevation: 0.0,
                                  backgroundColor: Colors.white,
                                  bottom: TabBar(
                                    isScrollable: true,
                                    labelPadding: EdgeInsets.symmetric(
                                        horizontal: 45.0, vertical: 0.0),
                                    tabs: [
                                      TabBarTitle(tabTitle: 'Actions'),
                                      TabBarTitle(tabTitle: 'Adventure'),
                                      TabBarTitle(tabTitle: 'Animation'),
                                      TabBarTitle(tabTitle: 'Comedy'),
                                      TabBarTitle(tabTitle: 'Crime'),
                                      TabBarTitle(tabTitle: 'Documentary'),
                                      TabBarTitle(tabTitle: 'Drama'),
                                      TabBarTitle(tabTitle: 'Family'),
                                      TabBarTitle(tabTitle: 'Fantasy'),
                                      TabBarTitle(tabTitle: 'War'),
                                    ],
                                  ),
                                ),
                              ),
                              body: TabBarView(
                                children: [
                                  TabBarViewItem(),
                                  TabBarViewItem(),
                                  TabBarViewItem(),
                                  TabBarViewItem(),
                                  TabBarViewItem(),
                                  TabBarViewItem(),
                                  TabBarViewItem(),
                                  TabBarViewItem(),
                                  TabBarViewItem(),
                                  TabBarViewItem(),
                                ],
                              ),
                            );
                          })),
                    ),
                  )
                ],
              )),
        ));
  }
}
