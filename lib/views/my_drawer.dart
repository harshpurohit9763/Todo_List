import 'package:flutter/material.dart';
import 'package:yours_todo/blocs/bloc_exports.dart';
import 'package:yours_todo/views/recycle_bin_screen.dart';
import 'package:yours_todo/views/task_screens.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            color: Colors.blue,
            child: Text(
              "Task Drawer",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(PendingTaskScreen.id);
                },
                child: ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text("My Tasks"),
                  trailing: Text(state.tsk.length.toString()),
                ),
              );
            },
          ),
          const Divider(),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RecycleBinScreen.id);
                },
                child: ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text("Recycle Bin"),
                  trailing: Text(state.removedtsk.length.toString()),
                ),
              );
            },
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Switch(
                  value: state.switchValue,
                  onChanged: (value) {
                    value
                        ? context.read<SwitchBloc>().add(SwitchOnEvent())
                        : context.read<SwitchBloc>().add(SwitchOffEvent());
                  });
            },
          )
        ],
      ),
    );
  }
}
