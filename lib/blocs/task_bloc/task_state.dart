// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> tsk;
  final List<Task> removedtsk;
  const TaskState({
    this.tsk = const <Task>[],
    this.removedtsk = const <Task>[],
  });

  @override
  List<Object> get props => [tsk, removedtsk];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tsk': tsk.map((x) => x.toMap()).toList(),
      'removedtsk': removedtsk.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      tsk: List<Task>.from((map['tsk'])?.map<Task>((x) => Task.fromMap(x))),
      removedtsk: List<Task>.from(
          (map['removedtsk'])?.map<Task>((x) => Task.fromMap(x))),
    );
  }
}
