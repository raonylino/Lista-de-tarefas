import 'package:flutter/material.dart';
import 'package:flutter_first_project/components/task.dart';

class InitialScreen extends StatefulWidget {

  const InitialScreen ({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Listas de Tarefas",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body:AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: const Duration(milliseconds: 2000),
          child: ListView(
            children: const [
              Task("Aprender Flutter",
                  'assets/images/dash.jpg', 3),
              Task(
                  "Meditar",
                  'assets/images/meditar.jpg',
                  2),
              Task(
                  "Estudar Musica",
                  'assets/images/musica.jpg',
                  4),
              Task(
                  "Ensaios",
                  'assets/images/ensaio.jpg',
                  3),
              Task(
                  "Namorar a Ana Beatriz",
                  'assets/images/beatriz.jpg',
                  5),
                  SizedBox(height: 80,)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
             opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
        ),
      );
  }
}
