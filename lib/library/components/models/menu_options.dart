import 'package:flutter/material.dart';

class MenuOptions {
  //final se coloca para cuando se cree una opcion su valor no va a cambiar
  //ademas por ser final necesitan ser inicializadas en un constructor
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

  MenuOptions(
      //se colocan entre llaves para permitir que estos valores sean suministrados en el orden que sea
      {required this.route,
      required this.icon,
      required this.name,
      required this.screen});
}
