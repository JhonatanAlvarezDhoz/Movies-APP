import 'package:flutter/material.dart';
import 'package:practica/library/components/theme%20/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEneable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Slider && Checks'),
        ),
        body: Column(
          children: [
            Slider.adaptive(
              min: 50,
              max: 400,
              activeColor: AppTheme.primary,
              value: _sliderValue,
              onChanged: _sliderEneable
                  ? (value) {
                      _sliderValue = value;
                      setState(() {});
                    }
                  : null,
            ),
            CheckboxListTile(
                activeColor: AppTheme.primary,
                title: const Text('Habilitar Slider'),
                value: _sliderEneable,
                onChanged: (value) {
                  //* [??] Se utilizan para indicar que si un argumento no esta siendo recibido, coloque uno por defecto.
                  _sliderEneable = value ?? true;
                  setState(() {});
                }),
            SwitchListTile.adaptive(
                activeColor: AppTheme.primary,
                title: const Text('Habilitar Slider'),
                value: _sliderEneable,
                onChanged: (value) {
                  _sliderEneable = value;
                  setState(() {});
                }),
            const AboutListTile(),
            Image(
                width: _sliderValue,
                //! Se Utiliza para que la imagen se adapte a las dimencionnes de su contenedor
                fit: BoxFit.contain,
                image: const NetworkImage(
                    'https://imagenes.20minutos.es/files/og_thumbnail/uploads/imagenes/2019/10/18/Captura-de-pantalla-2019-10-18-a-las-11.48.58.png'))
          ],
        ));
  }
}
