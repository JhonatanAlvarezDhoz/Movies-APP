import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hinText;
  final String? labelText;
  final Icon? iconLeft;
  final Icon? suffixIcon;
  final TextInputType? keyBoardType;
  final bool obscureText;
  final String formProperty;
  final Map<String, String> formValues;

  const CustomInputField({
    Key? key,
    this.hinText,
    this.labelText,
    this.iconLeft,
    this.suffixIcon,
    this.keyBoardType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      keyboardType: keyBoardType,
      obscureText: obscureText,
      onChanged: (value) => formValues[formProperty] = value,

      //? logica del input
      validator: (value) {
        if (value == null) return 'Este Campo Es Requerido';
        return value.length < 8
            ? 'La contraseña debe contener minimo 8 caracteres'
            : null;
      },
      //*Cuando el usuario este en el field se activara
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: hinText, //? PlaceHolder
          labelText: labelText, //? Label
          //helperText: 'Solo letras', //? HelpText
          suffixIcon: suffixIcon,
          //? Icono al final de la caja de
          icon: iconLeft,
          border: const OutlineInputBorder(
              //borderRadius: BorderRadius.only(
              //bottomLeft: Radius.circular(20),
              //topRight: Radius.circular(20))
              )),
      //? Icono descriptivo de la caja de texto
    );
  }
}
