import 'package:flutter/material.dart';
import 'app/controllers/game_controller.dart';
import 'app/views/home_view.dart';

void main(List<String> args) {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameController(n: 5, child: HomeView()),
    );
  }
}
