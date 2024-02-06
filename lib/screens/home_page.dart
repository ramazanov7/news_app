// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 29, 29),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 52, 52, 52),
        // elevation: 5.0,
        title: Text('News',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: ListView.builder(
          // lenght of news feeds. ex: 10
          itemCount: 10,
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
              ),
            );
          },
        ),
      )
    );
  }
}
