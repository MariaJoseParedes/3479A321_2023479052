import 'dart:math';
import 'package:flutter/material.dart';
import '../models/cell_model.dart';

class GameViewModel extends ChangeNotifier {
  List<CellModel> _cells = [];
  bool _isGameOver = false;
  final int _gridSize = 64;
  final int _bombCount = 10;

  List<CellModel> get cells => _cells;
  bool get isGameOver => _isGameOver;

  GameViewModel() {
    _generateBoard();
  }

  void _generateBoard() {
    _isGameOver = false;
    _cells = List.generate(_gridSize, (i) => CellModel(index: i));

    Random random = Random();
    int bombsPlanted = 0;

    while (bombsPlanted < _bombCount) {
      int randomIndex = random.nextInt(_gridSize);
      if (!_cells[randomIndex].isBomb) {
        _cells[randomIndex].isBomb = true;
        bombsPlanted++;
      }
    }
    notifyListeners(); // Notifica a la UI que el tablero está listo
  }

  void revealCell(int index) {
    // Si ya terminó el juego o la celda ya fue revelada, ignoramos el click
    if (_isGameOver || _cells[index].isRevealed) return;

    _cells[index].isRevealed = true;

    // Si toca una bomba, el juego termina
    if (_cells[index].isBomb) {
      _isGameOver = true;
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
}
