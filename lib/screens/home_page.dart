

import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  late Future<List<News>> trendingMoves;

  @override
  void initState(){
    super.initState();

    trendingMoves = NewsService().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,

      // app bar
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('News',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),

      // body 
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Container(
          child: FutureBuilder(
            future: trendingMoves,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return TrendingSlider(snapshot: snapshot,);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      )
    );
  }
}

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        // lenght of news feeds. ex: 10
        itemCount: 20,
        itemBuilder:(context, index) {
      
          // Section
          return ListTile(
            contentPadding: EdgeInsets.only(top: 10),
            title: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 186, 192),
                borderRadius: BorderRadius.circular(20)
              ),
              child: SizedBox(
                height: 200,
                child: Image.network(
                  fit: BoxFit.fitHeight,
                  '${NewsService.imagePath}${snapshot.data[index].posterPath}'
                ),
                
              ),
            ),
          );
        },
      ),
    );
  }
}
