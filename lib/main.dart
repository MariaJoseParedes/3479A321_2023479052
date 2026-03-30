import 'package:flutter/material.dart';

void main() {
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
      appBar: AppBar(title: const Text('Buscaminas')),
      body: SafeArea(
        child: Column(
          children: [
            // Área de Status
            Container(
              height: 60,
              color: const Color.fromARGB(176, 224, 224, 224),
              child: const Center(
                child: Text(
                  'STATUS: 349 segundos | Minas: 10 | Cuadros: 56',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
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
        color: const Color.fromARGB(255, 38, 107, 69),
        border: Border.all(
          color: const Color.fromARGB(255, 50, 104, 62),
          width: 1.5,
        ),
      ),
    );
  }
}
