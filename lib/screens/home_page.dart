// ignore_for_file: prefer_const_constructors

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
      backgroundColor: Colors.black,

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
        child: ListView.builder(
          // lenght of news feeds. ex: 10
          itemCount: 10,
          itemBuilder:(context, index) {

            // Section
            return Container(
              child: FutureBuilder(
                future: trendingMoves,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return NewsCard();
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              )
            );
          },
        ),
      )
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(top: 10),
      title: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 186, 192),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}
