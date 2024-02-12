// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/details_screen.dart';
import 'package:news_app/services/news_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<void> _refresh() {
  return Future.delayed(Duration(seconds: 2));
}

class _HomePageState extends State<HomePage> {
  late Future<List<News>> trendingMoves;

  @override
  void initState() {
    super.initState();

    trendingMoves = NewsService().getTrendingMovies();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 41, 41, 41),
    
        // app bar
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 22, 22, 22),
          title: Text(
            'News',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
    
        // body
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: Padding(
            padding: const EdgeInsets.only( left: 15, right: 15),
            child: FutureBuilder(
              future: trendingMoves,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return TrendingSlider(
                    snapshot: snapshot,
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
  }
}

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        // lenght of news feeds. ex: 10
        itemCount: 20,
        itemBuilder: (context, index) {
          // Section
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(movie: snapshot.data[index])),
              );
            },
            child: ListTile(
              contentPadding: EdgeInsets.only(top: 10),
              title: Container(
                height: 180,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.teal[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    // image 
                    Container(
                      width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: ClipRRect(
                          child: Image.network(
                            fit: BoxFit.cover,
                            '${NewsService.imagePath}${snapshot.data[index].posterPath}',
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                    ),
                    SizedBox(width: 20,),

                    // title, vote average
                    Flexible(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${snapshot.data[index].title}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                
                              ),
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              maxLines: 4,
                            ),
                            Text('Vote average: ${snapshot.data[index].voteAverage}',
                            )
                          ],
                        ),
                      ),
                    ) ,
                    
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
