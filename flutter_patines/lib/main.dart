import 'package:flutter/material.dart';

void main() => runApp(const PatinesApp());

class PatinesApp extends StatelessWidget {
  const PatinesApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String imageUri = 'https://corsproxy.io/?' + 
        'https://i.pinimg.com/736x/ef/cc/f0/efccf04a02db5bdd529343adcee29739.jpg';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              // 1. IMAGEN
              Image.network(
                imageUri,
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 20),

              // 2. TÍTULO Y ESTRELLITA EN LA MISMA LÍNEA
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // Esto empuja el título a la izquierda y la estrella a la derecha
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Solo Patines',
                          style: TextStyle(
                            fontSize: 26, 
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Estrellita al nivel del texto, pero al otro lado
                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.orange, size: 20),
                            SizedBox(width: 4),
                            Text(
                              '4.9', 
                              style: TextStyle(fontSize: 16, color: Colors.black54)
                            ),
                          ],
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 5),

                    // 3. SUBTÍTULO (A un lado)
                    const Text(
                      'El patinaje es para todos los que quieran aprender libertad sobre ruedas',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // 4. ICONOS CON TEXTO DEBAJO (Call, Route, Share)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconButton(Icons.phone, 'Call'),
                  _buildIconButton(Icons.near_me, 'Route'),
                  _buildIconButton(Icons.share, 'Share'),
                ],
              ),

              const SizedBox(height: 30),

              // 5. DESCRIPCIÓN
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'El patinaje es una actividad recreativa y deportiva que consiste en deslizarse sobre una superficie regular mediante unos patines colocados en los pies. Es un ejercicio completo que mejora el equilibrio.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, height: 1.4),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 28),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}