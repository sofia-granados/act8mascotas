import 'package:flutter/material.dart';
import 'inicio.dart';
import 'capturamascotas.dart';
import 'vermascotas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Datos Mascota',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE85D04)), // Color naranja especificado
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black), // Texto negro
          bodyLarge: TextStyle(color: Colors.black),
        ),
      ),
      // Configuración de rutas nombradas
      initialRoute: '/',
      routes: {
        '/': (context) => const InicioScreen(),
        '/capturar': (context) => const CapturaMascotasScreen(),
        '/ver': (context) => const VerMascotasScreen(),
      },
    );
  }
}
