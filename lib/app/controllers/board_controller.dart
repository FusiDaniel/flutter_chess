import 'package:flutter/material.dart';

class BoardController {
  final int n;
  late List<List<String>> boardMatrix;
  late String currentPlayer;
  String winner = '';

  BoardController({required this.n}) {
    currentPlayer = "Circle";
    boardMatrix = List.generate(n, (_) => List.filled(n, ''));
  }

  void resetBoard() {
    boardMatrix = List.generate(n, (_) => List.filled(n, ''));
    winner = '';
  }

  void markCell(int index) {
    int y = index % n;
    int x = index ~/ n;

    if (boardMatrix[x][y] == '') {
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
      if (sequence && boardMatrix[i][0] != '')
        winner = pieceToPlayer(boardMatrix[i][0]);
    }
  }

  checkColumn() {
    for (int j = 0; j < n; j++) {
      bool sequence = true;
      for (int i = 0; i < n; i++) {
        if (boardMatrix[0][j] != boardMatrix[i][j]) sequence = false;
      }
      if (sequence && boardMatrix[0][j] != '')
        winner = pieceToPlayer(boardMatrix[0][j]);
    }
  }

  checkDiagonal() {
    bool sequence = true;
    for (int i = 0; i < n; i++) {
      if (boardMatrix[0][0] != boardMatrix[i][i]) sequence = false;
    }
    if (sequence && boardMatrix[0][0] != '') {
      winner = pieceToPlayer(boardMatrix[0][0]);
    }

    bool sequence2 = true;
    for (int i = 0; i < n; i++) {
      if (boardMatrix[0][n - 1] != boardMatrix[i][n - 1 - i]) sequence2 = false;
    }
    if (sequence2 && boardMatrix[0][n - 1] != '')
      winner = pieceToPlayer(boardMatrix[0][n - 1]);
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
    if (winner != '') print(winner);
  }
}
