// ignore: file_names
import 'package:flutter/material.dart';

//Este widgwt se puede construir con el snipet "s-screnn"
class ListView1Screen extends StatelessWidget {
  //Las listas y variables siempre dentro de la clase  antes del override
  final games = const [
    'Megaman',
    'Metal Gear',
    'God of War',
    'Donkey Kong',
    'MetroMan',
    'The Mask',
  ];

  const ListView1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Tipo A'),
      ),
      body: ListView(children: [
        //"..." Operador spread: desempaqueta datos de una lista en otra lista.
        ...games
            .map((e) => ListTile(
                  title: Text(e),
                  //leading: const Icon(Icons.arrow_forward_ios_outlined),
                  // leading se utiliza para comolocar un icono en la parte izquierda de el item en la lista
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ))
            .toList()
      ]),
    );
  }
}
