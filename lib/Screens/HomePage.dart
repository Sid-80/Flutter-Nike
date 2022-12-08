import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration:const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("https://i.pinimg.com/originals/ec/be/66/ecbe663b0e8c0652ee5ef967b401d45c.jpg"),
                    fit: BoxFit.cover
                  ),
                ),
              ),
              Container(
                padding:const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/content');
                            },
                            child: Icon(Icons.navigate_next),
                            backgroundColor: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}