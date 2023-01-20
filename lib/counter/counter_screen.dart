import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);
    //En caso de que  sea un valor que se repite, se recomienda usar Variables
    //int counter = 0; para que se pueda reflejar el cambio debemos pasar de una variable a una propiedad

    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        elevation: 3.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Clicks Counter', style: fontSize30),
            Text('$counter', style: const TextStyle(fontSize: 25))
          ],
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          counter++;
          setState(() {});
          //print('$counter');
        }),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
