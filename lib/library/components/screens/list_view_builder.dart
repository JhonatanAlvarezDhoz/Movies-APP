import 'package:flutter/material.dart';
import 'package:practica/library/components/theme%20/app_theme.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //* accion de scroll
    scrollController.addListener(() {
      //print(
      //  '${scrollController.position.pixels} ${scrollController.position.maxScrollExtent}');
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        //add5();
        fetchData();
      }
    });
  }

  //* Lazy Load
  Future fetchData() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));

    add5();
    isLoading = false;
    setState(() {});

    //!Mostrar y ocultar loading
    //* Logica que indica si la el escroll esta en su tope
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;
    //? Animasion indicativa de la carga
    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  void add5() {
    final lastID = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastID + e).toList());

    setState(() {});
  }

  //? pull to refresh
  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    add5();
  }

  @override
  Widget build(BuildContext context) {
    //? se obtiene el valor del tamaño de la pantalla como independiente de la resolucion del dispositivo
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //? Usamos media cuery para remover el padding superior e inferior en la pantalla, este necesita context para funcionar
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView.builder(
                  //* physics: const BouncingScrollPhysics(), Efecto bouncing de IOS
                  controller: scrollController,
                  itemCount: imagesIds.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FadeInImage(
                        placeholder:
                            const AssetImage('assets/images/jar-loading.gif'),
                        width: double.infinity,
                        height: 299.8,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://picsum.photos/390/300?image=${imagesIds[index]}'));
                  }),
            ),
            if (isLoading)
              Positioned(
                bottom: 40,
                left: size.width * 0.5 - 30,
                child: const _LoadingIcon(),
              )
          ],
        ),
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(.7),
      ),
      child: const CircularProgressIndicator(
        color: AppTheme.primary,
      ),
    );
  }
}
