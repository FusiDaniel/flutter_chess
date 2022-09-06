import 'package:flutter/material.dart';
import 'package:flutter_chess/app/controllers/board_controller.dart';

import '../components/board.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final int n = 3;
  late BoardController boardController;

  @override
  void initState() {
    super.initState();
    boardController = BoardController(n: n);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 173, 226),
        body: Column(
          children: [
            Expanded(
              child: Text('${boardController.winner}')
            ),
            Expanded(
                flex: 3,
                child: Board(
                  n: n,
                  boardController: boardController,
                )),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ));
  }

  void _showWinDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Winner ${boardController.winner}'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      boardController.resetBoard();
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Play Again'))
            ],
          );
        });
  }
}
