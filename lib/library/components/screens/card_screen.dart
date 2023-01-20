import 'package:flutter/material.dart';
import 'package:practica/library/components/widgtes/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        //generar padding entre elementos
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

        children: const [
          CustomCardTipe1(),
          //MyCustomnCard()
          SizedBox(
            height: 10,
          ),
          CustomnCardType2(
              imageURL:
                  'https://media.moddb.com/images/members/5/4550/4549205/duck.jpg',
              imageName: 'Pato Banana'),
          SizedBox(
            height: 15,
          ),
          CustomnCardType2(
              imageURL:
                  'https://i.pinimg.com/280x280_RS/0a/f8/28/0af8286192fdb43208a1a3f4899be348.jpg',
              imageName: 'Perro Millos'),
          SizedBox(
            height: 15,
          ),

          CustomnCardType2(
            imageURL:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_t-XO0pcCTdqG2IxxFy_MEMC9jNSWMjPlnYoGR1PAz1Gaso_XBHuXrkZMQHOMYXEimew&usqp=CAU',
            //imageName: 'Perro Ingeniero'
          )
        ],
      ),
    );
  }
}
