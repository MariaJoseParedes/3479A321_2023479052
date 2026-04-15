import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Acerca de',
          style: GoogleFonts.pressStart2p(
            fontSize: 18,
            color: const Color.fromARGB(255, 66, 62, 119),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              CircleAvatar(
                radius: 48,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: const FaIcon(
                  FontAwesomeIcons.bomb,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Buscaminas',
                textAlign: TextAlign.center,
                style: GoogleFonts.pressStart2p(
                  fontSize: 22,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Desarrollado por Maria Jose Paredes',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Esta aplicación muestra un tablero de Buscaminas creado en Flutter. Puedes jugar, ver el estado del tablero y acceder a esta pantalla de información desde el botón de la esquina superior derecha.',
                style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 24),
              Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Características:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('• Tablero 8x8'),
                      Text('• Iconos personalizados'),
                      Text('• Navegación a una pantalla de información'),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new),
                label: const Text('Regresar al juego'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
