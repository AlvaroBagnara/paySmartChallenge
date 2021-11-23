import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pay_smart/API/movie_service.dart';

import 'widgets/releases.dart';

void main() => runApp(new MyApp());

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
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('My Personal Journal');

  List releasesMovies = [];
  final _controller = ScrollController();

  void infiniteScroll() {
    if (_controller.position.atEdge) {
      final isTop = _controller.position.pixels == 0;

      if (isTop) {
      } else {
        MovieService().AddPage();
        loadReleasesMovies();
      }
    }
  }

  @override
  void initState() {
    _controller.addListener(infiniteScroll);
    loadReleasesMovies();
    super.initState();
  }

  loadReleasesMovies() async {
    final movies = await MovieService().getMovies();
    setState(() {
      releasesMovies = movies;
    });
    return movies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay Smart Challenge"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: ListView(children: [
        ReleasesMovies(
          releases: releasesMovies,
          controller: _controller,
        )
      ]),
    );
  }
}
