import 'package:flutter/material.dart';
import '../../api_client/src/models/models.dart';

class MoviesListWidget extends StatelessWidget {
  final String imageBaseUrl;
  final String imageUrl;
  final double height;
  final double width;
  final Movie movies;
  const MoviesListWidget({
    Key? key,
    required this.imageBaseUrl,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 1000, //MediaQuery.of(context).size.height * 0.7,
        width: double.infinity,
        child: GestureDetector(
          onTap: () {},
          child: Image.network(
            imageBaseUrl + imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}


// Container(
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
//       height: height,
//       child: ListView.builder(
//         itemCount: movies.length,
//         scrollDirection: Axis.vertical,
//         itemBuilder: (context, index) {
//           return Center(
//             child: Column(
//               children: [
//                 Text(
//                   movies[index].overview!,
//                   style: const TextStyle(
//                     color: Colors.red,
//                     fontSize: 20,
//                   ),
//                 ),
//                 GestureDetector(
//                     onTap: () {},
//                     child: Image.network(
//                       imageBaseUrl + movies[index].backdrop!,
//                       fit: BoxFit.fill,
//                     )),
//               ],
//             ),
//           );
//         },
//       ),
//     );