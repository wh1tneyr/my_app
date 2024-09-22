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
    'No te rindas, sigue adelante.'
  ];

  String mensajeActual;

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
