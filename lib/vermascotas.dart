import 'package:flutter/material.dart';
import 'diccionariomascota.dart';

class VerMascotasScreen extends StatelessWidget {
  const VerMascotasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos una lista a partir del diccionario
    final listMascotas = datosmascota.values.toList();

    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      appBar: AppBar(
        title: const Text('Ver Mascotas', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: listMascotas.isEmpty
          ? const Center(
              child: Text(
                'No hay mascotas registradas\nAún no has añadido datos.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: listMascotas.length,
              itemBuilder: (context, index) {
                final mascota = listMascotas[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 4,
                  shadowColor: const Color(0xFFE85D04).withOpacity(0.5),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: Color(0xFFE85D04), width: 1.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xFFE85D04).withOpacity(0.15),
                        child: const Icon(Icons.pets, color: Color(0xFFE85D04), size: 30),
                      ),
                      title: Text(
                        mascota.nombre,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black, // Texto negro
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ID: ${mascota.id}',
                              style: const TextStyle(color: Colors.black87, fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Raza: ${mascota.raza}',
                              style: const TextStyle(color: Colors.black87, fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Precio: \$${mascota.precio.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
