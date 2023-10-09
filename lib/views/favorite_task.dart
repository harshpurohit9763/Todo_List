import 'package:flutter/material.dart';
import 'package:yours_todo/blocs/bloc_exports.dart';
import 'package:yours_todo/widgets/list_task.dart';

class FavoriteTaskScreen extends StatelessWidget {
  const FavoriteTaskScreen({super.key});
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
                child: Chip(label: Text("${state.tsk.length} Favorite")),
              ),
              TaskList(taskList: state.tsk)
            ],
          ),
        );
      },
    );
  }
}
