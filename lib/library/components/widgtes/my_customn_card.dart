import 'package:flutter/material.dart';

class MyCustomnCard extends StatelessWidget {
  const MyCustomnCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.grey)]),
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcnYSWTQuydq7XnvBU2Y_Z_ZgpwdgQeD4RMSH7iwAdmg&s'),
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 200,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Soy un titulo',
                  textAlign: TextAlign.left,
                ),
                Text('Soy un parrafo')
              ],
            ),
          )
        ],
      ),
    );
  }
}
