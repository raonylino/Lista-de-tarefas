
import 'package:flutter/material.dart';
import 'package:flutter_first_project/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited ({
    Key? key,
    required Widget child,
  }) :super (key: key,child: child);

  final List<Task> taskList = [
      Task("Aprender Flutter", 'assets/images/dash.jpg', 3),
      Task("Meditar", 'assets/images/meditar.jpg', 1),
      Task("Estudar Musica", 'assets/images/musica.jpg', 4),
      Task("Ensaios", 'assets/images/ensaio.jpg', 2),
      Task("Namorar a Ana Beatriz", 'assets/images/beatriz.jpg', 5),
  ];

  void newTask(String nome,String photo, int difficulty){
    taskList.add(Task(nome, photo,difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }


}