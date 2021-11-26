import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoey/features/task/data/datasources/lds_shared_pref_impl.dart';
import 'package:todoey/features/task/data/datasources/local_data_source.dart';
import 'package:todoey/features/task/data/repositories/task_repository.dart';
import 'package:todoey/features/task/domain/repository_contracts/task_repository_contract.dart';
import 'package:todoey/features/task/presentation/bloc/states.dart';
import 'package:todoey/features/task/presentation/bloc/task_bloc.dart';

final g = GetIt.instance;

Future<void> init() async {
  g.registerFactory(() => TaskBloc(
        TasksInitialState(),
        repository: g(),
      ));

  g.registerLazySingleton(() => TodoTaskListState());
  g.registerLazySingleton<TaskRepositoryContract>(
      () => TaskRepository(localDataSource: g()));
  g.registerLazySingleton<LocalDataSource>(
      () => TodoTaskLDSSharedPreferences(sharedPreferences: g()));
  final sharedPreferences = await SharedPreferences.getInstance();
  g.registerLazySingleton(() => sharedPreferences);
}
