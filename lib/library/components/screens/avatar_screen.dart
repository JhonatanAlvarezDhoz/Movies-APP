import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tenguen Uzui'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundColor: Colors.green[700],
              child: const Text('TU'),
            ),
          )
        ],
      ),
      body: const Center(
        child: CircleAvatar(
          maxRadius: 120,
          backgroundImage: NetworkImage(
              'https://areajugones.sport.es/wp-content/uploads/2022/01/kimetsu-tengen-1080x609.jpg.webp'),
        ),
      ),
    );
  }
}
