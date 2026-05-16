import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/core/services/storage_service.dart';
import 'package:my_app/viewmodels/settings_view_model.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsViewModel>();
    //var username = StorageService.getUsername();

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
            Text('Hola ${settings.username}'),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 60),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () async {
                // Espera a que el usuario interactúe con la pantalla de ajustes
                await Navigator.pushNamed(context, '/settings');
                // Al regresar, si el menú sigue montado, refresca el estado localmente
                if (context.mounted) {
                  context.read<SettingsViewModel>().refreshSettings();
                }
              },
              child: const Text('Ir a Ajustes'),
            ),

            // Espacio entre el texto y el botón
            const SizedBox(height: 20), // Espacio entre el texto y el botón
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
                arguments: {
                  'difficulty': settings.difficulty,
                  'gridSize': settings.gridSize,
                },
              ),
              child: const Text('Ir al juego'),
            ),
          ],
        ),
      ),
    );
  }
}
