import 'package:flutter/material.dart';

class CustomCardTipe1 extends StatelessWidget {
  const CustomCardTipe1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.photo_album),
            title: Text("I'm Title"),
            subtitle: Text(
              'Ad velit qui dolore consectetur velit commodo occaecat tempor reprehenderit. Ad velit qui dolore consectetur velit commodo occaecat tempor reprehenderit.',
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () => {}, child: const Text('Cancel')),
                TextButton(onPressed: () => {}, child: const Text('OK')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
