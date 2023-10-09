import 'package:equatable/equatable.dart';
import 'package:yours_todo/blocs/bloc_exports.dart';
import 'package:yours_todo/models/task.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(addTask);
    on<UpdateTask>(updateTask);
    on<DeleteTask>(deleteTask);
    on<RemoveTask>(removeTask);
  }

  void addTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      tsk: List.from(state.tsk)..add(event.task),
      removedtsk: state.removedtsk,
    ));
  }

  void deleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
        tsk: state.tsk,
        removedtsk: List.from(state.removedtsk)..remove(event.task),
      ),
    );
  }

  void removeTask(RemoveTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
        tsk: List.from(state.tsk)..remove(event.task),
        removedtsk: List.from(state.removedtsk)
          ..add(event.task.copyWith(isDeleted: true)),
      ),
    );
  }

  void updateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    int index = state.tsk.indexOf(task);
    List<Task> allTask = List.from(state.tsk)..remove(task);
    task.isDone == false
        ? allTask.insert(index, task.copyWith(isDone: true))
        : allTask.insert(index, task.copyWith(isDone: false));

    emit(TaskState(
      tsk: allTask,
      removedtsk: state.removedtsk,
    ));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
