import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:warnerapp/providers/listview_builder_provider.dart';

class WarnerScreen extends StatefulWidget {
  const WarnerScreen({super.key});

  @override
  State<WarnerScreen> createState() => _WarnerScreenState();
}

class _WarnerScreenState extends State<WarnerScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isListViewScrollable = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < _scrollController.position.maxScrollExtent) {
        setState(() {
          _isListViewScrollable = true;
        });
      } else {
        setState(() {
          _isListViewScrollable = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 50, 63),
      body: Column(
        children: [
          const _HeaderWarnerScreen(),
          const SizedBox(height: 10),
          _BodyWarnerScreen(scrollController: _scrollController, isListViewScrollable: _isListViewScrollable),
        ],
      ),
    );
  }
}

class _BodyWarnerScreen extends StatelessWidget {
  final ScrollController scrollController;
  final bool isListViewScrollable;
  const _BodyWarnerScreen({
    required this.scrollController,
    required this.isListViewScrollable,
  });

  @override
  Widget build(BuildContext context) {
    final listValues = ListviewBuilderProvider().getListValues(context);
    final double sizeWidthContainer;
    if(MediaQuery.of(context).size.width > 1200)
    {
      sizeWidthContainer = MediaQuery.of(context).size.width * 0.4;
    }
    else if(MediaQuery.of(context).size.width > 1000)
    {
      sizeWidthContainer = MediaQuery.of(context).size.width * 0.5;
    }
    else if(MediaQuery.of(context).size.width > 800)
    {
      sizeWidthContainer = MediaQuery.of(context).size.width * 0.6;
    }
    else if(MediaQuery.of(context).size.width > 600)
    {
      sizeWidthContainer = MediaQuery.of(context).size.width * 0.8;
    }
    else
    {
      sizeWidthContainer = MediaQuery.of(context).size.width;
    }

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: sizeWidthContainer,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      color: Color.fromARGB(255, 255, 203, 32),
                    ),
                    child: FilledButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                      ),
                      onPressed: () => context.pop(),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search),
                            SizedBox(width: 10),
                            Text('Buscar'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 2,
                  height: 50,
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Color.fromARGB(255, 255, 203, 32),
                    ),
                    child: FilledButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                      ),
                      onPressed: () => context.pop(),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.event_seat_rounded),
                            SizedBox(width: 10),
                            Text('Mis entradas'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(              
              child: ListView.builder(
                controller: scrollController,
                itemCount: listValues.length,
                itemBuilder: (BuildContext context, int index) {
                  return listValues[index];
                },
              ),
            ),
            if (isListViewScrollable)
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: const Icon
              (
                Icons.arrow_downward,
                size: 30,
                color: Color.fromARGB(255, 39, 39, 39),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _HeaderWarnerScreen extends StatelessWidget {
  const _HeaderWarnerScreen();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("No puedes"),
                    content: const Text("No te puedes escapar de esta página"),
                    actions: [
                      FilledButton(
                        onPressed: () {
                           Navigator.pop(context); 
                        },
                        child: const Text("Aceptar"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255),
              fill: 0.5,
            ),
          ),
        Image.asset(
          "assets/images/logo-warner.png",
          height: MediaQuery.of(context).size.height * 0.15,
          fit: BoxFit.cover,
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Notificaciones vacías"),
                  content: const Text("No tienes notificaciones"),
                  actions: [
                    FilledButton(
                      onPressed: () {
                         Navigator.pop(context);
                      },
                      child: const Text("Aceptar"),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(
            Icons.notifications_none,
            color: Color.fromARGB(255, 255, 255, 255),
            fill: 0.5,
          ),
        ),
      ],
    );
  }
}
