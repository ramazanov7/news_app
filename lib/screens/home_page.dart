import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/cubit/home_page_cubit.dart';
import 'package:news_app/widgets/custom_snack_bar.dart';
import 'package:news_app/widgets/slider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String id = 'homePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RefreshController controller = RefreshController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomePageCubit>(context).onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 41, 41, 41),

        // app bar
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 22, 22, 22),
          title: Text(
            'News',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<HomePageCubit, HomePageState>(
          listener: (context, state) {
            if (state is HomePageError) {
              buildErrorCustomSnackBar(context, state.message);
            }
            if (state is HomePageLoaded) {
              controller.refreshCompleted();
            }
          },
          builder: (context, state) {
            if (state is HomePageEmpty) {
              return const Center(
                child: Text('There is now movies to show'),
              );
            }
            if (state is HomePageLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomePageLoaded) {
              return SmartRefresher(
                controller: controller,
                enablePullUp: true,
                onRefresh: () {
                  BlocProvider.of<HomePageCubit>(context).onRefresh();
                },
                onLoading: () {
                  BlocProvider.of<HomePageCubit>(context).onLoading();
                  controller.loadComplete();
                },
                child: ListView.builder(
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      return Sliders(state: state, index: index);
                    }),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}

 /*
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
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
        )
      */
/* OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
                  return (orientation == Orientation.portrait)
                    ? SmartRefresher(
                        controller: controller,
                        enablePullUp: true,
                        onRefresh: () {
                          BlocProvider.of<HomeCubit>(context).onRefresh();
                        },
                        onLoading: () {
                          BlocProvider.of<HomeCubit>(context).onLoading();
                          controller.loadComplete();
                        },
                        child: ListView.builder(
                          itemCount: state.movies.length,
                          itemBuilder: (context, index) {
                            return PosterContent(
                              state: state,
                              index: index
                            );
                          }
                        ),
                      )
                    : SmartRefresher(
                        controller: controller,
                        enablePullUp: true,
                        onRefresh: () {
                          BlocProvider.of<HomeCubit>(context).onRefresh();
                        },
                        onLoading: () {
                          BlocProvider.of<HomeCubit>(context).onLoading();
                          controller.loadComplete();
                        },
                        child: GridView.builder(
                            itemCount: state.movies.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return PosterContent(
                                  state: state, index: index);
                            }),
                      );
                      
                }
              );*/