import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/mainscreen.dart';

import 'api_client/api_client.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => MovieRepository(),
        child: const Scaffold(
          backgroundColor: Colors.black,
          body: MainScreen(),
        ),
      ),
    );
  }
}
