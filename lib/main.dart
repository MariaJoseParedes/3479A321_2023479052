import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:my_app/ui/screens/about.dart';
import 'package:my_app/ui/screens/minesweeper_screen.dart';
import 'package:my_app/ui/screens/history_screen.dart';
import 'package:my_app/ui/screens/menu_screen.dart';
import 'package:my_app/viewmodels/game_view_model.dart';
import 'package:provider/provider.dart';
import 'core/services/storage_service.dart';
import 'ui/screens/settings_screen.dart';
import 'package:my_app/viewmodels/settings_view_model.dart';

var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageService.init(); // Inicializa el servicio de almacenamiento

  logger.d('Iniciando la aplicación de Buscaminas'); // Debug
  logger.i('Iniciando la aplicación de Buscaminas'); // Info
  logger.w('Iniciando la aplicación de Buscaminas'); // Warning
  logger.e('Iniciando la aplicación de Buscaminas'); // Error

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SettingsViewModel())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => const MenuScreen(),
        '/game': (context) => ChangeNotifierProvider(
          create: (context) => GameViewModel(
            gridSize: context.read<SettingsViewModel>().gridSize,
          ),
          child: const MinesweeperScreen(),
        ),
        '/history': (context) => const HistoryScreen(),
        '/about': (context) => const AboutScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      title: 'Buscaminas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 90, 58, 109),
          primary: const Color.fromARGB(255, 97, 114, 209),
          secondary: const Color.fromARGB(255, 211, 214, 253),
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
      home: ChangeNotifierProvider(
        create: (context) =>
            GameViewModel(gridSize: context.read<SettingsViewModel>().gridSize),
        child: const MinesweeperScreen(),
      ),
    );
  }
}
