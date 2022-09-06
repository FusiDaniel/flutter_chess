import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';

class HUD extends StatefulWidget {
  const HUD({super.key});

  @override
  State<HUD> createState() => _HUDState();
}

class _HUDState extends State<HUD> {
  @override
  Widget build(BuildContext context) {
    var controller =
        context.dependOnInheritedWidgetOfExactType<GameController>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Winner: ${controller.winner}",
          style: const TextStyle(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                controller.resetBoard();
              });
            },
            child: Image.asset(
              'assets/pieces/Bhorse.png',
              width: 75,
            ))
      ],
    );
  }
}
