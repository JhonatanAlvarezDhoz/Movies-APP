import 'package:flutter/material.dart';

class CustomnCardType2 extends StatelessWidget {
  final String imageURL;
  final String? imageName;

  const CustomnCardType2({Key? key, required this.imageURL, this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      //Se utiliza para que la imagen no pase sobre el diseño de la card y
      //siempre se mantenga dentro de los perimetros de este mismo
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      //se utilliza para redondear bordes "Border Radius en CSS"
      elevation: 30,
      shadowColor: Colors.blue.withOpacity(0.5),
      child: Column(
        children: [
          FadeInImage(
            //Permite realizar pantallas de craga mientras la imagen termina de cargar
            image: NetworkImage(imageURL),
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            //Es la imagen que se renderiza antes de la imagen final, y debe ser
            // un recurso de la app(Assets)
            width: double.infinity,
            //se suele usuar en column para que la la imagen abarque el total
            //del ancho permitido
            height: 320,
            fit: BoxFit.cover,
            //se utiliza para que la imagen ocupe todo el ancho de a disponibilidad
            fadeInDuration: const Duration(milliseconds: 300),
          ),

          //*Texto Descriptivo
          if (imageName != null)
            Container(
                alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsets.only(right: 20, top: 5, bottom: 5),
                child: Text(imageName ?? 'No Title')),
        ],
      ),
    );
  }
}
