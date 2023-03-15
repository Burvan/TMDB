import 'package:flutter/material.dart';

import 'movie_details_main_info_widget.dart';
import 'movie_details_series_cast_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  const MovieDetailsWidget({
    Key? key,
    required this.movieId
  }) : super(key: key);

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tom Clancy\'s without Remorse'),
        centerTitle: true,
      ),
      body: ColoredBox(
        color: Color.fromRGBO(24, 27, 23, 1),
        child: ListView(
          physics: ScrollPhysics(
              parent: BouncingScrollPhysics()
          ),
          children: [
            MovieDetailsMainInfoWidget(),
            MovieDetailsSeriesCastWidget(),
          ],
        ),
      ),
    );
  }
}
