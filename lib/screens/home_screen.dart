import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/task_list.dart';
import '../widgets/add_task_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Task Manager')),
        actions: [
          Consumer<ThemeProvider>(
            builder: (ctx, themeProvider, _) => IconButton(
              icon: Icon(themeProvider.isDarkMode 
                  ? Icons.light_mode 
                  : Icons.dark_mode),
              onPressed: () => themeProvider.toggleTheme(),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Add Task'),
              onPressed: () => showDialog(
                context: context,
                builder: (ctx) => AddTaskDialog(
                  onSave: (title, desc) => Provider.of<TaskProvider>(context, listen: false)
                      .addTask(title, desc),
                ),
              ),
            ),
          ),
          const Expanded(child: TaskList()),
        ],
      ),
    );
  }
}
