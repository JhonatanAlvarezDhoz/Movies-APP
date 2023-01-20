import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);
    //En caso de que  sea un valor que se repite, se recomienda usar Variables
    int counter = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        elevation: 3.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Clicks Counter', style: fontSize30),
            Text('10', style: TextStyle(fontSize: 25))
          ],
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          counter++;
          //print('$counter');
        }),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
