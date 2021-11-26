import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/features/task/presentation/bloc/task_bloc.dart';
import 'package:todoey/features/task/presentation/screens/task_screen.dart';
import 'service_locator.dart' as serviceLocator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init service locator
  await serviceLocator.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocProvider<TaskBloc>(
      create: (BuildContext context) => serviceLocator.g<TaskBloc>(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TaskScreen()),
    );
  }
}
