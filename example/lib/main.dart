import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Card Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListagemScreen(),
    );
  }
}

class ListagemScreen extends StatelessWidget {
  final List<int> lista = List.generate(2000, (int index) => index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Animation Example")),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (BuildContext context,int index) {
          return AnimatedCard(
            direction: AnimatedCardDirection.bottom, //Initial animation direction
            initDelay: Duration(milliseconds: 0), //Delay to initial animation
            duration: Duration(seconds: 1), //Initial animation duration
            curve: Curves.bounceOut, //Animation curve
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                elevation: 5,
                child: ListTile(
                  title: Container(
                    height: 150,
                    child: Center(child: Text("$index")),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
