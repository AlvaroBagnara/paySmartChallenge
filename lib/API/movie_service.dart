import 'dart:convert';

import 'package:dio/dio.dart';

int page = 1;
List<Movie> movies = [];

class MovieService{
  final String apiKey = "5b24679c2f734a10a09f391a013e3fd8";
  final Dio _dio = Dio();
  

  Future<List<Movie>> getMovies() async {
    final response = await _dio.get(
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${apiKey}&language=en-US&page=${page}"
    );
    final results = List<Map<String, dynamic>>.from(response.data['results']); 
    List<Movie> movie = results.map((movieData) => Movie.fromMap(movieData)).toList();
    movies.addAll(movie);
    return movies;
  }
  AddPage(){
    page++;
  }
}

class Movie {
  String title;
  String ?posterPath;
  String genre;
  String overview;
  String releaseDate;
  String ?backdropPath;
  Movie({
    required this.title,
    this.posterPath,
    required this.genre,
    required this.overview,
    required this.releaseDate,
    this.backdropPath,
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