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
  final Map<String, List<String>> estadosAnimo = {
    '😄 Feliz': [
      '¡Sigue brillando y disfrutando cada momento!',
      'La felicidad es contagiosa, ¡compártela!',
      'Celebra tus pequeños logros.',
      'Sonríe, hoy es un buen día.',
      'Haz algo que te haga sentir bien.',
      'La vida es hermosa, ¡aprovéchala al máximo!'
    ],
    '😢 Triste': [
      'Es normal sentirse así, recuerda que mañana será un nuevo día.',
      'Permítete sentir y luego sigue adelante.',
      'Las nubes no duran para siempre.',
      'Busca un poco de luz en tu día.',
      'Está bien pedir ayuda cuando la necesites.',
      'Recuerda que cada día es una nueva oportunidad.'
    ],
    '😠 Enojado': [
      'Respira profundo, la calma vendrá con el tiempo.',
      'Transforma tu enojo en energía positiva.',
      'Recuerda que lo que importa es tu paz interior.',
      'Permítete un momento para relajarte.',
      'Encuentra algo que te haga reír.',
      'Deja ir lo que no puedes controlar.'
    ],
    '😟 Ansioso': [
      'Tómate un momento para relajarte y enfocar tus pensamientos.',
      'Recuerda que el momento presente es todo lo que tienes.',
      'Haz una pausa y respira profundamente.',
      'Es normal sentirse así, está bien pedir apoyo.',
      'Divídelo en pasos pequeños y manejables.',
      'Confía en el proceso, todo estará bien.'
    ],
    '💪 Motivado': [
      '¡Sigue así! Estás en el camino correcto.',
      'Cada pequeño paso te acerca a tu meta.',
      'Tu esfuerzo no es en vano, sigue avanzando.',
      'Cree en ti mismo, ¡eres capaz de lograrlo!',
      'El éxito es la suma de pequeños esfuerzos.',
      'No dejes que los desafíos te detengan.'
    ]
  };

  String mensajeActual = '';
  String estadoSeleccionado = '😄 Feliz';

  @override
  void initState() {
    super.initState();
    actualizarMensajePorEstado();
  }

  void cambiarMensaje() {
    setState(() {
      mensajeActual = estadosAnimo[estadoSeleccionado]![Random().nextInt(estadosAnimo[estadoSeleccionado]!.length)];
    });
  }

  void actualizarMensajePorEstado() {
    setState(() {
      mensajeActual = estadosAnimo[estadoSeleccionado]![Random().nextInt(estadosAnimo[estadoSeleccionado]!.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¡Bienvenido a Vibro!', style: TextStyle(fontFamily: 'Roboto', fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Bienvenido a Vibro!\n\n¿Cómo te sientes hoy?\nElige tu estado de ánimo y aparecerá un mensaje para ti.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blueGrey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              mensajeActual,
              style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic, color: Colors.deepPurple),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: estadoSeleccionado,
              onChanged: (String? nuevoEstado) {
                setState(() {
                  estadoSeleccionado = nuevoEstado!;
                  actualizarMensajePorEstado();
                });
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
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
