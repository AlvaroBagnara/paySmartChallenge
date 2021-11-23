import 'dart:convert';

import 'package:dio/dio.dart';

class MovieService{
  final String apiKey = "";
  final Dio _dio = Dio();

  Future<List<Movie>> getMovies() async {
    final response = await _dio.get(
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${apiKey}&language=en-US&page=1"
    );
    final results = List<Map<String, dynamic>>.from(response.data['results']); // OK
    List<Movie> movies = results.map((movieData) => Movie.fromMap(movieData)).toList(growable:false);
    //Lista nao cresce com o growable.
    
    return movies;
  }
}

class Movie {
  String title;
  String posterPath;
  String genre;
  String overview;
  String releaseDate;
  String backdropPath;
  Movie({
    required this.title,
    required this.posterPath,
    required this.genre,
    required this.overview,
    required this.releaseDate,
    required this.backdropPath,
  });

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w200$posterPath';
  String get fullbackdropUrl => 'https://image.tmdb.org/t/p/w200$backdropPath';

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      posterPath: map['poster_path'],
      genre: map['genre_ids'].toString(),
      overview: map['overview'],
      releaseDate: map['release_date'],
      backdropPath: map['backdrop_path'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': posterPath,
      'genre_ids': genre,
      'overview': overview,
      'release_date' : releaseDate,
      'backdrop_path' : backdropPath,
    };
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  @override
  String toString() => 'Movie(title: $title, posterPath: $posterPath,genre_ids: $genre,overview: $overview, release_date: $releaseDate, backdrop_path: $backdropPath)';
  
}