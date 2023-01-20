import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Title'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Veniam id et deserunt labore non sunt in.'),
                SizedBox(
                  height: 25,
                ),
                FlutterLogo(
                  size: 100,
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'OK',
                  )),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child:
                    const Text('Cancel', style: TextStyle(color: Colors.red)),
              )
            ],
          );
        });
  }

  //*Pasamos el contexto por parametros debido a que el showDialog necesita el
  //*contexto en el cual esta trabajando
  void displayDialogAndroid(BuildContext context) {
    showDialog(
        //* barrierDismissible: se usa para que salga de la pantalla de dialogo haciendo tap en la zona gris
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              title: const Text('Title'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Veniam id et deserunt labore non sunt in.'),
                  SizedBox(
                    height: 25,
                  ),
                  FlutterLogo(
                    size: 100,
                  ),
                  //? De esta forma se puede hacer el boton cancel, pero AlertDialog
                  //? tiene una propiedad para realizar acciones dentro de las alertas,
                  //? llamada actions
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     TextButton(
                  //         onPressed: () => Navigator.pop(context),
                  //         child: const Text('Cancel'))
                  //   ],
                  // )
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'OK',
                    )),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child:
                      const Text('Cancel', style: TextStyle(color: Colors.red)),
                )
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //* si se le quiere dar stilo a un elvated button se debe colocar la
        //*propiedad style se accede a el mismo widget ElevatedButton y styleForm
        child: ElevatedButton(
            // style: ElevatedButton.styleFrom(
            //     primary: AppTheme.primary, shape: const StadiumBorder()),
            //! Debemos pasar el contexto en el onPressed de esta forma para
            //! poder utilizar un metodo void sque cambia estados sin necesidad
            //! de utilizar un StateFullWidget

            //* Si hace uso de operador ternario para elegir cual es el metodo
            //* a elegir dependiendo del S.O. respectivamente, previamente se de
            //* importar 'dart:io' mediate el widgwt Platform
            onPressed: () => Platform.isAndroid
                ? displayDialogAndroid(context)
                : displayDialogIOS(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 11, horizontal: 5),
              child: Text(
                'Generator By Alert',
                style: TextStyle(fontSize: 14.5),
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
            //print('Alerta Cerrada');
          },
          child: const Icon(Icons.close_rounded)),
    );
  }
}
