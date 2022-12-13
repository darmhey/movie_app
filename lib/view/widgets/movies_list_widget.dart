import 'package:flutter/material.dart';
import '../../api_client/src/models/models.dart';

class MoviesListWidget extends StatelessWidget {
  final String imageBaseUrl;
  final String imageUrl;
  //final double myHeight;
  final Movie movie;
  const MoviesListWidget({
    Key? key,
    required this.imageBaseUrl,
    required this.imageUrl,
    //required this.myHeight,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.network(
            imageBaseUrl + imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
