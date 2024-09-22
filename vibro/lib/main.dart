import 'dart:math';
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
    // Agrega más mensajes aquí
  ];

  final Map<String, String> estadosAnimo = {
    'Feliz': '¡Sigue brillando y disfrutando cada momento!',
    'Triste': 'Es normal sentirse así, recuerda que mañana será un nuevo día.',
    'Enojado': 'Respira profundo, la calma vendrá con el tiempo.',
    'Ansioso': 'Tómate un momento para relajarte y enfocar tus pensamientos.',
    'Motivado': '¡Sigue así! Estás en el camino correcto.',
  };

  String mensajeActual = '';
  String estadoSeleccionado = 'Feliz';

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

  void actualizarMensajePorEstado() {
    setState(() {
      mensajeActual = estadosAnimo[estadoSeleccionado] ?? mensajeActual;
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
            DropdownButton<String>(
              value: estadoSeleccionado,
              onChanged: (String? nuevoEstado) {
                setState(() {
                  estadoSeleccionado = nuevoEstado!;
                });
                actualizarMensajePorEstado();
              },
              items: estadosAnimo.keys.map<DropdownMenuItem<String>>((String estado) {
                return DropdownMenuItem<String>(
                  value: estado,
                  child: Text(estado),
                );
              }).toList(),
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
