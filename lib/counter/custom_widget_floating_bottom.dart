import 'package:flutter/material.dart';

class CustomWidgetFloatingBotton extends StatelessWidget {
  final Function() increaseFn;
  final Function() decreaseFn;
  final Function() resetFn;

  const CustomWidgetFloatingBotton({
    Key? key,
    required this.increaseFn,
    required this.decreaseFn,
    required this.resetFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
            onPressed: increaseFn,
            child: const Icon(Icons
                .exposure_plus_1_outlined) //() => setState(() => counter++),
            ),
        //const SizedBox(width: 40,),

        FloatingActionButton(
            onPressed: resetFn,
            child: const Icon(
                Icons.restart_alt_outlined) //() => setState(() => counter = 0),
            ),

        //const SizedBox(width: 40,),
        FloatingActionButton(
            onPressed: decreaseFn,
            child: const Icon(Icons
                .exposure_minus_1_outlined) //() => setState(() => counter--),

            ),
      ],
    );
  }
}
