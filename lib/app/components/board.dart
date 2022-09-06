import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';

class Board extends StatefulWidget {

  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {

  @override
  Widget build(BuildContext context) {
    var controller =
        context.dependOnInheritedWidgetOfExactType<GameController>()!;
    return GridView.builder(
        itemCount: controller.n * controller.n,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: controller.n),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                controller.markCell(index);
              });
            },
            child: Container(
              color: tileColor(index, controller.n),
              child: Center(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constrains) {
                    return Text(
                      controller.get(index),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: constrains.maxHeight * 0.5),
                    );
                  },
                ),
              ),
            ),
          );
        });
  }
}

Color tileColor(int index, int n) {
  int x = index % n;
  int y = index ~/ n;

  return ((x % 2) == 0 && (y % 2) == 0) || ((x % 2) == 1 && (y % 2) == 1)
      ? const Color.fromARGB(255, 198, 179, 113)
      : const Color.fromARGB(255, 107, 60, 15);
}
