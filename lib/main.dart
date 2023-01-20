import 'package:flutter/material.dart';
import 'package:practica/app_movies/provider/movies_provider.dart';

import 'package:practica/library/components/theme%20/app_theme.dart';

//?import 'package:app/library/components/router/app_routes.dart';
import 'package:provider/provider.dart';

import 'package:practica/app_movies/screens/screens.dart';

//import 'library/components/screens/home_screen.dart';

//import 'package:app/components/screnns/listview1_screen.dart';
//import 'package:app/counter/custom_widget.dart';
void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //! Se debe extender de ChangeNotifier En la clase del provider
        ChangeNotifierProvider(
          create: ((context) => MoviesProvider()),
          lazy: false, //?Notifica que el provaider sera inicializado siempre
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  //* Estos comentarios son de Counter
  //? Estos comentarios son de de library
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //*home: HomeScreen();
        //*home: CounterScreen(.
        //*home: CustomWidget(
        //*home: ListView1Screen(),
        //?initialRoute: AppRoutes.initialRoute,
        //?routes: AppRoutes.getAppRoutes(),
        //?onGenerateRoute: AppRoutes.onGenerateRoute,
        title: 'Movies',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomeScreen(),
          'details': (_) => const DetailsScreen(),
        },

        //*se puede usar para personalizar  EL tema Principal de la App
        theme: AppTheme.lightTheme
        //* onGenerate route vaa pedir su argumento settings, se deberia ver de esta forma
        //*(settings) => AppRoutes.onGenerateRoute(settings) pero se puede retirar
        //*si el argumento que vamos a enviar es el mismo que tenemos y luciria
        //*asi "AppRoutes.onGenerateRoute"

        //*{
        //*routes: recibe una lista la cual se colocan los nombres de las rutas
        //*y estas rutas reciben un una funcion BuildContext que retorna un widget, este seria el screen o la pantalla
        //*isaac me recomendo otra forma
        //*'hone': (context) => const HomeScreen(),
        //*'listView1': (context) => const ListView1Screen(),
        //*'listView2': (BuildContext context) => const ListView2Screen(),
        //*'alert': (context) => const AlertScreen(),
        //*'card': (context) => const CardScreen(),
        //*},
        //* This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
