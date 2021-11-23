import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  const Description({Key? key,
   required this.title, required this.posterPath, required this.genre,
   required this.overview, required this.releaseDate, required this.backdropPath}) : super(key: key);

  final String title, posterPath, genre, overview, releaseDate, backdropPath;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(backdropPath, fit: BoxFit.cover,),
                    )
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 30,
                      alignment: Alignment(0, 0),
                      color: Colors.red,
                      child: Text(
                        "Release Date: "+releaseDate,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lexendDeca()
                      ),
                    )
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Text(
                      title,
                      style: GoogleFonts.lexendDeca(),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            //SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(top:20),
              child: Center(
                child: Text(
                  GenderID(genre).toString()
                )
              )
            ),
            Container(
              width: 10,
              padding: EdgeInsets.only(left: 50,right: 50, top:30),
              child: Text(
                overview,
                style: GoogleFonts.lexendDeca()
              ),
            ),

          ],
        ),
      ),
    );
  } 

}

GenderID(String genre){
    String gen = genre.replaceAll(' ','');
    List<String> data = gen.substring(1,gen.length-1).split(',');
    List<String> genreList = [];

    for( int i = 0; i < data.length; i++){
      if(data[i] == "28"){genreList.add("Action");}
      else if(data[i] == "12"){genreList.add("Adventure"); }
      else if(data[i] == "16"){genreList.add("Animation");}
      else if(data[i] == "35"){genreList.add("Comedy");}
      else if(data[i] == "80"){genreList.add("Crime");}
      else if(data[i] == "99"){genreList.add("Documentary");}
      else if(data[i] == "18"){genreList.add("Drama");}
      else if(data[i] == "18751"){genreList.add("Family");}
      else if(data[i] == "14"){genreList.add("Fantasy");}
      else if(data[i] == "36"){genreList.add("History");}
      else if(data[i] == "27"){genreList.add("Horror");}
      else if(data[i] == "10402"){genreList.add("Music");}
      else if(data[i] == "9648"){genreList.add("Mystery");}
      else if(data[i] == "10749"){genreList.add("Romance");}
      else if(data[i] == "878"){genreList.add("Science Fiction");}
      else if(data[i] == "10770"){genreList.add("TV Movie");}
      else if(data[i] == "53"){genreList.add("Thriller");}
      else if(data[i] == "10752"){genreList.add("War");}
      else if(data[i] == "37"){genreList.add("Western");} 
    }
    
    return genreList;
}