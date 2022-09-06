import 'package:flutter/material.dart';
import '../controllers/board_controller.dart';

class Board extends StatefulWidget {
  final int n;
  final BoardController boardController;
  const Board({super.key, required this.n, required this.boardController});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  late int n;
  late BoardController boardController;

  @override
  void initState() {
    super.initState();
    n = widget.n;
    boardController = widget.boardController;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: n * n,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: n),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                boardController.markCell(index);
              });
            },
            child: Container(
              color: tileColor(index, n),
              child: Center(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constrains) {
                    return Text(
                      boardController.get(index),
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
