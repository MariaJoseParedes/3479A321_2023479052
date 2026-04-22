import 'package:flutter/material.dart';
import 'package:my_app/models/game_result.dart';
import 'package:my_app/ui/widgets/game_result_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Maqueta de datos para prueba
    final List<GameResult> listMaqueta = [
      GameResult(
        date: '10 Abr',
        timeSpent: '01:20',
        isVictory: true,
        difficulty: 'Fácil',
      ),
      GameResult(
        date: '09 Abr',
        timeSpent: '04:45',
        isVictory: false,
        difficulty: 'Difícil',
      ),
      GameResult(
        date: '08 Abr',
        timeSpent: '02:10',
        isVictory: true,
        difficulty: 'Medio',
      ),
      GameResult(
        date: '07 Abr',
        timeSpent: '03:15',
        isVictory: true,
        difficulty: 'Fácil',
      ),
      GameResult(
        date: '06 Abr',
        timeSpent: '05:30',
        isVictory: false,
        difficulty: 'Difícil',
      ),
      GameResult(
        date: '05 Abr',
        timeSpent: '01:50',
        isVictory: true,
        difficulty: 'Medio',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Historial de Partidas',
          style: GoogleFonts.pressStart2p(
            fontSize: 15,
            color: const Color.fromARGB(255, 62, 45, 141),
          ),
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: listMaqueta.length,
        itemBuilder: (context, index) {
          final game = listMaqueta[index];
          return GameResultCard(game: game);
        },
      ),
    );
  }
}
