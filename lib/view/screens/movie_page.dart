import 'package:flutter/material.dart';
import 'package:movie_app/view/widgets/now_playing.dart';
import 'package:movie_app/view/widgets/popular.dart';
import 'package:movie_app/view/widgets/top_rated.dart';
import 'package:movie_app/view/widgets/upcoming.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Upcoming(),
          NowPlaying(),
          TopRated(),
          Popular(),
        ],
      ),
    );
  }
}
