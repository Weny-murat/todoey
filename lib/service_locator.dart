import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoey/features/task/data/repositories/task_repository.dart';
import 'package:todoey/features/task/presentation/bloc/states.dart';
import 'package:todoey/features/task/presentation/bloc/task_bloc.dart';

final g = GetIt.instance;

Future<void> init() async {
  g.registerFactory(() => TaskBloc(
        g(),
        repository: g(),
      ));

  g.registerLazySingleton(() => TodoTaskListState());
  g.registerLazySingleton(() => TaskRepository(localDataSource: g()));
  g.registerSingletonAsync(() => SharedPreferences.getInstance());
}
