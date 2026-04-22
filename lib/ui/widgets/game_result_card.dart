import 'package:flutter/material.dart';
import 'package:my_app/models/game_result.dart';

// Widget personalizado para mostrar el resultado de una partida
class GameResultCard extends StatelessWidget {
  final GameResult game;

  const GameResultCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fecha: ${game.date}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: game.isVictory ? const Color.fromARGB(255, 63, 119, 65) : const Color.fromARGB(255, 153, 75, 70),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    game.isVictory ? 'Victoria' : 'Derrota',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Tiempo: ${game.timeSpent}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              'Dificultad: ${game.difficulty}',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
