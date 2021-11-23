import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_smart/description.dart';

class ReleasesMovies extends StatelessWidget {

  
  final List releases;
  final ScrollController controller;

  const ReleasesMovies({Key? key, required this.releases,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double heigh = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final double height = heigh - kToolbarHeight;

    return Container(
      child: Column(
        children: [
          Container(
            height: height,
            child: ListView.builder(
              controller: controller,
              scrollDirection: Axis.vertical,
              itemCount: releases.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => Description(
                          title: releases[index].title,
                          posterPath: releases[index].fullImageUrl,
                          genre: releases[index].genre,
                          overview: releases[index].overview,
                          releaseDate: releases[index].releaseDate,
                          backdropPath: releases[index].fullbackdropUrl
                        )
                      )
                    );
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 340,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                releases[index].fullImageUrl.toString()
                              )
                            )
                          ),
                        ),
                        Container(
                          width: 340,
                          child: Text(
                            releases[index].title.toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lexendDeca(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],),
    );
  }
}