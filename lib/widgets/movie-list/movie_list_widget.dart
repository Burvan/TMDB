import 'package:flutter/material.dart';
//import 'package:tm_db/app_images/app_images.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie(
      {required this.id,
      required this.imageName,
      required this.title,
      required this.time,
      required this.description});
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
        id: 1,
        imageName: 'images/prison1.webp',
        title: 'Prison break',
        time: 'April 12, 1982',
        description: 'It\'s a favourite film of all cool boys'),
    Movie(
        id: 2,
        imageName: 'images/prison1.webp',
        title: 'Spider man',
        time: 'April 12, 1982',
        description: 'It\'s a favourite film of all cool boys'),
    Movie(
        id: 3,
        imageName: 'images/prison1.webp',
        title: 'Titanic',
        time: 'April 12, 1982',
        description: 'It\'s a favourite film of all cool boys'),
    Movie(
        id: 4,
        imageName: 'images/prison1.webp',
        title: 'Time',
        time: 'April 12, 1982',
        description: 'It\'s a favourite film of all cool boys'),
    Movie(
        id: 5,
        imageName: 'images/prison1.webp',
        title: 'Rocky',
        time: 'April 12, 1982',
        description: 'It\'s a favourite film of all cool boys'),
    Movie(
        id: 6,
        imageName: 'images/prison1.webp',
        title: 'Richmond',
        time: 'April 12, 1982',
        description: 'It\'s a favourite film of all cool boys'),
    Movie(
        id: 7,
        imageName: 'images/prison1.webp',
        title: 'Dumb and dumber',
        time: 'April 12, 1982',
        description: 'It\'s a favourite film of all cool boys'),
    Movie(
        id: 8,
        imageName: 'images/prison1.webp',
        title: 'Rocky II',
        time: 'April 12, 1982',
        description: 'It\'s a favourite film of all cool boys'),
  ];

  final _searchController = TextEditingController();

  var _filteredMovies = <Movie>[];

  void _searchMovies() {
    final query = _searchController.text;
    setState(() {
      if (query.isNotEmpty) {
        _filteredMovies = _movies.where((Movie movie) {
          return movie.title.toLowerCase().contains(query.toLowerCase());
        }).toList();
      } else {
        _filteredMovies = _movies;
      }
    });
  }

  void _onMovieTap(int index) {
    final id = _movies[index];
    Navigator.of(context)
        .pushNamed('/main_screen/movie_details', arguments: id);
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          physics: ScrollPhysics(
            parent: BouncingScrollPhysics()
          ),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(top: 70),
            itemCount: _filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 8,
                                offset: Offset(0, 2)),
                          ],
                          border:
                              Border.all(color: Colors.black.withOpacity(0.2)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Image(image: AssetImage(movie.imageName)),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  movie.time,
                                  style: TextStyle(color: Colors.grey),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  movie.description,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _onMovieTap(index), // анонимная функция,
                        //внутри которой мы вызываем _onMovieTap и передаём туда индекс
                      ),
                    ),
                  ],
                ),
              );
            }),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
