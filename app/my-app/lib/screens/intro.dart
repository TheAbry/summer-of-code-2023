import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter_application_1/products.dart';
import 'package:flutter_application_1/tiles.dart';

//import 'package:flutter/gestures.dart';

//grabbed products list and initialized an instance to use itemBuilder

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/title.png'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: myRed,
            ),
          ),
        ], //simple app bar which will have more functionality later
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/white-wall.png'),
              repeat: ImageRepeat.repeat,
            ),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  myDarkGrey,
                  g2,
                ])),
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,
              childAspectRatio: 0.67),
          // building ListView with objects of L as items
          itemCount: L.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductTile(index: index, Ls: MyList().products);
          },
        ),
      ),
    );
  }
}
