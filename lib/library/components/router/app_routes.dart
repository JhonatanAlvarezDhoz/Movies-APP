import 'package:flutter/material.dart';
import 'package:practica/library/components/models/menu_options.dart';
import 'package:practica/library/components/screens/screens.dart';

class AppRoutes {
  //Si creamos un atributo con la propiedad Static, esto quiere decir que podemos
  //acceder a este mismo sin necesidad de instanciar su clase
  static const initialRoute = 'home';

  //se tiene pensado utilizar el menuOptions para crear el  o construir el mapa
  //que sera leido para crear las rutas, si se desea agregar otra ruta se crea
  //en el menuOptios y de esta forma sera mucho mas facil
  static final menuOptons = <MenuOptions>[
    // Borrar el home

    MenuOptions(
        route: 'listView1',
        icon: Icons.list,
        name: 'List View 1',
        screen: const ListView1Screen()),
    MenuOptions(
        route: 'listView2',
        icon: Icons.list_alt_outlined,
        name: 'List View 2',
        screen: const ListView2Screen()),
    MenuOptions(
        route: 'alert',
        icon: Icons.add_alert_rounded,
        name: 'Alert',
        screen: const AlertScreen()),
    MenuOptions(
        route: 'card',
        icon: Icons.card_membership_outlined,
        name: 'Card',
        screen: const CardScreen()),
    MenuOptions(
        route: 'avatar',
        icon: Icons.supervised_user_circle_outlined,
        name: 'Avatar Screen',
        screen: const AvatarScreen()),
    MenuOptions(
        route: 'animated',
        icon: Icons.play_circle_fill_outlined,
        name: 'Animated Screen',
        screen: const AnimatedScreen()),
    MenuOptions(
      route: 'inputs',
      icon: Icons.input_outlined,
      name: 'Inputs Screen',
      screen: InputScreen(),
    ),
    MenuOptions(
        route: 'slider',
        icon: Icons.sledding_outlined,
        name: 'Slider Sccern',
        screen: const SliderScreen()),
    MenuOptions(
      route: 'listbuilder',
      icon: Icons.line_weight_sharp,
      name: 'List View Builder',
      screen: const ListViewBuilderScreen(),
    )
  ];

  static Map<String, Widget Function(BuildContext context)> getAppRoutes() {
    Map<String, Widget Function(BuildContext context)> appRoutes = {};

    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptons) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext context)> routes = {
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'listView1': (BuildContext context) => const ListView1Screen(),
  //   'listView2': (BuildContext context) => const ListView2Screen(),
  //   'alert': (BuildContext context) => const AlertScreen(),
  //   'card': (BuildContext context) => const CardScreen(),
  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
