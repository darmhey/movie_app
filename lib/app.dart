import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_client/api_client.dart';
import 'view/screens/movie_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: RepositoryProvider(
        create: (context) => MovieRepository(),
        child: const MoviePage(),
      ),
    );
  }
}
