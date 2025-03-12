import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';

class AddTaskDialog extends StatefulWidget {
  final Task? existingTask;
  final Function(String, String) onSave;

  const AddTaskDialog({
    super.key,
    this.existingTask,
    required this.onSave,
  });

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Provider.of<TaskProvider>(context, listen: false)
          .addTask(_title, _description);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New Task'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter title' : null,
              onChanged: (value) => _title = value,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Description'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter description' : null,
              onChanged: (value) => _description = value,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _submit,
          child: const Text('Add Task'),
        ),
      ],
    );
  }
}
