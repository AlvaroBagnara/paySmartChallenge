import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pay_smart/API/movie_service.dart';

import 'widgets/releases.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List releasesMovies = [];  

  @override
  void initState() {
    loadReleasesMovies();
    super.initState();
  }

  loadReleasesMovies() async{
    final movies = await MovieService().getMovies();
    //print(a.map((movie) => movie.title));
    setState(() {
      releasesMovies = movies;
    });
    //print(releasesMovies);
    return movies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay Smart Challenge"),       
      ),
      body: ListView(
        children:[
          ReleasesMovies(releases: releasesMovies)
        ]
      ),
    );
  }

  
}

