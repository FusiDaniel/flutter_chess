import 'package:flutter/material.dart';
import 'package:flutter_chess/app/components/hud.dart';
import 'package:flutter_chess/app/controllers/game_controller.dart';

import '../components/board.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // late GameController gameController;

  @override
  void initState() {
    super.initState();
    // gameController = GameController(n: n);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 173, 226),
        body: Column(
          children: [
            const Expanded(child: Center(child: HUD())),
            Expanded(
                flex: 3,
                child: Board()),
            const Expanded(
              child: SizedBox(),
            ),
          ],
        ));
  }
}
