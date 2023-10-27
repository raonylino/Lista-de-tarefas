import 'package:flutter/material.dart';
import 'package:flutter_first_project/components/task.dart';
import 'package:flutter_first_project/data/task_inherited.dart';
import 'package:flutter_first_project/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {

const InitialScreen({super.key});
  

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  double level = 0;
  double progress = 0;

  void refreshLevel(){
    setState(() {
      progress = 0;
      level = 0;
      for( var task in TaskInherited.of(context).taskList){
        level += (task.nivel * task.dificuldade)/10;
      }
      progress = level / 100;
    });
  }


  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Listas de Tarefas",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                  child: FilledButton(
                      
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: (){
                        refreshLevel();
                      },
                      child: const Icon(
                        Icons.replay_outlined,
                        color: Colors.white,
                      )),
                )
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      color: Colors.white,
                      value: progress,
                    ),
                  ),
                  Text(
                    'Level ${level}',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              )
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((contextNew) => FormScreen(taskContext: context)),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
