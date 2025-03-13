import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../providers/theme_provider.dart';
import '../theme/theme_extensions.dart';
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
      body: Container(
        decoration: BoxDecoration(
          gradient: Theme.of(context).extension<GradientExtension>()?.gradient ?? 
                    LinearGradient(colors: [Colors.blue.shade100, Colors.blue.shade300]),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                icon: Icon(Icons.add, color: Theme.of(context).extension<AccentColorExtension>()?.color ?? Colors.blueAccent),
                label: Text('Add Task', 
                  style: TextStyle(
                      color: Theme.of(context).extension<AccentColorExtension>()?.color ?? Colors.blueAccent,
                    fontWeight: FontWeight.bold
                  )
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (ctx) => AddTaskDialog(
                    onSave: (title, desc) => Provider.of<TaskProvider>(context, listen: false)
                        .addTask(title, desc),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.2),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: Theme.of(context).extension<AccentColorExtension>()?.color ?? Colors.blueAccent,
                      width: 2
                    )
                  )
                ),
              ),
            ),
            const Expanded(
              child: TaskList(),
            ),
          ],
        ),
      ),
    );
  }
}
