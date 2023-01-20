import 'package:flutter/material.dart';

class AddActions extends StatefulWidget {
  const AddActions({Key? key}) : super(key: key);

  @override
  State<AddActions> createState() => _AddActionsState();
}

class _AddActionsState extends State<AddActions> {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            // onPressed: (() {
            //  counter++;
            //  setState(() {});
            //print('$counter');
            onPressed: () => setState(() => counter++),
            child: const Icon(
              Icons.exposure_plus_1_outlined,
            ),
          ),
          //const SizedBox(width: 40,),

          FloatingActionButton(
            onPressed: () => setState(() => counter = 0),
            child: const Icon(Icons.restart_alt_outlined),
          ),

          //const SizedBox(width: 40,),
          FloatingActionButton(
            //onPressed: (() {
            //counter--;
            //setState(() {});
            //print('$counter');
            onPressed: () => setState(() => counter--),
            child: const Icon(
              Icons.exposure_minus_1_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
