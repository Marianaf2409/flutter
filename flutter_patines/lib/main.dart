import 'package:flutter/material.dart';

void main() => runApp(const PatinesApp());

class PatinesApp extends StatelessWidget {
  const PatinesApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos un proxy para que Pinterest no bloquee la imagen en la web
    const String imageUri = 'https://corsproxy.io/?' + 
        'https://i.pinimg.com/736x/ef/cc/f0/efccf04a02db5bdd529343adcee29739.jpg';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF5F5F7), // Fondo gris seda muy elegante
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth:320), // Ancho máximo tipo móvil
            margin: const EdgeInsets.all(20),
            child: Card(
              elevation: 12, // Sombra profunda para que "flote"
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Bordes súper suaves
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // --- IMAGEN CON DISEÑO ---
                  Stack(
                    children: [
                      Image.network(
                        imageUri,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      // Degradado suave sobre la imagen para que se vea premium
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.black12],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // --- CONTENIDO DE LA CARTA ---
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        const Text(
                          'Solo Patines',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'APRENDE LIBERTAD SOBRE RUEDAS CON ESTILO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent,
                            letterSpacing: 1.5,
                          ),
                        ),
                        
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Divider(color: Color(0xFFEEEEEE), thickness: 1.5),
                        ),

                        // --- FILA DE ICONOS ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildActionIcon(Icons.phone_in_talk_rounded, "Llamar"),
                            _buildActionIcon(Icons.directions_rounded, "Ruta"),
                            _buildActionIcon(Icons.ios_share_rounded, "Compartir"),
                          ],
                        ),
                        
                        const SizedBox(height:10),

                        // --- TEXTO DESCRIPTIVO ---
                        const Text(
                          'Descubre la sensación de deslizarte por la ciudad. Mejoramos tu equilibrio, coordinación y estilo mientras te diviertes.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget personalizado para que los iconos se vean iguales y lindos
  Widget _buildActionIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.pink.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.pinkAccent, size: 26),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.pinkAccent,
          ),
        ),
      ],
    );
  }
}