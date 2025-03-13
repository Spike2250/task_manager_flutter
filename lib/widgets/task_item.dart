import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';
import './edit_task_dialog.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(task.id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        Provider.of<TaskProvider>(context, listen: false).deleteTask(task.id);
        return false;
      },
      child: CheckboxListTile(
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted 
                ? TextDecoration.lineThrough 
                : TextDecoration.none,
          ),
        ),
        subtitle: Text(task.description),
        value: task.isCompleted,
        onChanged: (value) => Provider.of<TaskProvider>(context, listen: false)
            .toggleTaskStatus(task.id),
        secondary: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () => showDialog(
            context: context,
            builder: (ctx) => EditTaskDialog(
              task: task,
              onSave: (title, desc) => Provider.of<TaskProvider>(context, listen: false)
                .updateTask(task.id, title, desc),
            ),
          ),
        ),
      ),
    );
  }
}
