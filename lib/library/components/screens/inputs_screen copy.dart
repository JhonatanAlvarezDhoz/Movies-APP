import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form and Input'),
      ),
      body: Center(
        //* --SingleChildScrollView-- Permite el desplazamiento de la screen
        //* 'simulando el escroll' cuando se despliega el teclado
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              children: [
                TextFormField(
                    autofocus: false,
                    initialValue: '',
                    textCapitalization: TextCapitalization.words,
                    onChanged: (value) {
                      print('value: $value');
                    },
                    //? logica del input
                    validator: (value) {
                      if (value == null) return 'Este Campo Es Requerido';
                      return value.length < 8
                          ? 'La contraseña debe contener minimo 8 caracteres'
                          : null;
                    },
                    //*Cuando el usuario este en el field se activara
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        hintText: 'Write your Name', //? PlaceHolder
                        labelText: 'Nombre', //? Label
                        //helperText: 'Solo letras', //? HelpText
                        suffixIcon: Icon(Icons.supervised_user_circle_rounded),
                        //? Icono al final de la caja de
                        icon: Icon(Icons.groups_outlined),
                        border: OutlineInputBorder(
                            //borderRadius: BorderRadius.only(
                            //bottomLeft: Radius.circular(20),
                            //topRight: Radius.circular(20)))),
                            //? Icono descriptivo de la caja de texto
                            )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
