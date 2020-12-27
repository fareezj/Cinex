import 'package:cinex/ui/dashboard.dart';
import 'package:cinex/ui/movie_details.dart';
import 'package:cinex/ui/upcoming_movies.dart';
import 'package:cinex/viewmodel/movie_details_view_model.dart';
import 'package:cinex/viewmodel/movie_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieViewModel>(create: (_) => MovieViewModel()),
        ChangeNotifierProvider<MovieDetailsViewModel>(create: (_) => MovieDetailsViewModel()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          routes: {
            '/upcoming': (context) => UpcomingMovies(),
            '/movieDetails': (context) => MovieDetails(),
          },
          home: Dashboard()),
    );
  }
}
