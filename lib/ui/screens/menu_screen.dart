import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/viewmodels/settings_view_model.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsVM = context.watch<SettingsViewModel>();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ), // Margen para el diseño expandido
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.grid_on, size: 80, color: Colors.deepPurple), //
              const SizedBox(height: 16), //
              // Texto de saludo con formato estilizado
              Text(
                //
                '¡Hola, ${settingsVM.username}!', //
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ), //
              ), //
              const SizedBox(height: 32), //
              // Tarjeta de Información de Ajustes
              Card(
                //
                elevation: 4, //
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ), //
                child: Padding(
                  //
                  padding: const EdgeInsets.all(8.0), //
                  child: Column(
                    //
                    children: [
                      //
                      const Text(
                        'Configuración Actual',
                        style: TextStyle(color: Colors.grey),
                      ), //
                      const Divider(), //
                      ListTile(
                        //
                        leading: const Icon(
                          Icons.dashboard,
                          color: Colors.deepPurple,
                        ), //
                        title: Text('Dificultad: ${settingsVM.difficulty}'), //
                        subtitle: Text(
                          'Tablero de ${settingsVM.gridSize}x${settingsVM.gridSize}',
                        ), //
                        trailing: IconButton(
                          //
                          icon: const Icon(Icons.edit), //
                          onPressed: () =>
                              Navigator.pushNamed(context, '/settings'), //
                        ), //
                      ), //
                    ], //
                  ), //
                ), //
              ), //

              const SizedBox(height: 40), //
              // Botón Jugar (NUEVA PARTIDA) con el nuevo estilo e icono
              SizedBox(
                //
                width: double.infinity, //
                height: 50, //
                child: ElevatedButton.icon(
                  //
                  icon: const Icon(Icons.play_arrow, size: 28), //
                  label: const Text(
                    'NUEVA PARTIDA',
                    style: TextStyle(fontSize: 18),
                  ), //
                  style: ElevatedButton.styleFrom(
                    //
                    backgroundColor: Colors.deepPurple, //
                    foregroundColor: Colors.white, //
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ), //
                  ), //
                  onPressed: () => Navigator.pushNamed(context, '/game'), //
                ), //
              ), //

              const SizedBox(height: 16), //
              // Botón de Historial (Ahora estilizado como TextButton en el pie)
              TextButton.icon(
                //
                icon: const Icon(Icons.history), //
                label: const Text('Ver Historial'), //
                onPressed: () => Navigator.pushNamed(context, '/history'), //
              ), //
            ],
          ),
        ),
      ),
    );
  }
}
