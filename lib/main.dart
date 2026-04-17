import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; //para los iconos jje
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:my_app/ui/screens/about.dart';
import 'package:my_app/ui/screens/minesweeper_screen.dart';
import 'package:my_app/ui/widgets/mine_cell.dart';
import 'package:my_app/ui/screens/history_screen.dart';
import 'package:my_app/ui/screens/menu_screen.dart';


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
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => const MenuScreen(), 
        '/game': (context) => const MinesweeperScreen(), 
        '/history': (context) => const HistoryScreen(), 
        '/about': (context) => const AboutScreen(),     
        },
      title: 'Buscaminas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 90, 58, 109),
          primary: const Color.fromARGB(255, 97, 114, 209),
          secondary: const Color.fromARGB(255, 143, 149, 247),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(
          255,
          121,
          160,
          243,
        ), // Fondo por defecto
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        useMaterial3: true,
      ),
      home: const MinesweeperScreen(), // Apunta a tu nueva pantalla
    );
  }
}
