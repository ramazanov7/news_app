// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_service.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final News movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          // App bar 
          SliverAppBar.large(

            // back button
            leading: Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.only(top: 16, left: 16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 34, 34, 34),
                borderRadius: BorderRadius.circular(8),
                
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
              ),
            ),

            // 
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)
                ),
                child: Image.network(
                  '${NewsService.imagePath}${movie.backdropPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    movie.overview,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    child: Row(
                      children: [

                        // Release date 
                        Container(
                          
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Release date: ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                movie.releaseDate,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 10,),

                        // Vote average 
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rating: ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              // Icon(
                              //   Icons.star,
                              //   color: Colors.yellow,
                              //   size: 15,
                              // ),
                              Text(
                                '${movie.voteAverage.toString()}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}