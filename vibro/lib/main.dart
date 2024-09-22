import 'dart:math'; // Asegúrate de importar este paquete
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vibro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> mensajes = [
  '¡Tú puedes lograrlo!',
  'Cada día es una nueva oportunidad.',
  'Cree en ti mismo.',
  'El éxito es el resultado de la preparación.',
  'No te rindas, sigue adelante.',
  'Eres más fuerte de lo que piensas.',
  'La confianza en ti mismo es el primer secreto del éxito.',
  'Cada pequeño paso cuenta.',
  'Aprende a amarte a ti mismo, eres único.',
  'Los errores son oportunidades de aprendizaje.',
  'El fracaso es solo un paso hacia el éxito.',
  'Tu voz importa. Hazla escuchar.',
  'La felicidad es un viaje, no un destino.',
  'Eres digno de amor y respeto.',
  'No dejes que nadie apague tu luz.',
  'Tus sueños son válidos.',
  'Hoy es un buen día para empezar de nuevo.',
  'Eres capaz de cosas increíbles.',
  'El amor propio es el comienzo de un romance eterno.',
  'Tu valor no disminuye por la incapacidad de alguien de ver tu valor.',
  'Aprecia tus logros, por pequeños que sean.',
  'La vida es un reflejo de tus pensamientos. Manténlos positivos.',
  'Sé la mejor versión de ti mismo.',
  'Tu felicidad es una prioridad.',
  'No te compares con los demás; tu viaje es único.',
  'La autoconfianza es el primer paso hacia el éxito.',
  'Siempre hay una razón para sonreír.',
  'Eres suficiente, tal como eres.',
  'El amor propio es el primer paso hacia la verdadera felicidad.'
  ];

  String mensajeActual = ''; // Inicializa con un valor por defecto

  @override
  void initState() {
    super.initState();
    mensajeActual = mensajes[Random().nextInt(mensajes.length)];
  }

  void cambiarMensaje() {
    setState(() {
      mensajeActual = mensajes[Random().nextInt(mensajes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¡Bienvenido a Vibro!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mensajeActual,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: cambiarMensaje,
              child: Text('Nuevo Mensaje'),
            ),
          ],
        ),
      ),
    );
  }
}
