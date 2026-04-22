import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
          style: GoogleFonts.pressStart2p(
            color: const Color.fromARGB(255, 62, 45, 141),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        // Usamos Column para poner un widget debajo de otro
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 60),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () => Navigator.pushNamed(context, '/history'),
              child: const Text('Ir a Historial'),
            ),

            const SizedBox(height: 15), // Espacio entre botones

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 60),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                '/game',
                arguments: {'difficulty': 'Facil', 'gridSize': 8},
              ),
              child: const Text('Ir al juego'),
            ),
          ],
        ),
      ),
    );
  }
}
