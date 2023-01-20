import 'package:flutter/material.dart';

import 'package:practica/library/components/router/app_routes.dart';
import 'package:practica/library/components/theme%20/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //si se desea crear una variable debe ser dentro del build
    final menuOption = AppRoutes.menuOptons;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Components by Home Sccreen'),
        ),
        body: ListView.separated(
            itemBuilder: (context, i) => ListTile(
                  title: Text(menuOption[i].name),
                  leading: Icon(
                    menuOption[i].icon,
                    color: AppTheme.primary,
                  ),
                  onTap: () {
                    //final route = MaterialPageRoute(
                    //builder: (context) => const ListView1Screen());
                    //Navigator.push(context, route);
                    //Se puede usar este tipo de enrutamiento, pero no es
                    //recomendable debido a que hace que el codigo cresca
                    //mucho y sea menos legible

                    //Navigator.pushNamed(context, routeName) recibe como
                    //parametro un contexto de tipo BuildContext y un nombre de
                    //la ruta los cuales definimos en el home_screen
                    Navigator.pushNamed(context, menuOption[i].route);
                  },
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: AppRoutes.menuOptons.length));
  }
}
