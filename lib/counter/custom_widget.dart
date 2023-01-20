import 'package:flutter/material.dart';

import 'custom_widget_floating_bottom.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  int counter = 0;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomWidgetFloatingBotton(
        increaseFn: increase,
        decreaseFn: decrease,
        resetFn: reset,
      ),
    );
  }
}
