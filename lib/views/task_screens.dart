import 'package:flutter/material.dart';
import 'package:yours_todo/blocs/bloc_exports.dart';
import 'package:yours_todo/widgets/list_task.dart';

class PendingTaskScreen extends StatelessWidget {
  const PendingTaskScreen({super.key});
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Chip(label: Text("${state.tsk.length} Tasks")),
              ),
              TaskList(taskList: state.tsk)
            ],
          ),
        );
      },
    );
  }
}
