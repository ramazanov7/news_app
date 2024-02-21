// ignore_for_file: sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:news_app/screens/details_screen.dart';
import 'package:news_app/services/movies_service.dart';

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
        itemCount: 10,
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
                          '${MovieService.imagePath}${snapshot.data[index].posterPath}',
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),

                    // title, vote average
                    Flexible(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${snapshot.data[index].title}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              maxLines: 4,
                            ),
                            Text(
                              'Vote average: ${snapshot.data[index].voteAverage}',
                            )
                          ],
                        ),
                      ),
                    ),
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
