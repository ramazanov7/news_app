import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/cubit/home_page_cubit.dart';
import 'package:news_app/screens/home_page.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomePageCubit>(create: (context) => HomePageCubit())
        ],
        child: MaterialApp(
          title: 'Flutter App',
          initialRoute: HomePage.id,
          routes: {
            HomePage.id: (context) => HomePage(),
          },
        ));
  }
}
