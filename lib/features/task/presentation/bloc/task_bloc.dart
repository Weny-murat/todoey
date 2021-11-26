import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/core/usecase/usecase.dart';
import 'package:todoey/features/task/domain/repository_contracts/task_repository_contract.dart';
import 'package:todoey/features/task/domain/usecases/usecases.dart' as usecases;
import 'package:todoey/features/task/presentation/bloc/events.dart';
import 'package:todoey/features/task/presentation/bloc/states.dart';

class TaskBloc extends Bloc<TodoTaskEvent, TodoTaskListState> {
  TaskRepositoryContract repository;
  TaskBloc(TodoTaskListState initialState, {required this.repository})
      : super(initialState) {
    on<LoadTasks>((event, emit) async {
      emit(TasksLoading());
      var usecase = usecases.GetTaskList(repository);
      var result = await usecase(NoParams());
      result.fold(
        (l) {
          emit(TasksNotLoaded());
        },
        (r) {
          emit(TasksLoaded(r));
        },
      );
    });
    on<AddTask>((event, emit) async {
      var usecase = usecases.AddTask(repository);
      var result = await usecase(AddTaskParams(event.taskName));
      result.fold(
        (l) {
          emit(TasksNotLoaded());
        },
        (r) {
          state.tasks.add(r);
          emit(TasksLoaded(state.tasks));
        },
      );
    });
    /*on<UpdateTask>((event, emit) {
      var usecase = usecases.(repository);
      var result = await usecase(AddTaskParams(event.taskName));
      result.fold(
        (l) {
          emit(TasksNotLoaded());
        },
        (r) {
          state.tasks.add(r);
          emit(TasksLoaded(state.tasks));
        },
      );
    });*/
    on<DeleteTask>((event, emit) async {
      var usecase = usecases.DeleteTask(repository);
      var result = await usecase(DeleteTaskParams(event.task.id));
      result.fold(
        (l) {
          emit(TasksNotLoaded());
        },
        (r) {
          state.tasks.removeWhere((element) => element.id == event.task.id);
          emit(TasksLoaded(state.tasks));
        },
      );
    });
  }
}
