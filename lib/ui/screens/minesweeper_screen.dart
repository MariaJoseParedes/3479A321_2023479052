import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:my_app/models/cell_model.dart';
import 'package:my_app/viewmodels/game_view_model.dart';
import 'package:my_app/viewmodels/settings_view_model.dart';
import 'package:my_app/ui/widgets/mine_cell.dart';
//import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class MinesweeperScreen extends StatelessWidget {
  const MinesweeperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final difficulty = context.watch<SettingsViewModel>().difficulty;
    final viewModel = context.watch<GameViewModel>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.refresh_outlined),
          tooltip: 'Reiniciar juego',
          onPressed: () {
            context.read<GameViewModel>().resetGame();
          },
        ),
        title: Text(
          'Buscaminas',
          style: GoogleFonts.pressStart2p(
            fontSize: 20,
            color: const Color.fromARGB(255, 62, 45, 141),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Acerca de',
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed: () {
              Navigator.pushNamed(context, '/menu');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Área de Status
            Container(
              height: 60,
              color: const Color.fromARGB(175, 156, 94, 143),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/icons/reloj.png', width: 30, height: 30),
                  Text(
                    '${viewModel.secondsElapsed} s',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset('assets/icons/bomba.png', width: 30, height: 30),
                  Text('Minas: 10', style: TextStyle(fontSize: 18)),
                  Image.asset('assets/icons/bloque.png', width: 30, height: 30),
                  Text('Cuadros: 56', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            const Divider(height: 1),
            if (viewModel.isGameOver)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Perdiste',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 175, 33, 23),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            // Área de Juego
            Expanded(
              //Expande el tablero para llenar la pantalla
              child: _gameBoard(viewModel),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'dificultad: $difficulty',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 48, 34, 58),
                ),
              ),
            ), // Aquí llamamos al tablero
          ],
        ),
      ),
    );
  }

  Widget _gameBoard(GameViewModel viewModel) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1.0, // Cuadrado perfecto
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: viewModel.gridSize,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: viewModel.cells.length, // size x size = celdas
            itemBuilder: (context, index) {
              final currentCell = viewModel.cells[index];
              return MineCell(
                cell: currentCell,
                onTap: () => viewModel.revealCell(index),
              ); // Cada celda es un widget
            },
          ),
        ),
      ),
    );
  }
}
