import 'clasmascota.dart';
import 'diccionariomascota.dart';

class GuardarDatosDiccionario {
  // Agente para modificar y guardar en diccionariomascota
  static void guardarMascota(String nombre, String raza, double precio) {
    // Generar ID autonumérico
    int newId = 1;
    if (datosmascota.isNotEmpty) {
      newId = datosmascota.keys.reduce((curr, next) => curr > next ? curr : next) + 1;
    }
    
    final nuevaMascota = Mascota(
      id: newId,
      nombre: nombre,
      raza: raza,
      precio: precio,
    );
    
    // Guardar en el diccionario conforme se van registrando
    datosmascota[newId] = nuevaMascota;
  }
}
