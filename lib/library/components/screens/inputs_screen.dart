import 'package:flutter/material.dart';
import 'package:practica/library/components/widgtes/custon_input_field.dart';

class InputScreen extends StatelessWidget {
  InputScreen({Key? key}) : super(key: key);

  //? Un Key se utiliza para hacer referensia a un widget para manejar su estado
  static final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

  Map<String, String> formValues = {
    'first_name': 'Juan',
    'role': 'Admin',
    'email': 'jperez@test.com',
    'password': '654321',
    'about_you': 'test',
  };

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
            child: Form(
              key: myFormKey,
              child: Column(
                children: [
                  CustomInputField(
                    hinText: 'Write your Name',
                    labelText: 'Name',
                    iconLeft: const Icon(Icons.person),
                    suffixIcon: const Icon(Icons.workspace_premium_outlined),
                    formProperty: 'first_name',
                    formValues: formValues,
                  ),
                  const SizedBox(height: 20),
                  CustomInputField(
                    hinText: 'Insert e-mail',
                    labelText: 'e-mail',
                    iconLeft: const Icon(Icons.email),
                    suffixIcon: const Icon(Icons.unsubscribe_rounded),
                    keyBoardType: TextInputType.emailAddress,
                    formProperty: 'email',
                    formValues: formValues,
                  ),
                  const SizedBox(height: 20),
                  CustomInputField(
                    hinText: 'Insert Password',
                    labelText: 'Password',
                    iconLeft: const Icon(Icons.password_outlined),
                    suffixIcon: const Icon(Icons.drag_indicator_rounded),
                    obscureText: true,
                    formProperty: 'password',
                    formValues: formValues,
                  ),
                  const SizedBox(height: 20),
                  CustomInputField(
                    hinText: 'M or F',
                    labelText: 'Gender',
                    iconLeft: const Icon(Icons.male_outlined),
                    suffixIcon: const Icon(Icons.charging_station_outlined),
                    formProperty: 'gender',
                    formValues: formValues,
                  ),
                  const SizedBox(height: 20),
                  CustomInputField(
                    hinText: 'Write',
                    labelText: 'About You',
                    iconLeft: const Icon(Icons.library_books_rounded),
                    suffixIcon: const Icon(Icons.chat_outlined),
                    formProperty: 'about_you',
                    formValues: formValues,
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                      items: const [
                        DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                        DropdownMenuItem(
                            value: 'Super User', child: Text('Super User')),
                        DropdownMenuItem(value: 'User', child: Text('User')),
                      ],
                      onChanged: (value) {
                        formValues['role'] = value ?? 'Admin';
                      }),
                  ElevatedButton(
                      child: const SizedBox(
                        width: 130,
                        child: Center(child: Text('Submit')),
                      ),
                      onPressed: () {
                        //? se utiliza para que desaparezca el focus en el teclado, luego de presionar el boton
                        FocusScope.of(context).requestFocus(FocusNode());

                        //* En caso de que las validaciones en los campos se disparen se activa este condicional
                        if (!myFormKey.currentState!.validate()) {
                          print('Formulario no valido');
                        }
                        print(formValues);
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
