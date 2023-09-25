import 'package:crud_bloc/dashboard/bloc.dart';
import 'package:crud_bloc/dashboard/event.dart';
import 'package:crud_bloc/model/to_do_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dashboard/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ToDoBloc()
                ..add(LoadTodo(todos: [
                  ToDo(
                      id: '1',
                      task: 'Sample 1',
                      description: 'This is test To Do'),
                  ToDo(
                      id: '2',
                      task: 'Sample 2',
                      description: 'This is test To Do')
                ])))
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Dashboard(),
        ));
  }
}
