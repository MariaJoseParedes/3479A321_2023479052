import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; //para los iconos jje
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

var logger = Logger();

void main() {
  logger.d('Iniciando la aplicación de Buscaminas'); // Debug
  logger.i('Iniciando la aplicación de Buscaminas'); // Info
  logger.w('Iniciando la aplicación de Buscaminas'); // Warning
  logger.e('Iniciando la aplicación de Buscaminas'); // Error
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscaminas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MinesweeperScreen(), // Apuntamos a nuestra nueva pantalla
    );
  }
}

class MinesweeperScreen extends StatelessWidget {
  const MinesweeperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buscaminas',
          style: GoogleFonts.pressStart2p(fontSize: 20, color: Colors.pink),
        ),
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
                children: const [
                  Icon(
                    Icons.hourglass_top_sharp,
                    color: Color.fromARGB(255, 168, 72, 152),
                  ),
                  Text(
                    '349 s',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    FontAwesomeIcons.bomb,
                    color: Color.fromARGB(255, 173, 89, 152),
                  ),
                  Text('Minas: 10', style: TextStyle(fontSize: 18)),
                  Icon(Icons.stop, color: Color.fromARGB(255, 159, 72, 167)),
                  Text('Cuadros: 56', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            const Divider(height: 1),
            // Área de Juego
            Expanded(
              //Expande el tablero para llenar la pantalla
              child: _gameBoard(),
            ), // Aquí llamamos al tablero
          ],
        ),
      ),
    );
  }

  Widget _gameBoard() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1.0, // Cuadrado perfecto
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8, // 8 columnas
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: 64, // 8x8 = 64 celdas
            itemBuilder: (context, index) {
              return MineCell(index: index); // Cada celda es un widget
            },
          ),
        ),
      ),
    );
  }
}

class MineCell extends StatelessWidget {
  final int index;
  const MineCell({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 184, 88, 125),
        border: Border.all(
          color: const Color.fromARGB(255, 16, 37, 21),
          width: 1.5,
        ),
      ),
    );
  }
}
