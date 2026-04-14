import 'package:flutter/material.dart';
import 'guardardatosdiccionario.dart';

class CapturaMascotasScreen extends StatefulWidget {
  const CapturaMascotasScreen({super.key});

  @override
  State<CapturaMascotasScreen> createState() => _CapturaMascotasScreenState();
}

class _CapturaMascotasScreenState extends State<CapturaMascotasScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _razaController = TextEditingController();
  final _precioController = TextEditingController();

  void _guardarMascota() {
    if (_formKey.currentState!.validate()) {
      final nombre = _nombreController.text;
      final raza = _razaController.text;
      final precio = double.tryParse(_precioController.text) ?? 0.0;

      // Llamada al agente que guarda los datos
      GuardarDatosDiccionario.guardarMascota(nombre, raza, precio);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mascota guardada con éxito', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black, // Contraste
          behavior: SnackBarBehavior.floating,
        ),
      );

      // Limpiar formulario tras guardar
      _nombreController.clear();
      _razaController.clear();
      _precioController.clear();
      
      // Opcional: Regresar al inicio
      // Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _razaController.dispose();
    _precioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      appBar: AppBar(
        title: const Text('Capturar Mascota', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Ingrese los 3 datos de la mascota (id será automático):',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                _buildTextField(
                  controller: _nombreController,
                  label: 'Nombre de la Mascota',
                  icon: Icons.abc,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _razaController,
                  label: 'Raza',
                  icon: Icons.pets,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese la raza';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _precioController,
                  label: 'Precio',
                  icon: Icons.attach_money,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el precio';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Ingrese un valor numérico válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: _guardarMascota,
                  icon: const Icon(Icons.save, color: Colors.black),
                  label: const Text(
                    'Guardar Datos',
                    style: TextStyle(
                      color: Colors.black, // Texto negro
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE85D04), // Boton color e85d04
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black54),
        prefixIcon: Icon(icon, color: const Color(0xFFE85D04)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black26),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE85D04), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: validator,
    );
  }
}
