import 'package:flutter/material.dart';
import 'package:movie_app/view/widgets/main_screen_widgets/now_playing.dart';
import 'package:movie_app/view/widgets/main_screen_widgets/popular.dart';
import 'package:movie_app/view/widgets/main_screen_widgets/top_rated.dart';

import '../widgets/main_screen_widgets/upcoming.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
