// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/data/cubit/home_page_cubit.dart';
import 'package:news_app/screens/details_screen.dart';
import 'package:news_app/services/movies_service.dart';

class Sliders extends StatefulWidget {
  final HomePageLoaded state;
  final int index;
  const Sliders({Key? key, required this.state, required this.index})
      : super(key: key);

  @override
  State<Sliders> createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  late HomePageLoaded state;
  late int index;

  @override
  void initState() {
    super.initState();
    state = widget.state;
    index = widget.index;
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailsScreen(movie: state.movies[index])));
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
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        fit: BoxFit.cover,
                        '${MovieService.imagePath}${state.movies[index].posterPath}'
                        // '${MovieService.imagePath}${snapshot.data[index].posterPath}',
                        ),
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
                          state.movies[index].title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.left,
                          softWrap: true,
                          maxLines: 4,
                        ),
                        Text('Vote average: ${state.movies[index].voteAverage}')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
