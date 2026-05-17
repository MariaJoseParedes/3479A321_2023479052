import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import '../models/cell_model.dart';

class GameViewModel extends ChangeNotifier {
  List<CellModel> _cells = [];
  bool _isGameOver = false;
  final int gridSize;
  late int totalCells;

  final int _bombCount = 10;

  Timer? _timer;
  int secondsElapsed = 0;
  bool _isFirstTap = true;

  List<CellModel> get cells => _cells;
  bool get isGameOver => _isGameOver;

  GameViewModel({required this.gridSize}) {
    totalCells = gridSize * gridSize; // Ej: 10x10 = 100 celdas
    _generateBoard();
  }

  void _generateBoard() {
    _isGameOver = false;
    _timer?.cancel();
    secondsElapsed = 0;
    _isFirstTap = true;
    _cells = List.generate(totalCells, (i) => CellModel(index: i));

    Random random = Random();
    int bombsPlanted = 0;

    while (bombsPlanted < _bombCount) {
      int randomIndex = random.nextInt(totalCells);
      if (!_cells[randomIndex].isBomb) {
        _cells[randomIndex].isBomb = true;
        bombsPlanted++;
      }
    }

    _calculateAdjacentMines();
    notifyListeners(); // Notifica a la UI que el tablero está listo
  }

  void _calculateAdjacentMines() {
    for (int i = 0; i < _cells.length; i++) {
      if (_cells[i].isBomb) continue;

      int row = i ~/ gridSize;
      int col = i % gridSize;
      int count = 0;

      for (int r = -1; r <= 1; r++) {
        for (int c = -1; c <= 1; c++) {
          if (r == 0 && c == 0) continue;
          int newRow = row + r;
          int newCol = col + c;

          if (newRow >= 0 &&
              newRow < gridSize &&
              newCol >= 0 &&
              newCol < gridSize) {
            int neighborIndex = (newRow * gridSize) + newCol;
            if (_cells[neighborIndex].isBomb) count++;
          }
        }
      }
      _cells[i].adjacentMines = count;
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsElapsed++;
      notifyListeners();
    });
  }

  void revealCell(int index) {
    // Si ya terminó el juego o la celda ya fue revelada, ignoramos el click
    if (_isGameOver || _cells[index].isRevealed) return;

    if (_isFirstTap) {
      _startTimer();
      _isFirstTap = false;
    }

    _cells[index].isRevealed = true;

    // Si toca una bomba, el juego termina
    if (_cells[index].isBomb) {
      _isGameOver = true;
      _timer?.cancel();
      _revealAll();
    }

    // Notificar a los suscriptores (reemplaza al setState)
    notifyListeners();
  }

  // Revela todo el tablero cuando se pierde
  void _revealAll() {
    for (var cell in _cells) {
      cell.isRevealed = true;
    }
  }

  // Acción para reiniciar el juego
  void resetGame() {
    _generateBoard();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancela el temporizador activo
    super.dispose(); // Llama a la clase padre obligatoriamente
  }
}
