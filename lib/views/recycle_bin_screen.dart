import 'package:flutter/material.dart';
import 'package:yours_todo/blocs/bloc_exports.dart';
import 'package:yours_todo/views/my_drawer.dart';
import 'package:yours_todo/widgets/list_task.dart';

class RecycleBinScreen extends StatelessWidget {
  const RecycleBinScreen({super.key});
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            title: const Text("Recycle Bin"),
            centerTitle: true,
          ),
          drawer: const MyDrawer(),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Chip(
                    label: Text(
                      "${state.removedtsk.length} Recycle bin",
                    ),
                  ),
                ),
                TaskList(taskList: state.removedtsk)
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: "Add A Task",
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
