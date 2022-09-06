import 'package:flutter/material.dart';

class GameController extends InheritedNotifier<ValueNotifier<List<String>>> {
  final int n;
  late List<List<String>> boardMatrix;
  late String currentPlayer;

  GameController({Key? key, required Widget child, required this.n})
      : super(
            key: key,
            child: child,
            notifier: ValueNotifier(['', 'notStarted'])) {
    currentPlayer = "Circle";
    boardMatrix = List.generate(n, (_) => List.filled(n, ''));
  }

  String get winner => notifier!.value[0];
  String get status => notifier!.value[1];

  void resetBoard() {
    boardMatrix = List.generate(n, (_) => List.filled(n, ''));
    notifier!.value = ['', 'notStarted'];
  }

  void markCell(int index) {
    notifier!.value[1] = "Running";
    int y = index % n;
    int x = index ~/ n;

    if (boardMatrix[x][y] == '' && winner == '') {
      currentPlayer == "Circle"
          ? boardMatrix[x][y] = 'O'
          : boardMatrix[x][y] = 'X';
      changePlayer();
      checkWinner();
    }
    // print("$x $y ${boardMatrix[x][y]}");
    // print("$boardMatrix");
  }

  void changePlayer() {
    currentPlayer == "Circle"
        ? currentPlayer = "Cross"
        : currentPlayer = "Circle";
  }

  String get(int index) {
    return boardMatrix[index ~/ n][index % n];
  }

  checkRow() {
    for (int i = 0; i < n; i++) {
      bool sequence = true;
      for (int j = 0; j < n; j++) {
        if (boardMatrix[i][0] != boardMatrix[i][j]) sequence = false;
      }
      if (sequence && boardMatrix[i][0] != '') {
        notifier!.value = [pieceToPlayer(boardMatrix[i][0]), "Running"];
      }
    }
  }

  checkColumn() {
    for (int j = 0; j < n; j++) {
      bool sequence = true;
      for (int i = 0; i < n; i++) {
        if (boardMatrix[0][j] != boardMatrix[i][j]) sequence = false;
      }
      if (sequence && boardMatrix[0][j] != '') {
        notifier!.value = [pieceToPlayer(boardMatrix[0][j]), "Running"];
      }
    }
  }

  checkDiagonal() {
    bool sequence = true;
    for (int i = 0; i < n; i++) {
      if (boardMatrix[0][0] != boardMatrix[i][i]) sequence = false;
    }
    if (sequence && boardMatrix[0][0] != '') {
      notifier!.value = [pieceToPlayer(boardMatrix[0][0]), "Running"];
    }

    bool sequence2 = true;
    for (int i = 0; i < n; i++) {
      if (boardMatrix[0][n - 1] != boardMatrix[i][n - 1 - i]) sequence2 = false;
    }
    if (sequence2 && boardMatrix[0][n - 1] != '') {
      notifier!.value = [pieceToPlayer(boardMatrix[0][n - 1]), "Running"];
    }
  }

  String pieceToPlayer(String p) {
    if (p == "O") {
      return 'Circle';
    } else if (p == "X") {
      return 'Cross';
    } else {
      return '';
    }
  }

  void checkWinner() {
    checkRow();
    checkColumn();
    checkDiagonal();
    if (notifier!.value != ['', "Running"]) print(notifier!.value);
  }
}
