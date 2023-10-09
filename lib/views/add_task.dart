import 'package:flutter/material.dart';
import 'package:yours_todo/blocs/bloc_exports.dart';
import 'package:yours_todo/models/task.dart';
import 'package:yours_todo/services/guig_gen.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add Task",
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            autofocus: true,
            controller: title,
            decoration: const InputDecoration(
              label: Text("Add Title"),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    var task = Task(
                      title: title.text,
                      id: GuidDGen.generate(),
                    );
                    context.read<TaskBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                    title.clear();
                  },
                  child: const Text("Add Task")),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancle Task")),
            ],
          ),
        ],
      ),
    );
  }
}
