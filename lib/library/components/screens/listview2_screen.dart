import 'package:flutter/material.dart';

//Este widgwt se puede construir con el snipet "s-screnn"
class ListView2Screen extends StatelessWidget {
  //Las listas y variables siempre dentro de la clase  antes del override
  final games = const [
    'Megaman',
    'Metal Gear',
    'God of War',
    'Donkey Kong',
    'MetroMan',
    'The Mask',
  ];

  const ListView2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List View Tipo B'),
        ),
        body: ListView.separated(
            // ListView.builder => se utiliza igual que separated con la diferencia de que no necesita la propiedad de separatorBulder
            //itemBuilder: indica como se va a construir el item de la lista
            itemBuilder: (context, index) => ListTile(
                  title: Text(games[index]),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.indigo,
                  ),
                  onTap: () {
                    print(games[index]);
                  },
                ),
            //separatorBuilder:  se utiliza para poder colocar el divisor se usa esta convencion "_ , __" con la finalidada de indicar que esos parametros no sera usados.
            separatorBuilder: (_, __) => const Divider(),
            // itemCount: hace referencia a la cantidada de veces que de realizar la accion (Iterable)
            itemCount: games.length));
  }
}
