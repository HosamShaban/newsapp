import 'package:flutter/material.dart';
import 'package:newsapp/todo_app/data/tasks_data.dart';
import 'package:newsapp/todo_app/pages/todo_home_page.dart';
import 'package:newsapp/todo_app/models/task_model.dart';

class TaskWidget extends StatefulWidget {
  Function fun;
  Task task;
  TaskWidget(this.task, this.fun, {Key? key}) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();

}

class _TaskWidgetState extends State<TaskWidget> {
  void deleteTask(Task task) {
    setState(() {
      tasksList.remove(task);
    });
  }

  
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(
    margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: widget.task.isCompleted ? Colors.green : Colors.black45,
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),


      child: CheckboxListTile(
        secondary:IconButton(alignment: Alignment.centerLeft,
        icon: const Icon(Icons.delete , color: Colors.redAccent,size: 25.0,),
        onPressed: (){
          deleteTask(widget.task);
        }
        ),
        title: Text(widget.task.title),
        value: widget.task.isCompleted,
        onChanged: (v) {
          widget.fun(widget.task);
        },
      ),
    );

  }
}
